# Canonical Data Model

## Purpose

This is the canonical entity model for Project Zero.

Project Zero will treat structured entities as the future source of truth. Markdown remains the narrative and decision archive, but app development will use canonical data models for assets, projects, decisions, actions, finance, GIS, documents, maintenance, sensors, and AI insights.

## Entity Summary

| Entity | Purpose | Future app module |
| --- | --- | --- |
| Asset | Physical or logical property asset | Assets, Map, Maintenance, Finance |
| Location | Named place or coordinate context | Map, Assets, Field Capture |
| GIS Feature | Spatial point, line, polygon, or raster reference | GIS, Map |
| Project | Planned or active body of work | Projects, Finance, Actions |
| Decision | Accepted, proposed, or superseded decision | Decisions, Governance |
| Action | Trackable work item | Actions, Automations |
| Document | File or record with business context | Documents, AI |
| Photo | Image evidence or inspection record | Photos, Map, Assets |
| Drawing | Plan, diagram, layout, or engineering drawing | Drawings, Engineering |
| Supplier | External organisation or person | Suppliers, Quotes, Maintenance |
| Quote | Supplier offer for work, equipment, or service | Quotes, Finance |
| Financial Event | Actual money movement or accounting event | Finance |
| Financial Scenario | Modelled financial case or option | Finance, Decisions |
| Maintenance Event | Service, inspection, repair, or failure event | Maintenance |
| Grant | Grant, incentive, rebate, or funding program | Grants |
| Loan | Finance product or active borrowing record | Finance |
| Insurance Record | Insurance value, policy, claim, or review record | Finance, Risk |
| Permit | Approval, licence, compliance, or authority record | Compliance |
| Sensor | Device or data source producing readings | Sensors |
| Sensor Reading | Time-stamped measurement from a sensor | Sensors, Dashboards |
| AI Insight | AI-generated finding, recommendation, extraction, or warning | AI |
| Audit Log | Immutable record of changes and system actions | Governance |

## Entities

### Asset

Purpose: represent any physical or logical asset that needs identity, maintenance, finance, documents, location, or decisions.

Required fields: `asset_id`, `name`, `category`, `status`, `created_at`, `updated_at`.

Optional fields: `subcategory`, `description`, `serial_number`, `capacity`, `installation_date`, `expected_life`, `replacement_cost`, `maintenance_interval`, `supplier_id`, `warranty_end_date`, `depreciation_class`, `insurance_value`, `location_id`, `primary_gis_feature_id`, `notes`.

Relationships: belongs to Location; may link to GIS Features, Projects, Decisions, Actions, Documents, Photos, Drawings, Suppliers, Financial Events, Maintenance Events, Sensors, Insurance Records, Permits.

Source files currently feeding it: `data/assets.csv`, `data/asset_register.csv`, `docs/06_Asset_Register/Asset_Register.md`, energy/water/building/utility docs.

Future app module: Assets.

Example record: `INF-001 Stage 1 Solar`, category `Infrastructure`, status `Planned`, capacity `50 kW`, linked to DEC-001, DEC-002, DEC-003.

### Location

Purpose: define a named physical place, coordinate, zone, or site context.

Required fields: `location_id`, `name`, `location_type`, `created_at`, `updated_at`.

Optional fields: `description`, `latitude`, `longitude`, `elevation`, `accuracy_m`, `parent_location_id`, `gis_feature_id`, `notes`.

Relationships: may contain Assets, GIS Features, Projects, Documents, Photos, Sensors, Actions.

Source files currently feeding it: `data/assets.csv` location columns, action register notes, GIS/digital twin docs.

Future app module: Map.

Example record: `LOC-001 Workshop Area`, type `site_zone`, linked to workshop, CNC, compressor, main switchboard.

### GIS Feature

Purpose: store spatial geometry or raster references for map layers.

Required fields: `gis_feature_id`, `layer_type`, `geometry_type`, `status`, `created_at`, `updated_at`.

Optional fields: `name`, `description`, `geometry`, `source`, `accuracy_m`, `capture_date`, `asset_id`, `location_id`, `document_id`, `notes`.

Relationships: may link to Asset, Location, Project, Document, Photo, Drone Imagery, Sensor.

Source files currently feeding it: none yet; GIS requirements in `docs/PROJECT_ZERO_REVIEW.md` and `architecture/GIS_DATA_MODEL.md`.

Future app module: GIS.

Example record: `GIS-001 Property Boundary`, layer `property_boundary`, geometry type `polygon`.

### Project

Purpose: track a planned, active, paused, completed, or rejected body of work.

Required fields: `project_id`, `name`, `status`, `project_type`, `created_at`, `updated_at`.

Optional fields: `description`, `owner`, `start_date`, `target_date`, `budget`, `actual_cost`, `priority_score`, `parent_project_id`, `notes`.

Relationships: links to Assets, Locations, GIS Features, Decisions, Actions, Documents, Quotes, Financial Events, Financial Scenarios, Grants, Loans, Permits.

Source files currently feeding it: roadmap docs, energy/water/finance strategy docs, action register.

Future app module: Projects.

Example record: `PRJ-001 Stage 1 Solar Battery`, status `Proposed`, linked to INF-001, INF-002, DEC-001.

### Decision

Purpose: record an accepted, proposed, superseded, or rejected decision.

Required fields: `decision_id`, `title`, `status`, `decision_date`, `decision_text`, `created_at`, `updated_at`.

Optional fields: `context`, `rationale`, `consequences`, `supersedes_decision_id`, `source_file`, `owner`, `review_date`.

Relationships: links to Projects, Assets, Actions, Documents, Financial Scenarios, Grants, AI Insights.

Source files currently feeding it: `docs/09_Decision_Logs/*.md`.

Future app module: Decisions.

Example record: `DEC-008 Canonical Data Model`, status `Accepted`.

### Action

Purpose: represent trackable work that can be assigned, prioritised, scheduled, automated, or closed.

Required fields: `action_id`, `title`, `status`, `created_at`, `updated_at`.

Optional fields: `owner`, `due_date`, `priority`, `notes`, `source`, `completed_at`, `parent_action_id`.

Relationships: links to Decisions, Assets, Projects, Locations, Documents, Suppliers, Maintenance Events, AI Insights.

Source files currently feeding it: `docs/10_Action_Register/Action_Register.md`, `data/action_register.csv`.

Future app module: Actions.

Example record: `ACT-047 Draft Project Zero database schema`.

### Document

Purpose: store metadata for documents, files, emails, PDFs, spreadsheets, manuals, warranties, bills, permits, and evidence.

Required fields: `document_id`, `title`, `document_type`, `storage_uri`, `status`, `created_at`, `updated_at`.

Optional fields: `source_file`, `received_date`, `issue_date`, `expiry_date`, `supplier_id`, `ocr_text`, `summary`, `version`, `checksum`, `notes`.

Relationships: links to Assets, Projects, Decisions, Actions, Suppliers, Quotes, Grants, Loans, Insurance Records, Permits, AI Insights.

Source files currently feeding it: all Markdown docs, future uploaded files.

Future app module: Documents.

Example record: `DOC-001 Solar quote PDF`, type `quote_attachment`.

### Photo

Purpose: store image metadata and link field evidence to assets, locations, projects, maintenance, decisions, and GIS.

Required fields: `photo_id`, `title`, `storage_uri`, `created_at`, `updated_at`.

Optional fields: `captured_at`, `latitude`, `longitude`, `direction`, `asset_id`, `location_id`, `project_id`, `maintenance_event_id`, `description`, `tags`, `checksum`.

Relationships: links to Asset, Location, GIS Feature, Project, Maintenance Event, Document, AI Insight.

Source files currently feeding it: none yet.

Future app module: Photos.

Example record: `PHO-001 Workshop roof south view`.

### Drawing

Purpose: represent engineering drawings, layouts, site plans, diagrams, and revisions.

Required fields: `drawing_id`, `title`, `drawing_type`, `revision`, `storage_uri`, `created_at`, `updated_at`.

Optional fields: `asset_id`, `project_id`, `location_id`, `gis_feature_id`, `author`, `issue_date`, `status`, `notes`.

Relationships: links to Assets, Projects, Locations, GIS Features, Documents, Decisions.

Source files currently feeding it: none yet; naming standards and engineering docs define need.

Future app module: Drawings.

Example record: `DRW-001 Solar layout R01`.

### Supplier

Purpose: track organisations and people providing quotes, equipment, advice, finance, installation, maintenance, or professional services.

Required fields: `supplier_id`, `name`, `supplier_type`, `status`, `created_at`, `updated_at`.

Optional fields: `contact_name`, `email`, `phone`, `website`, `abn`, `address`, `notes`.

Relationships: links to Quotes, Documents, Assets, Projects, Maintenance Events, Financial Events, Grants, Loans.

Source files currently feeding it: `docs/11_Suppliers_Quotes/Suppliers_Quotes.md`, grant/finance docs, quote templates.

Future app module: Suppliers.

Example record: `SUP-001 Solar installer TBD`.

### Quote

Purpose: capture supplier offers and compare scope, price, assumptions, exclusions, incentives, and terms.

Required fields: `quote_id`, `supplier_id`, `title`, `status`, `received_date`, `created_at`, `updated_at`.

Optional fields: `project_id`, `asset_id`, `gross_cost`, `net_cost`, `stc_value`, `battery_incentive_value`, `expiry_date`, `scope_summary`, `exclusions`, `document_id`, `notes`.

Relationships: belongs to Supplier; may link to Project, Asset, Document, Financial Scenario, Decision.

Source files currently feeding it: supplier quote templates, action register quote actions.

Future app module: Quotes.

Example record: `QTE-001 Stage 1 solar battery quote`.

### Financial Event

Purpose: record actual money movement or accounting event.

Required fields: `financial_event_id`, `event_type`, `amount`, `currency`, `event_date`, `created_at`, `updated_at`.

Optional fields: `asset_id`, `project_id`, `supplier_id`, `document_id`, `category`, `tax_treatment`, `payment_method`, `notes`.

Relationships: links to Asset, Project, Supplier, Document, Loan, Grant, Insurance Record, Maintenance Event.

Source files currently feeding it: none yet; current finance docs and model outputs define future need.

Future app module: Finance.

Example record: `FIN-001 Solar deposit payment`.

### Financial Scenario

Purpose: store modelled options such as ROI, payback, NPV, IRR, offset comparison, and finance scenarios.

Required fields: `financial_scenario_id`, `name`, `scenario_type`, `created_at`, `updated_at`.

Optional fields: `project_id`, `asset_id`, `assumptions_json`, `roi`, `payback_years`, `npv`, `irr`, `risk_notes`, `source_file`, `notes`.

Relationships: links to Project, Asset, Decision, Document, Quote, Loan, Grant.

Source files currently feeding it: `tools/solar_financial_model.py`, `docs/02_Investment_Financial_Strategy/Financial_Model_Output.md`, `data/assumptions.json`.

Future app module: Finance.

Example record: `FSC-001 Solar 80 percent bill offset at 70000 project cost`.

### Maintenance Event

Purpose: track service, inspection, repair, failure, replacement, and maintenance cost.

Required fields: `maintenance_event_id`, `asset_id`, `event_type`, `event_date`, `created_at`, `updated_at`.

Optional fields: `supplier_id`, `cost`, `description`, `next_due_date`, `document_id`, `photo_id`, `status`, `notes`.

Relationships: belongs to Asset; may link to Supplier, Document, Photo, Financial Event, Action, AI Insight.

Source files currently feeding it: asset template and action register.

Future app module: Maintenance.

Example record: `MNT-001 Compressor service`.

### Grant

Purpose: track grant, rebate, incentive, or public funding opportunity.

Required fields: `grant_id`, `name`, `jurisdiction`, `status`, `created_at`, `updated_at`.

Optional fields: `program_url`, `opens_at`, `closes_at`, `eligible_items`, `excluded_items`, `project_id`, `asset_id`, `document_id`, `notes`.

Relationships: links to Projects, Assets, Documents, Decisions, Financial Scenarios, Financial Events, Suppliers.

Source files currently feeding it: `data/grants_register.csv`, grants strategy docs.

Future app module: Grants.

Example record: `GRA-001 Queensland MEEG`.

### Loan

Purpose: track finance options, approvals, loan terms, repayments, and comparisons.

Required fields: `loan_id`, `name`, `loan_type`, `status`, `created_at`, `updated_at`.

Optional fields: `lender_supplier_id`, `project_id`, `principal`, `rate`, `term_months`, `fees`, `repayment_amount`, `document_id`, `notes`.

Relationships: links to Supplier, Project, Asset, Financial Scenario, Financial Event, Decision.

Source files currently feeding it: finance options register, investment strategy, financial model output.

Future app module: Finance.

Example record: `LOA-001 Bank green loan option`.

### Insurance Record

Purpose: track insured values, policies, renewal dates, claims, and replacement value by asset.

Required fields: `insurance_record_id`, `record_type`, `status`, `created_at`, `updated_at`.

Optional fields: `asset_id`, `supplier_id`, `policy_number`, `insured_value`, `renewal_date`, `document_id`, `notes`.

Relationships: links to Assets, Suppliers, Documents, Financial Events, Actions.

Source files currently feeding it: asset register fields only.

Future app module: Finance/Risk.

Example record: `INS-001 Workshop insured value`.

### Permit

Purpose: track approvals, permits, licences, authority requirements, compliance documents, and expiry dates.

Required fields: `permit_id`, `name`, `permit_type`, `status`, `created_at`, `updated_at`.

Optional fields: `authority`, `project_id`, `asset_id`, `location_id`, `gis_feature_id`, `issue_date`, `expiry_date`, `document_id`, `notes`.

Relationships: links to Projects, Assets, Locations, GIS Features, Documents, Decisions, Actions.

Source files currently feeding it: dam pump concept approvals notes, action register.

Future app module: Compliance.

Example record: `PER-001 Waterway/spillway works approval check`.

### Sensor

Purpose: represent a physical or logical data source.

Required fields: `sensor_id`, `name`, `sensor_type`, `status`, `created_at`, `updated_at`.

Optional fields: `asset_id`, `location_id`, `gis_feature_id`, `unit`, `manufacturer`, `model`, `serial_number`, `install_date`, `data_source`, `notes`.

Relationships: belongs to Asset or Location; has many Sensor Readings; may link to Documents, Maintenance Events, AI Insights.

Source files currently feeding it: Project Zero architecture and backlog only.

Future app module: Sensors.

Example record: `SEN-001 Dam level sensor`.

### Sensor Reading

Purpose: store time-stamped measurements from sensors or imported data.

Required fields: `sensor_reading_id`, `sensor_id`, `observed_at`, `value`, `created_at`.

Optional fields: `unit`, `quality_flag`, `source_payload`, `notes`.

Relationships: belongs to Sensor; may be referenced by AI Insight, Dashboard, Automation.

Source files currently feeding it: future energy interval data and sensors.

Future app module: Sensors/Dashboards.

Example record: `SRD-001 dam level at timestamp`.

### AI Insight

Purpose: store AI-generated extraction, recommendation, contradiction, warning, summary, or decision support.

Required fields: `ai_insight_id`, `insight_type`, `title`, `status`, `created_at`, `updated_at`.

Optional fields: `summary`, `recommendation`, `confidence`, `model_name`, `source_record_refs`, `reviewed_by`, `reviewed_at`, `accepted_decision_id`, `notes`.

Relationships: links to source records including Assets, Projects, Decisions, Actions, Documents, Photos, Quotes, Financial Scenarios, Sensor Readings, GIS Features.

Source files currently feeding it: none yet.

Future app module: AI.

Example record: `AII-001 Quote comparison risk warning`.

### Audit Log

Purpose: immutable event log of changes, imports, AI actions, user actions, and automations.

Required fields: `audit_log_id`, `actor_type`, `action`, `entity_type`, `entity_id`, `occurred_at`.

Optional fields: `actor_id`, `before_json`, `after_json`, `source`, `request_id`, `notes`.

Relationships: references all entity types by `entity_type` and `entity_id`.

Source files currently feeding it: Git history, future app operations.

Future app module: Governance/System.

Example record: `AUD-001 imported ACT-001 from action_register.csv`.
