# Project Zero Architecture

## Architecture Intent

Project Zero is the Eudlo App: a standalone operating system for a privately owned rural property.

It is not part of BoundHQ. It is a separate platform and proving ground. BoundHQ may later adopt ideas, but Project Zero must not be constrained by BoundHQ's workflows, data model, product priorities, or technical limitations.

## Product Model

Project Zero should be built around a small number of core concepts:

- Asset
- Location
- Project
- Decision
- Action
- Document
- Photo
- Drawing
- Supplier
- Financial event
- Maintenance event
- Sensor reading
- GIS feature
- Automation
- AI insight

Everything links back to these concepts.

## Frontend

### Primary Interface

The primary interface should be a map-first property operating console.

Core views:

- Property map
- Asset profile
- Project view
- Decision timeline
- Action board
- Financial dashboard
- Maintenance calendar
- Document vault
- Sensor dashboard
- AI assistant

### Web App

Use a responsive web app as the primary interface.

Requirements:

- Fast desktop experience
- Usable tablet experience
- Mobile field capture
- Map-first navigation
- Search across all records
- Relationship graph views
- Offline-capable forms for site work

### Mobile

Mobile should focus on field capture:

- Add photo
- Add note
- Add asset location
- Complete maintenance task
- Scan document
- Record issue
- View map offline
- Ask AI about current location or asset

### Desktop

Desktop should focus on analysis:

- Finance modelling
- GIS review
- Quote comparison
- Decision review
- Engineering planning
- Document management
- Dashboard monitoring

## Backend

### API Layer

The backend should expose a stable API for:

- Assets
- Locations
- GIS features
- Projects
- Decisions
- Actions
- Documents
- Photos
- Suppliers
- Financial records
- Maintenance records
- Sensor readings
- Automations
- AI retrieval

API design should support future integrations, not just the first app.

### Services

Core backend services:

- Identity and permissions
- Asset service
- GIS service
- Document service
- Media service
- Financial service
- Maintenance service
- Sensor ingestion service
- Automation service
- AI orchestration service
- Import/export service

## Database

### Recommended Direction

Use a relational database with spatial support.

Recommended foundation:

- PostgreSQL
- PostGIS
- Object storage for photos, drawings, drone imagery, and documents
- Vector index for AI retrieval
- Time-series storage strategy for sensors and energy data

### Core Tables

Initial tables:

- `assets`
- `asset_relationships`
- `locations`
- `gis_features`
- `projects`
- `decisions`
- `actions`
- `documents`
- `photos`
- `drawings`
- `suppliers`
- `quotes`
- `financial_events`
- `financial_scenarios`
- `maintenance_events`
- `sensors`
- `sensor_readings`
- `weather_observations`
- `automations`
- `ai_insights`
- `audit_log`

### Why Not Just Markdown And CSV

Markdown and CSV are useful source material, but they are not the operating system.

The app needs:

- Relationships
- Permissions
- Search
- Queries
- Spatial joins
- Version history
- Audit history
- Attachments
- Time-series data
- AI retrieval
- Offline sync

## GIS

GIS is not a later feature. It is core architecture.

Required layers:

- Property boundary
- Buildings
- Roads and tracks
- Fences and gates
- Dam and water features
- Forestry blocks
- Koala corridor
- Underground conduits
- Water pipes
- Stormwater
- Irrigation
- Electrical infrastructure
- Communications infrastructure
- Sensors
- Cameras
- Drone imagery
- LiDAR terrain model

GIS requirements:

- PostGIS geometry storage
- Support point, line, polygon, raster references
- GPS capture from mobile
- Layer permissions
- Offline map caching
- Import/export GeoJSON
- Future drone orthomosaic and LiDAR support

## Authentication

Authentication must be simple at first and expandable later.

Roles:

- Owner
- Admin
- Contributor
- Contractor
- Read-only advisor
- AI agent

Permission examples:

- Contractors can view assigned assets and upload documents/photos.
- Accountants can view finance records but not private site notes unless granted.
- Solar installers can view energy assets, quotes, and electrical documents.
- AI agents can read broadly but must follow governance rules before writing.

## AI Architecture

AI should be a governed operating layer.

Capabilities:

- Retrieval across assets, decisions, documents, actions, finance, GIS, and suppliers
- Draft decision records
- Detect contradictions
- Detect missing data
- Compare quotes
- Summarise supplier documents
- Extract data from bills and invoices
- Analyse drone imagery
- Recommend maintenance
- Score ideas using the decision framework
- Generate action items from accepted decisions

Requirements:

- Source citations
- Audit trail of AI-generated changes
- Human approval for decisions
- No silent overwrites
- Separate facts from assumptions
- Respect the governance startup sequence

## Documents

Documents need to become database-linked objects, not loose files.

Document types:

- Quote
- Invoice
- Bill
- Drawing
- Manual
- Warranty
- Permit
- Grant application
- Finance document
- Insurance document
- Photo report
- Decision support document

Document processing:

- Upload
- OCR
- Metadata extraction
- Asset linking
- Supplier linking
- Project linking
- Decision linking
- Versioning
- AI summary

## Photos

Photos should link to:

- Asset
- Location
- Project
- Date
- Photographer
- Direction or viewpoint
- Maintenance event
- Decision record

The photo system should support before/after comparisons and field capture.

## Drone Imagery

Drone imagery should be treated as a first-class data source.

Requirements:

- Flight log
- Raw image storage
- Processed orthomosaic storage
- GIS layer registration
- Before/after comparisons
- Asset detection candidates
- Erosion and vegetation change review
- Future LiDAR integration

## Sensors

Sensor architecture should support:

- Energy interval data
- Battery state
- Solar output
- Generator runtime
- Dam level
- Pump runtime
- Rainfall
- Weather
- Soil moisture
- Camera health
- Gate state
- Equipment runtime

Sensor readings should be time-stamped, linked to assets, and queryable for dashboards and AI analysis.

## Offline Mode

Offline mode is required because rural property work cannot assume reliable connectivity everywhere.

Offline priorities:

- View asset records
- View map
- Capture photos
- Add notes
- Complete maintenance tasks
- Record GPS points
- Queue uploads
- Sync when online

## Future Integrations

Likely future integrations:

- Electricity retailer interval data
- Solar inverter API
- Battery API
- Weather station API
- Bureau of Meteorology data
- Accounting software
- Bank feeds or finance exports
- Supplier email ingestion
- Document storage
- Drone processing tools
- GIS tools
- Sensor platforms
- Security camera system
- Calendar and reminders

## Deployment Strategy

Start simple but do not paint the architecture into a corner.

Recommended path:

1. Prototype with a web app, relational database, object storage, and import tools.
2. Add map-first UI and asset profiles.
3. Add document ingestion and relationship linking.
4. Add financial and maintenance modules.
5. Add sensors and automations.
6. Add AI retrieval and governed AI workflows.
7. Add predictive models.

## Non-Negotiables

- No duplicated systems of record.
- No assets without IDs.
- No major decisions without decision records.
- No capital projects without financial context.
- No map features that cannot link to records.
- No AI actions without audit trail.
- No architecture that prevents offline field capture.
