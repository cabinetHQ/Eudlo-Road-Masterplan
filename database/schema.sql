-- Project Zero database foundation
-- Draft PostgreSQL/PostGIS schema for the Eudlo App.

CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE locations (
  location_id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  location_type TEXT NOT NULL,
  parent_location_id TEXT,
  latitude NUMERIC(10, 7),
  longitude NUMERIC(10, 7),
  elevation_m NUMERIC(10, 2),
  accuracy_m NUMERIC(10, 2),
  gis_feature_id TEXT,
  description TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE suppliers (
  supplier_id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  supplier_type TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'TBD',
  contact_name TEXT,
  email TEXT,
  phone TEXT,
  website TEXT,
  abn TEXT,
  address TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE assets (
  asset_id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  subcategory TEXT,
  status TEXT NOT NULL DEFAULT 'TBD',
  description TEXT,
  capacity TEXT,
  serial_number TEXT,
  installation_date DATE,
  expected_life TEXT,
  replacement_cost NUMERIC(14, 2),
  maintenance_interval TEXT,
  supplier_id TEXT REFERENCES suppliers(supplier_id),
  warranty_end_date DATE,
  depreciation_class TEXT,
  insurance_value NUMERIC(14, 2),
  location_id TEXT REFERENCES locations(location_id),
  primary_gis_feature_id TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE documents (
  document_id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  document_type TEXT NOT NULL,
  storage_uri TEXT NOT NULL,
  source_file TEXT,
  received_date DATE,
  issue_date DATE,
  expiry_date DATE,
  supplier_id TEXT REFERENCES suppliers(supplier_id),
  ocr_text TEXT,
  summary TEXT,
  version TEXT,
  checksum TEXT,
  status TEXT NOT NULL DEFAULT 'TBD',
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE gis_features (
  gis_feature_id TEXT PRIMARY KEY,
  layer_type TEXT NOT NULL,
  name TEXT,
  geometry_type TEXT NOT NULL,
  geometry geometry(Geometry, 4326),
  source TEXT,
  capture_date DATE,
  accuracy_m NUMERIC(10, 2),
  status TEXT NOT NULL DEFAULT 'TBD',
  asset_id TEXT REFERENCES assets(asset_id),
  location_id TEXT REFERENCES locations(location_id),
  document_id TEXT REFERENCES documents(document_id),
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE locations
  ADD CONSTRAINT locations_parent_location_fk
  FOREIGN KEY (parent_location_id) REFERENCES locations(location_id);

ALTER TABLE locations
  ADD CONSTRAINT locations_gis_feature_fk
  FOREIGN KEY (gis_feature_id) REFERENCES gis_features(gis_feature_id);

ALTER TABLE assets
  ADD CONSTRAINT assets_primary_gis_feature_fk
  FOREIGN KEY (primary_gis_feature_id) REFERENCES gis_features(gis_feature_id);

CREATE TABLE asset_relationships (
  asset_relationship_id TEXT PRIMARY KEY,
  source_asset_id TEXT NOT NULL REFERENCES assets(asset_id),
  target_asset_id TEXT NOT NULL REFERENCES assets(asset_id),
  relationship_type TEXT NOT NULL,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE projects (
  project_id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  project_type TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'TBD',
  owner TEXT,
  start_date DATE,
  target_date DATE,
  budget NUMERIC(14, 2),
  actual_cost NUMERIC(14, 2),
  priority_score NUMERIC(5, 2),
  parent_project_id TEXT REFERENCES projects(project_id),
  description TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE project_assets (
  project_asset_id TEXT PRIMARY KEY,
  project_id TEXT NOT NULL REFERENCES projects(project_id),
  asset_id TEXT NOT NULL REFERENCES assets(asset_id),
  relationship_type TEXT NOT NULL,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (project_id, asset_id, relationship_type)
);

CREATE TABLE decisions (
  decision_id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  status TEXT NOT NULL,
  decision_date DATE,
  decision_text TEXT NOT NULL,
  context TEXT,
  rationale TEXT,
  consequences TEXT,
  source_file TEXT,
  owner TEXT,
  review_date DATE,
  supersedes_decision_id TEXT REFERENCES decisions(decision_id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE actions (
  action_id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'Open',
  owner TEXT,
  due_date DATE,
  priority TEXT,
  notes TEXT,
  source TEXT,
  completed_at TIMESTAMPTZ,
  parent_action_id TEXT REFERENCES actions(action_id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE entity_links (
  entity_link_id TEXT PRIMARY KEY,
  source_entity_type TEXT NOT NULL,
  source_entity_id TEXT NOT NULL,
  target_entity_type TEXT NOT NULL,
  target_entity_id TEXT NOT NULL,
  link_type TEXT NOT NULL,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE photos (
  photo_id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  storage_uri TEXT NOT NULL,
  captured_at TIMESTAMPTZ,
  latitude NUMERIC(10, 7),
  longitude NUMERIC(10, 7),
  direction TEXT,
  asset_id TEXT REFERENCES assets(asset_id),
  location_id TEXT REFERENCES locations(location_id),
  gis_feature_id TEXT REFERENCES gis_features(gis_feature_id),
  description TEXT,
  tags TEXT[],
  checksum TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE drawings (
  drawing_id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  drawing_type TEXT NOT NULL,
  revision TEXT NOT NULL,
  storage_uri TEXT NOT NULL,
  asset_id TEXT REFERENCES assets(asset_id),
  project_id TEXT REFERENCES projects(project_id),
  location_id TEXT REFERENCES locations(location_id),
  gis_feature_id TEXT REFERENCES gis_features(gis_feature_id),
  author TEXT,
  issue_date DATE,
  status TEXT NOT NULL DEFAULT 'TBD',
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE quotes (
  quote_id TEXT PRIMARY KEY,
  supplier_id TEXT NOT NULL REFERENCES suppliers(supplier_id),
  title TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'TBD',
  received_date DATE,
  expiry_date DATE,
  project_id TEXT REFERENCES projects(project_id),
  asset_id TEXT REFERENCES assets(asset_id),
  gross_cost NUMERIC(14, 2),
  net_cost NUMERIC(14, 2),
  stc_value NUMERIC(14, 2),
  battery_incentive_value NUMERIC(14, 2),
  scope_summary TEXT,
  exclusions TEXT,
  document_id TEXT REFERENCES documents(document_id),
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE grants (
  grant_id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  jurisdiction TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'TBD',
  program_url TEXT,
  opens_at DATE,
  closes_at DATE,
  eligible_items TEXT,
  excluded_items TEXT,
  project_id TEXT REFERENCES projects(project_id),
  asset_id TEXT REFERENCES assets(asset_id),
  document_id TEXT REFERENCES documents(document_id),
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE loans (
  loan_id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  loan_type TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'TBD',
  lender_supplier_id TEXT REFERENCES suppliers(supplier_id),
  project_id TEXT REFERENCES projects(project_id),
  principal NUMERIC(14, 2),
  rate NUMERIC(8, 5),
  term_months INTEGER,
  fees NUMERIC(14, 2),
  repayment_amount NUMERIC(14, 2),
  document_id TEXT REFERENCES documents(document_id),
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE maintenance_events (
  maintenance_event_id TEXT PRIMARY KEY,
  asset_id TEXT NOT NULL REFERENCES assets(asset_id),
  event_type TEXT NOT NULL,
  event_date DATE NOT NULL,
  supplier_id TEXT REFERENCES suppliers(supplier_id),
  cost NUMERIC(14, 2),
  description TEXT,
  next_due_date DATE,
  document_id TEXT REFERENCES documents(document_id),
  photo_id TEXT REFERENCES photos(photo_id),
  status TEXT NOT NULL DEFAULT 'TBD',
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE financial_events (
  financial_event_id TEXT PRIMARY KEY,
  event_type TEXT NOT NULL,
  amount NUMERIC(14, 2) NOT NULL,
  currency TEXT NOT NULL DEFAULT 'AUD',
  event_date DATE NOT NULL,
  category TEXT,
  asset_id TEXT REFERENCES assets(asset_id),
  project_id TEXT REFERENCES projects(project_id),
  supplier_id TEXT REFERENCES suppliers(supplier_id),
  document_id TEXT REFERENCES documents(document_id),
  loan_id TEXT REFERENCES loans(loan_id),
  grant_id TEXT REFERENCES grants(grant_id),
  maintenance_event_id TEXT REFERENCES maintenance_events(maintenance_event_id),
  tax_treatment TEXT,
  payment_method TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE financial_scenarios (
  financial_scenario_id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  scenario_type TEXT NOT NULL,
  project_id TEXT REFERENCES projects(project_id),
  asset_id TEXT REFERENCES assets(asset_id),
  quote_id TEXT REFERENCES quotes(quote_id),
  loan_id TEXT REFERENCES loans(loan_id),
  assumptions_json JSONB,
  roi NUMERIC(10, 4),
  payback_years NUMERIC(10, 2),
  npv NUMERIC(14, 2),
  irr NUMERIC(10, 4),
  risk_notes TEXT,
  source_file TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE insurance_records (
  insurance_record_id TEXT PRIMARY KEY,
  record_type TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'TBD',
  asset_id TEXT REFERENCES assets(asset_id),
  supplier_id TEXT REFERENCES suppliers(supplier_id),
  policy_number TEXT,
  insured_value NUMERIC(14, 2),
  renewal_date DATE,
  document_id TEXT REFERENCES documents(document_id),
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE permits (
  permit_id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  permit_type TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'TBD',
  authority TEXT,
  project_id TEXT REFERENCES projects(project_id),
  asset_id TEXT REFERENCES assets(asset_id),
  location_id TEXT REFERENCES locations(location_id),
  gis_feature_id TEXT REFERENCES gis_features(gis_feature_id),
  issue_date DATE,
  expiry_date DATE,
  document_id TEXT REFERENCES documents(document_id),
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE sensors (
  sensor_id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  sensor_type TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'TBD',
  asset_id TEXT REFERENCES assets(asset_id),
  location_id TEXT REFERENCES locations(location_id),
  gis_feature_id TEXT REFERENCES gis_features(gis_feature_id),
  unit TEXT,
  manufacturer TEXT,
  model TEXT,
  serial_number TEXT,
  install_date DATE,
  data_source TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE sensor_readings (
  sensor_reading_id TEXT PRIMARY KEY,
  sensor_id TEXT NOT NULL REFERENCES sensors(sensor_id),
  observed_at TIMESTAMPTZ NOT NULL,
  value NUMERIC(18, 6) NOT NULL,
  unit TEXT,
  quality_flag TEXT,
  source_payload JSONB,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE ai_insights (
  ai_insight_id TEXT PRIMARY KEY,
  insight_type TEXT NOT NULL,
  title TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'Draft',
  summary TEXT,
  recommendation TEXT,
  confidence NUMERIC(5, 4),
  model_name TEXT,
  reviewed_by TEXT,
  reviewed_at TIMESTAMPTZ,
  accepted_decision_id TEXT REFERENCES decisions(decision_id),
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE ai_insight_sources (
  ai_insight_source_id TEXT PRIMARY KEY,
  ai_insight_id TEXT NOT NULL REFERENCES ai_insights(ai_insight_id),
  source_entity_type TEXT NOT NULL,
  source_entity_id TEXT NOT NULL,
  evidence_note TEXT,
  confidence NUMERIC(5, 4),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE audit_log (
  audit_log_id TEXT PRIMARY KEY,
  actor_type TEXT NOT NULL,
  actor_id TEXT,
  action TEXT NOT NULL,
  entity_type TEXT NOT NULL,
  entity_id TEXT NOT NULL,
  before_json JSONB,
  after_json JSONB,
  source TEXT,
  request_id TEXT,
  occurred_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  notes TEXT
);

CREATE INDEX idx_assets_category ON assets(category);
CREATE INDEX idx_assets_status ON assets(status);
CREATE INDEX idx_assets_location_id ON assets(location_id);
CREATE INDEX idx_assets_supplier_id ON assets(supplier_id);
CREATE INDEX idx_assets_primary_gis_feature_id ON assets(primary_gis_feature_id);

CREATE INDEX idx_asset_relationships_source ON asset_relationships(source_asset_id);
CREATE INDEX idx_asset_relationships_target ON asset_relationships(target_asset_id);
CREATE INDEX idx_asset_relationships_type ON asset_relationships(relationship_type);

CREATE INDEX idx_locations_type ON locations(location_type);
CREATE INDEX idx_locations_parent ON locations(parent_location_id);
CREATE INDEX idx_locations_gis_feature_id ON locations(gis_feature_id);

CREATE INDEX idx_gis_features_layer_type ON gis_features(layer_type);
CREATE INDEX idx_gis_features_geometry_type ON gis_features(geometry_type);
CREATE INDEX idx_gis_features_status ON gis_features(status);
CREATE INDEX idx_gis_features_asset_id ON gis_features(asset_id);
CREATE INDEX idx_gis_features_location_id ON gis_features(location_id);
CREATE INDEX idx_gis_features_geometry ON gis_features USING GIST (geometry);

CREATE INDEX idx_projects_status ON projects(status);
CREATE INDEX idx_projects_type ON projects(project_type);
CREATE INDEX idx_projects_owner ON projects(owner);
CREATE INDEX idx_projects_priority_score ON projects(priority_score);

CREATE INDEX idx_project_assets_project_id ON project_assets(project_id);
CREATE INDEX idx_project_assets_asset_id ON project_assets(asset_id);
CREATE INDEX idx_project_assets_relationship_type ON project_assets(relationship_type);

CREATE INDEX idx_decisions_status ON decisions(status);
CREATE INDEX idx_decisions_decision_date ON decisions(decision_date);
CREATE INDEX idx_decisions_source_file ON decisions(source_file);

CREATE INDEX idx_actions_status ON actions(status);
CREATE INDEX idx_actions_owner ON actions(owner);
CREATE INDEX idx_actions_due_date ON actions(due_date);
CREATE INDEX idx_actions_priority ON actions(priority);

CREATE INDEX idx_entity_links_source ON entity_links(source_entity_type, source_entity_id);
CREATE INDEX idx_entity_links_target ON entity_links(target_entity_type, target_entity_id);
CREATE INDEX idx_entity_links_type ON entity_links(link_type);

CREATE INDEX idx_documents_document_type ON documents(document_type);
CREATE INDEX idx_documents_supplier_id ON documents(supplier_id);
CREATE INDEX idx_documents_status ON documents(status);
CREATE INDEX idx_documents_issue_date ON documents(issue_date);
CREATE INDEX idx_documents_expiry_date ON documents(expiry_date);
CREATE INDEX idx_documents_checksum ON documents(checksum);

CREATE INDEX idx_photos_asset_id ON photos(asset_id);
CREATE INDEX idx_photos_location_id ON photos(location_id);
CREATE INDEX idx_photos_captured_at ON photos(captured_at);
CREATE INDEX idx_photos_checksum ON photos(checksum);

CREATE INDEX idx_drawings_asset_id ON drawings(asset_id);
CREATE INDEX idx_drawings_project_id ON drawings(project_id);
CREATE INDEX idx_drawings_type ON drawings(drawing_type);
CREATE INDEX idx_drawings_revision ON drawings(revision);
CREATE INDEX idx_drawings_status ON drawings(status);

CREATE INDEX idx_suppliers_type ON suppliers(supplier_type);
CREATE INDEX idx_suppliers_status ON suppliers(status);
CREATE INDEX idx_suppliers_name ON suppliers(name);

CREATE INDEX idx_quotes_supplier_id ON quotes(supplier_id);
CREATE INDEX idx_quotes_project_id ON quotes(project_id);
CREATE INDEX idx_quotes_asset_id ON quotes(asset_id);
CREATE INDEX idx_quotes_status ON quotes(status);
CREATE INDEX idx_quotes_received_date ON quotes(received_date);

CREATE INDEX idx_financial_events_event_date ON financial_events(event_date);
CREATE INDEX idx_financial_events_event_type ON financial_events(event_type);
CREATE INDEX idx_financial_events_asset_id ON financial_events(asset_id);
CREATE INDEX idx_financial_events_project_id ON financial_events(project_id);
CREATE INDEX idx_financial_events_supplier_id ON financial_events(supplier_id);
CREATE INDEX idx_financial_events_category ON financial_events(category);

CREATE INDEX idx_financial_scenarios_type ON financial_scenarios(scenario_type);
CREATE INDEX idx_financial_scenarios_project_id ON financial_scenarios(project_id);
CREATE INDEX idx_financial_scenarios_asset_id ON financial_scenarios(asset_id);
CREATE INDEX idx_financial_scenarios_quote_id ON financial_scenarios(quote_id);

CREATE INDEX idx_maintenance_events_asset_id ON maintenance_events(asset_id);
CREATE INDEX idx_maintenance_events_event_date ON maintenance_events(event_date);
CREATE INDEX idx_maintenance_events_next_due_date ON maintenance_events(next_due_date);
CREATE INDEX idx_maintenance_events_status ON maintenance_events(status);

CREATE INDEX idx_grants_jurisdiction ON grants(jurisdiction);
CREATE INDEX idx_grants_status ON grants(status);
CREATE INDEX idx_grants_closes_at ON grants(closes_at);
CREATE INDEX idx_grants_project_id ON grants(project_id);
CREATE INDEX idx_grants_asset_id ON grants(asset_id);

CREATE INDEX idx_loans_type ON loans(loan_type);
CREATE INDEX idx_loans_status ON loans(status);
CREATE INDEX idx_loans_lender_supplier_id ON loans(lender_supplier_id);
CREATE INDEX idx_loans_project_id ON loans(project_id);

CREATE INDEX idx_insurance_records_asset_id ON insurance_records(asset_id);
CREATE INDEX idx_insurance_records_renewal_date ON insurance_records(renewal_date);
CREATE INDEX idx_insurance_records_status ON insurance_records(status);

CREATE INDEX idx_permits_type ON permits(permit_type);
CREATE INDEX idx_permits_status ON permits(status);
CREATE INDEX idx_permits_authority ON permits(authority);
CREATE INDEX idx_permits_expiry_date ON permits(expiry_date);
CREATE INDEX idx_permits_project_id ON permits(project_id);
CREATE INDEX idx_permits_asset_id ON permits(asset_id);

CREATE INDEX idx_sensors_type ON sensors(sensor_type);
CREATE INDEX idx_sensors_status ON sensors(status);
CREATE INDEX idx_sensors_asset_id ON sensors(asset_id);
CREATE INDEX idx_sensors_location_id ON sensors(location_id);

CREATE INDEX idx_sensor_readings_sensor_observed ON sensor_readings(sensor_id, observed_at);
CREATE INDEX idx_sensor_readings_observed_at ON sensor_readings(observed_at);
CREATE INDEX idx_sensor_readings_quality_flag ON sensor_readings(quality_flag);

CREATE INDEX idx_ai_insights_type ON ai_insights(insight_type);
CREATE INDEX idx_ai_insights_status ON ai_insights(status);
CREATE INDEX idx_ai_insights_reviewed_at ON ai_insights(reviewed_at);
CREATE INDEX idx_ai_insights_accepted_decision_id ON ai_insights(accepted_decision_id);

CREATE INDEX idx_ai_insight_sources_insight_id ON ai_insight_sources(ai_insight_id);
CREATE INDEX idx_ai_insight_sources_source ON ai_insight_sources(source_entity_type, source_entity_id);

CREATE INDEX idx_audit_log_occurred_at ON audit_log(occurred_at);
CREATE INDEX idx_audit_log_actor_type ON audit_log(actor_type);
CREATE INDEX idx_audit_log_entity ON audit_log(entity_type, entity_id);
CREATE INDEX idx_audit_log_request_id ON audit_log(request_id);
