-- Project Zero seed assets and locations

INSERT INTO locations (location_id, name, location_type, description, notes)
VALUES
  ('LOC-001', 'Eudlo Road Property', 'property', 'Overall Project Zero property boundary and operating context.', 'Geometry TBD.'),
  ('LOC-002', 'Workshop Area', 'site_zone', 'Workshop and manufacturing area.', 'Exact GPS and footprint TBD.'),
  ('LOC-003', 'Dam Area', 'site_zone', 'Dam, waterhole, spillway and dam pump concept area.', 'Exact GPS and geometry TBD.')
ON CONFLICT (location_id) DO NOTHING;

INSERT INTO gis_features (gis_feature_id, layer_type, name, geometry_type, geometry, source, status, location_id, notes)
VALUES
  ('GIS-001', 'property_boundary', 'Eudlo Road Property Boundary', 'polygon', NULL, 'manual_seed', 'TBD', 'LOC-001', 'Boundary geometry TBD.'),
  ('GIS-002', 'asset_point', 'Workshop Area Point', 'point', NULL, 'manual_seed', 'TBD', 'LOC-002', 'Point geometry TBD.'),
  ('GIS-003', 'asset_point', 'Dam Area Point', 'point', NULL, 'manual_seed', 'TBD', 'LOC-003', 'Point geometry TBD.')
ON CONFLICT (gis_feature_id) DO NOTHING;

UPDATE locations SET gis_feature_id = 'GIS-001' WHERE location_id = 'LOC-001';
UPDATE locations SET gis_feature_id = 'GIS-002' WHERE location_id = 'LOC-002';
UPDATE locations SET gis_feature_id = 'GIS-003' WHERE location_id = 'LOC-003';

INSERT INTO suppliers (supplier_id, name, supplier_type, status, notes)
VALUES
  ('SUP-001', 'Solar supplier TBD', 'solar_installer', 'TBD', 'Placeholder supplier for Stage 1 solar/battery quotes.'),
  ('SUP-002', 'Pump supplier TBD', 'pump_supplier', 'TBD', 'Placeholder supplier for dam solar pump sizing advice.'),
  ('SUP-003', 'Accountant TBD', 'accountant', 'TBD', 'Placeholder for depreciation, tax and R&D advice.')
ON CONFLICT (supplier_id) DO NOTHING;

INSERT INTO projects (project_id, name, project_type, status, description, notes)
VALUES
  ('PRJ-001', 'Stage 1 Solar Battery', 'energy', 'planning', '50 kW solar + 100 kWh battery with future 100 kW solar expansion pathway.', 'Based on DEC-001, DEC-002 and DEC-003.'),
  ('PRJ-002', 'Dam Solar Pump Concept', 'water', 'concept', 'Solar-only dam recirculation pump using second-hand panels.', 'Based on DEC-004.'),
  ('PRJ-003', 'Project Zero Database Foundation', 'software_architecture', 'draft', 'PostgreSQL/PostGIS database foundation for future app development.', 'Based on DEC-008 and DEC-009.')
ON CONFLICT (project_id) DO NOTHING;

INSERT INTO assets (
  asset_id,
  name,
  category,
  subcategory,
  status,
  description,
  capacity,
  location_id,
  primary_gis_feature_id,
  notes
)
VALUES
  ('BLD-001', 'Workshop', 'Buildings', 'Workshop', 'Existing', 'Main manufacturing and energy load centre.', NULL, 'LOC-002', 'GIS-002', 'Seeded from data/assets.csv.'),
  ('INF-001', 'Stage 1 Solar', 'Infrastructure', 'Solar', 'Planned', '50 kW solar with design pathway to 100 kW.', '50 kW', 'LOC-002', NULL, 'Seeded from data/assets.csv and DEC-001.'),
  ('INF-002', 'Stage 1 Battery', 'Infrastructure', 'Battery', 'Planned', '100 kWh battery for Stage 1 energy system.', '100 kWh', 'LOC-002', NULL, 'Seeded from data/assets.csv and DEC-001.'),
  ('INF-003', 'Generator Integration', 'Infrastructure', 'Generator', 'Planned', 'Generator integration for backup and microgrid-capable operation.', NULL, 'LOC-002', NULL, 'Seeded from DEC-003.'),
  ('INF-004', 'Main Switchboard', 'Infrastructure', 'Switchboards', 'Existing/TBD', 'Main switchboard location and capacity to be confirmed.', NULL, 'LOC-002', NULL, 'Seeded from data/assets.csv.'),
  ('INF-005', 'Dam', 'Infrastructure', 'Dam', 'Existing', 'Water storage and future pump planning asset.', NULL, 'LOC-003', 'GIS-003', 'Seeded from data/assets.csv and DEC-004.'),
  ('INF-006', 'Dam Solar Pump', 'Infrastructure', 'Irrigation', 'Concept', 'Solar-only recirculation pump concept for dam/waterhole system.', 'Approx 6,000 L/hour at approx 20 m lift', 'LOC-003', NULL, 'Panel target 3-5 kW; pump target 1.1-1.5 kW.'),
  ('MAC-002', 'Compressor', 'Machinery', 'Compressor', 'Existing/TBD', 'Workshop compressor and candidate for energy-efficiency upgrade.', NULL, 'LOC-002', NULL, 'Potential MEEG candidate.'),
  ('MAC-001', 'CNC', 'Machinery', 'CNC', 'Existing/TBD', 'CNC machinery record placeholder.', NULL, 'LOC-002', NULL, 'Load and maintenance requirements TBD.')
ON CONFLICT (asset_id) DO NOTHING;

UPDATE gis_features SET asset_id = 'BLD-001' WHERE gis_feature_id = 'GIS-002';
UPDATE gis_features SET asset_id = 'INF-005' WHERE gis_feature_id = 'GIS-003';

INSERT INTO asset_relationships (asset_relationship_id, source_asset_id, target_asset_id, relationship_type, notes)
VALUES
  ('ARL-001', 'INF-002', 'INF-001', 'depends_on', 'Battery depends on solar generation and electrical integration.'),
  ('ARL-002', 'INF-001', 'INF-004', 'depends_on', 'Solar depends on switchboard and electrical integration.'),
  ('ARL-003', 'INF-002', 'INF-004', 'depends_on', 'Battery depends on switchboard and inverter integration.'),
  ('ARL-004', 'INF-003', 'INF-004', 'depends_on', 'Generator integration depends on switchboard/transfer arrangement.'),
  ('ARL-005', 'INF-006', 'INF-005', 'depends_on', 'Dam solar pump depends on dam/waterhole system.')
ON CONFLICT (asset_relationship_id) DO NOTHING;

INSERT INTO project_assets (project_asset_id, project_id, asset_id, relationship_type, notes)
VALUES
  ('PRA-001', 'PRJ-001', 'INF-001', 'creates_or_upgrades', 'Stage 1 solar asset.'),
  ('PRA-002', 'PRJ-001', 'INF-002', 'creates_or_upgrades', 'Stage 1 battery asset.'),
  ('PRA-003', 'PRJ-001', 'INF-003', 'integrates', 'Generator integration.'),
  ('PRA-004', 'PRJ-001', 'INF-004', 'depends_on', 'Switchboard capacity/location required.'),
  ('PRA-005', 'PRJ-002', 'INF-005', 'depends_on', 'Dam asset.'),
  ('PRA-006', 'PRJ-002', 'INF-006', 'creates_or_upgrades', 'Dam solar pump concept.')
ON CONFLICT (project_asset_id) DO NOTHING;
