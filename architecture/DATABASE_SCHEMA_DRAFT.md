# Database Schema Draft

## Purpose

This is the plain-English PostgreSQL schema draft for Project Zero.

This is not SQL yet. It defines tables, keys, fields, indexes, relationships, and PostGIS requirements before implementation.

## Database Direction

Recommended foundation:

- PostgreSQL for relational data
- PostGIS for geometry and spatial queries
- Object storage for files, photos, drawings, drone imagery, and LiDAR outputs
- Vector index for AI retrieval
- Time-series strategy for sensor readings and energy interval data

## Tables

### `assets`

Primary key: `asset_id`.

Key fields: name, category, subcategory, status, description, capacity, serial number, installation date, expected life, replacement cost, maintenance interval, supplier ID, warranty end date, depreciation class, insurance value, location ID, primary GIS feature ID, notes, timestamps.

Foreign keys: `location_id`, `supplier_id`, `primary_gis_feature_id`.

Indexes: category, status, location ID, supplier ID, primary GIS feature ID.

Notes: canonical physical asset table. `data/assets.csv` becomes seed source.

Future PostGIS requirements: link to geometry via GIS feature rather than storing geometry directly in assets.

### `asset_relationships`

Primary key: `asset_relationship_id`.

Key fields: source asset ID, target asset ID, relationship type, notes, timestamps.

Foreign keys: source asset ID, target asset ID.

Indexes: source asset ID, target asset ID, relationship type.

Notes: supports dependencies and system topology.

Future PostGIS requirements: none directly.

### `locations`

Primary key: `location_id`.

Key fields: name, location type, parent location ID, latitude, longitude, elevation, accuracy, GIS feature ID, description, notes, timestamps.

Foreign keys: parent location ID, GIS feature ID.

Indexes: location type, parent location ID, GIS feature ID.

Notes: named places and zones.

Future PostGIS requirements: may link to point or polygon GIS Feature.

### `gis_features`

Primary key: `gis_feature_id`.

Key fields: layer type, name, geometry type, geometry, source, capture date, accuracy, status, asset ID, location ID, document ID, notes, timestamps.

Foreign keys: asset ID, location ID, document ID.

Indexes: layer type, geometry type, status, asset ID, location ID, spatial index on geometry.

Notes: central spatial table.

Future PostGIS requirements: geometry column with GiST index; support point, line, polygon, multipolygon.

### `projects`

Primary key: `project_id`.

Key fields: name, project type, status, owner, start date, target date, budget, actual cost, priority score, parent project ID, description, notes, timestamps.

Foreign keys: parent project ID.

Indexes: status, project type, owner, priority score.

Notes: bodies of work, not just tasks.

Future PostGIS requirements: optional link through `project_gis_features`.

### `project_assets`

Primary key: `project_asset_id`.

Key fields: project ID, asset ID, relationship type, notes.

Foreign keys: project ID, asset ID.

Indexes: project ID, asset ID, relationship type.

Notes: many-to-many project/asset linkage.

Future PostGIS requirements: none directly.

### `decisions`

Primary key: `decision_id`.

Key fields: title, status, decision date, decision text, context, rationale, consequences, source file, owner, review date, supersedes decision ID, timestamps.

Foreign keys: supersedes decision ID.

Indexes: status, decision date, source file.

Notes: structured version of decision logs.

Future PostGIS requirements: none directly, but decisions can link to GIS features through join tables.

### `actions`

Primary key: `action_id`.

Key fields: title, status, owner, due date, priority, notes, source, completed date, parent action ID, timestamps.

Foreign keys: parent action ID.

Indexes: status, owner, due date, priority.

Notes: generated Markdown action register later.

Future PostGIS requirements: optional link to Location or GIS Feature through joins.

### `entity_links`

Primary key: `entity_link_id`.

Key fields: source entity type, source entity ID, target entity type, target entity ID, link type, notes, timestamps.

Foreign keys: polymorphic by convention.

Indexes: source entity type and ID, target entity type and ID, link type.

Notes: flexible relationship table for documents, actions, decisions, AI insights, photos, and edge cases.

Future PostGIS requirements: none directly.

### `documents`

Primary key: `document_id`.

Key fields: title, document type, storage URI, source file, received date, issue date, expiry date, supplier ID, OCR text, summary, version, checksum, status, notes, timestamps.

Foreign keys: supplier ID.

Indexes: document type, supplier ID, status, issue date, expiry date, checksum.

Notes: metadata only; actual files live in object storage or repo archive.

Future PostGIS requirements: documents can link to GIS Features through `entity_links`.

### `photos`

Primary key: `photo_id`.

Key fields: title, storage URI, captured at, latitude, longitude, direction, asset ID, location ID, GIS feature ID, description, tags, checksum, timestamps.

Foreign keys: asset ID, location ID, GIS feature ID.

Indexes: asset ID, location ID, captured at, checksum.

Notes: field image evidence.

Future PostGIS requirements: point geometry can be generated from lat/long or linked GIS Feature.

### `drawings`

Primary key: `drawing_id`.

Key fields: title, drawing type, revision, storage URI, asset ID, project ID, location ID, GIS feature ID, author, issue date, status, notes, timestamps.

Foreign keys: asset ID, project ID, location ID, GIS feature ID.

Indexes: asset ID, project ID, drawing type, revision, status.

Notes: engineering and site drawings.

Future PostGIS requirements: may link to GIS Features for georeferenced drawings.

### `suppliers`

Primary key: `supplier_id`.

Key fields: name, supplier type, status, contact name, email, phone, website, ABN, address, notes, timestamps.

Foreign keys: none initially.

Indexes: supplier type, status, name.

Notes: suppliers include installers, advisors, banks, grant advisors, accountants, contractors.

Future PostGIS requirements: optional address geocoding later.

### `quotes`

Primary key: `quote_id`.

Key fields: supplier ID, title, status, received date, expiry date, project ID, asset ID, gross cost, net cost, STC value, battery incentive value, scope summary, exclusions, document ID, notes, timestamps.

Foreign keys: supplier ID, project ID, asset ID, document ID.

Indexes: supplier ID, project ID, asset ID, status, received date.

Notes: quote comparison source.

Future PostGIS requirements: none directly.

### `financial_events`

Primary key: `financial_event_id`.

Key fields: event type, amount, currency, event date, category, asset ID, project ID, supplier ID, document ID, loan ID, grant ID, maintenance event ID, tax treatment, payment method, notes, timestamps.

Foreign keys: asset ID, project ID, supplier ID, document ID, loan ID, grant ID, maintenance event ID.

Indexes: event date, event type, asset ID, project ID, supplier ID, category.

Notes: actual ledger events.

Future PostGIS requirements: none directly.

### `financial_scenarios`

Primary key: `financial_scenario_id`.

Key fields: name, scenario type, project ID, asset ID, quote ID, loan ID, assumptions JSON, ROI, payback years, NPV, IRR, risk notes, source file, notes, timestamps.

Foreign keys: project ID, asset ID, quote ID, loan ID.

Indexes: scenario type, project ID, asset ID, quote ID.

Notes: modelled options, not actual spend.

Future PostGIS requirements: none directly.

### `maintenance_events`

Primary key: `maintenance_event_id`.

Key fields: asset ID, event type, event date, supplier ID, cost, description, next due date, document ID, photo ID, status, notes, timestamps.

Foreign keys: asset ID, supplier ID, document ID, photo ID.

Indexes: asset ID, event date, next due date, status.

Notes: repair, inspection, service, replacement, fault.

Future PostGIS requirements: asset location can provide map context.

### `grants`

Primary key: `grant_id`.

Key fields: name, jurisdiction, status, program URL, opens at, closes at, eligible items, excluded items, project ID, asset ID, document ID, notes, timestamps.

Foreign keys: project ID, asset ID, document ID.

Indexes: jurisdiction, status, closes at, project ID, asset ID.

Notes: incentives, rebates, grants, R&D support.

Future PostGIS requirements: none directly.

### `loans`

Primary key: `loan_id`.

Key fields: name, loan type, status, lender supplier ID, project ID, principal, rate, term months, fees, repayment amount, document ID, notes, timestamps.

Foreign keys: lender supplier ID, project ID, document ID.

Indexes: loan type, status, lender supplier ID, project ID.

Notes: finance option or active finance.

Future PostGIS requirements: none directly.

### `insurance_records`

Primary key: `insurance_record_id`.

Key fields: record type, status, asset ID, supplier ID, policy number, insured value, renewal date, document ID, notes, timestamps.

Foreign keys: asset ID, supplier ID, document ID.

Indexes: asset ID, renewal date, status.

Notes: insurance and replacement values.

Future PostGIS requirements: asset location can support risk views.

### `permits`

Primary key: `permit_id`.

Key fields: name, permit type, status, authority, project ID, asset ID, location ID, GIS feature ID, issue date, expiry date, document ID, notes, timestamps.

Foreign keys: project ID, asset ID, location ID, GIS feature ID, document ID.

Indexes: permit type, status, authority, expiry date, project ID, asset ID.

Notes: approvals and compliance.

Future PostGIS requirements: GIS Feature link is important for waterway, spillway, building, and land approvals.

### `sensors`

Primary key: `sensor_id`.

Key fields: name, sensor type, status, asset ID, location ID, GIS feature ID, unit, manufacturer, model, serial number, install date, data source, notes, timestamps.

Foreign keys: asset ID, location ID, GIS feature ID.

Indexes: sensor type, status, asset ID, location ID.

Notes: physical or logical data source.

Future PostGIS requirements: link to point GIS Feature or asset location.

### `sensor_readings`

Primary key: `sensor_reading_id`.

Key fields: sensor ID, observed at, value, unit, quality flag, source payload, notes, created at.

Foreign keys: sensor ID.

Indexes: sensor ID and observed at, observed at, quality flag.

Notes: may become high-volume. Partition by time if needed.

Future PostGIS requirements: spatial context through Sensor.

### `ai_insights`

Primary key: `ai_insight_id`.

Key fields: insight type, title, status, summary, recommendation, confidence, model name, reviewed by, reviewed at, accepted decision ID, notes, timestamps.

Foreign keys: accepted decision ID.

Indexes: insight type, status, reviewed at, accepted decision ID.

Notes: AI outputs must cite source records.

Future PostGIS requirements: can link to GIS features through source table.

### `ai_insight_sources`

Primary key: `ai_insight_source_id`.

Key fields: AI insight ID, source entity type, source entity ID, evidence note, confidence.

Foreign keys: AI insight ID.

Indexes: AI insight ID, source entity type and ID.

Notes: mandatory citation layer for AI.

Future PostGIS requirements: none directly.

### `audit_log`

Primary key: `audit_log_id`.

Key fields: actor type, actor ID, action, entity type, entity ID, before JSON, after JSON, source, request ID, occurred at, notes.

Foreign keys: none initially.

Indexes: occurred at, actor type, entity type and ID, request ID.

Notes: append-only. Do not edit previous audit events.

Future PostGIS requirements: none directly.

## Cross-Cutting Requirements

### IDs

Use stable human-readable IDs where the domain benefits from them:

- `AST` or category prefixes for assets
- `PRJ` for projects
- `DEC` for decisions
- `ACT` for actions
- `SUP` for suppliers
- `DOC` for documents
- `FIN` for financial events
- `GIS` for GIS features

### Timestamps

Every table should include `created_at` and `updated_at` unless explicitly append-only.

### Status Fields

Use controlled status values per entity. Avoid free-text status drift.

### Audit

Every create, update, import, delete/archive, AI action, and automation should write to `audit_log`.
