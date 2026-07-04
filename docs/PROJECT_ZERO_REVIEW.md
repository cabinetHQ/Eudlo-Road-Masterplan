# Project Zero Repository Review

## Executive Score

Current repository score: 63 out of 100.

The repository is a strong knowledge-base seed. It is not yet a product architecture.

It has useful planning content, decision discipline, and early structured data. The main weakness is that information still lives mostly as documents and flat CSV files rather than a coherent operating system model.

## What Should Be Deleted

Do not delete anything immediately.

Deletion should wait until content has been migrated into a canonical model. The current repository is still the only source of truth.

Candidates for later removal or archival:

- `data/asset_register.csv` after `data/assets.csv` becomes the canonical asset seed.
- Placeholder-only pages after they are replaced by database-backed module records.
- Duplicate short planning documents after fuller master documents become canonical.

## What Should Be Merged

Merge later, not now:

| Current duplication | Recommended merge |
| --- | --- |
| `data/asset_register.csv` and `data/assets.csv` | Use `assets.csv` as canonical seed, archive `asset_register.csv` |
| `Energy_Masterplan.md` and `Energy_Infrastructure_Master_Plan.md` | Make the detailed master plan canonical, keep short page as landing page |
| `Water_Dam_Irrigation.md` and `Dam_Solar_Pump_Concept.md` | Keep water overview, make dam pump an asset/project module |
| `App_Integration.md` and `Digital_Twin_Strategy.md` | Merge into Project Zero architecture once app work starts |
| Action register Markdown and CSV | Replace with database table and generated Markdown view |

## What Should Be Renamed

Rename only after a deliberate migration plan:

- Repository could eventually be renamed from `Eudlo-Road-Masterplan` to `Project-Zero` or `Project-Zero-Eudlo`.
- `docs/12_App_Integration` should become `docs/12_Project_Zero` or be superseded by root-level Project Zero documents.
- Duplicate numbered folders should be resolved. The current index has both `06_Asset_Register` and `06_Workshop_Manufacturing`, both `07_Buildings` and `07_Tiny_Homes`, and both `08_Utilities` and `08_Forestry_Land`.
- Future folders should use product domains rather than document-era numbering.

## What Should Become Database Tables

Priority tables:

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
- `grants`
- `loans`
- `insurance_records`
- `permits`
- `audit_log`
- `ai_insights`

## What Should Become Dashboards

First dashboards:

- Property operating map
- Energy system
- Water and dam
- Asset health
- Open actions by location
- Decisions timeline
- Capital allocation
- Maintenance calendar
- Grant and finance pipeline
- Workshop load and machinery
- Documents requiring review
- Missing data dashboard

## What Should Become App Modules

Core app modules:

- Map
- Assets
- Projects
- Decisions
- Actions
- Documents
- Finance
- Maintenance
- Energy
- Water
- Buildings
- Workshop
- Land and ecology
- Suppliers
- Grants and R&D
- Sensors
- Automations
- AI assistant
- Governance

## Strengths

- Clear project purpose and strong governance.
- Decision logs already exist and are useful.
- Energy and financial thinking is practical and grounded.
- Digital twin direction is already established.
- Asset-centric architecture has started.
- Structured data exists in CSV form.
- Action register captures many real next steps.
- Grant and R&D separation is sensible.
- The repository is already Git-backed and pushed to GitHub.

## Weaknesses

- The repo is still document-first.
- No real entity relationship model exists yet.
- No database schema exists.
- No GIS schema exists.
- No product module boundaries exist.
- Action items are flat rows with no dependencies or links beyond prose.
- Assets are not yet fully geospatial.
- Financial records are models, not ledgers.
- Documents, photos, drawings, and drone imagery have no storage architecture.
- Maintenance is not yet operationalised.
- Sensors and live data are not modelled.
- AI is discussed but not architected as a governed system.

## Technical Debt

- Duplicate folder numbers in `docs`.
- Parallel asset CSVs.
- Markdown and CSV registers must be kept manually aligned.
- Decision records are not yet indexed as structured data.
- No unique IDs for projects, suppliers, documents, drawings, photos, financial events, or maintenance events.
- No relationship graph.
- No separation between source documents and generated views.
- No app ingestion pipeline.
- No testing or validation scripts for repository integrity beyond manual checks.

## Knowledge Gaps

- Property boundary and GIS base data.
- GPS locations for assets.
- Roof, ground-mount, switchboard, generator, and battery locations.
- Interval electricity data.
- Major machine load profile.
- Water system measurements.
- Pipe routes, conduit routes, stormwater, and drainage.
- Supplier quote details.
- Maintenance intervals and history.
- Insurance values.
- Depreciation classes.
- Grant eligibility confirmations.
- Sensor strategy.
- Photos, drawings, manuals, permits, and warranties.

## Duplicated Information

- Energy baseline appears in energy docs, financial docs, decision logs, assumptions JSON, and model output.
- Asset information appears in Markdown asset register, `assets.csv`, and older `asset_register.csv`.
- Actions appear in Markdown and CSV.
- App integration and digital twin concepts overlap.
- Grant exclusions appear in grants register, grants strategy, action register, and decision logs.

Duplication is acceptable while bootstrapping, but it must become generated views from canonical data once the app begins.

## Missing Architecture

- Product architecture
- Data architecture
- GIS architecture
- AI architecture
- Sensor architecture
- Offline architecture
- Document/media architecture
- Security and permissions model
- Audit log model
- Integration model

## Missing Relationships

Project Zero needs explicit relationships:

- Asset to asset
- Asset to location
- Asset to project
- Asset to decision
- Asset to action
- Asset to supplier
- Asset to document
- Asset to photo
- Asset to maintenance event
- Asset to financial event
- Project to budget
- Project to outcome
- Decision to assumption
- Sensor to asset
- GIS feature to asset

## Missing Workflows

- New asset created
- New project proposed
- New quote received
- Capital spend approval
- Decision approval
- Maintenance event completed
- Document uploaded
- Photo captured
- Drone flight processed
- Sensor anomaly detected
- Grant opportunity assessed
- AI recommendation reviewed

## Missing GIS Requirements

- Boundary data
- Coordinate system
- Asset GPS capture
- Roads/tracks layer
- Water system layer
- Electrical layer
- Communications layer
- Forestry layer
- Koala corridor layer
- Drone imagery storage
- LiDAR readiness
- Offline map support

## Missing Financial Modelling

- Asset-level ledger
- Project budget vs actuals
- Maintenance cost history
- Insurance value history
- Depreciation schedule
- Loan schedules
- Grant payment tracking
- Supplier spend analysis
- Scenario versioning
- Sensitivity analysis by project

## Missing Engineering Requirements

- Electrical single-line diagrams
- Water topology
- Conduit and pipe route maps
- Switchboard and distribution board register
- Load profile by machine
- Generator integration specification
- Battery inverter capacity modelling
- Pump curves and irrigation requirements
- Road and drainage condition data

## Missing Automation Opportunities

- Bill ingestion
- Quote ingestion
- Action generation from decisions
- Maintenance reminders
- Warranty reminders
- Grant deadline alerts
- Sensor anomaly alerts
- Weather-triggered workflows
- Drone image processing queue
- Missing data alerts

## Missing AI Opportunities

- Quote comparison
- Decision drafting
- Missing data detection
- Assumption challenge agent
- Grant eligibility assistant
- Engineering risk assistant
- Financial scenario assistant
- Drone imagery analysis
- Maintenance prediction
- Contradiction detection across documents

## Highest Value Next Steps

1. Define the canonical entity relationship model.
2. Resolve duplicate folder numbering in a migration branch.
3. Make `assets.csv` canonical and archive `asset_register.csv`.
4. Create database schema draft for assets, projects, decisions, actions, finance, maintenance, documents, GIS, and sensors.
5. Capture property boundary and first GIS layers.
6. Create unique IDs for projects, suppliers, documents, photos, drawings, maintenance events, and financial events.
7. Design the app shell around the property map.
8. Build import scripts from current Markdown/CSV into database-ready JSON.
9. Create the missing data dashboard.
10. Build the first AI retrieval prototype with citations and governance guardrails.

## Final Assessment

The repository has crossed the line from notes into a real system seed.

The next danger is continuing to add documents when the real need is a data model, map model, event model, and workflow model.

Project Zero should now become a product architecture project.
