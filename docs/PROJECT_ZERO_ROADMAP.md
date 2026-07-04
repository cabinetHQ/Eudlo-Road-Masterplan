# Project Zero Roadmap

## Purpose

This is the five-year roadmap for Project Zero, the Eudlo App.

Project Zero is a separate platform from BoundHQ. It is the proving ground for every idea about running a privately owned rural property as an integrated operating system.

## Strategic Direction

The repository is currently a strong knowledge base. The next shift is to convert knowledge into systems:

- From Markdown pages to product modules
- From CSV registers to databases
- From static notes to linked entities
- From documents to workflows
- From estimates to measured data
- From dashboards to decisions
- From AI chat to AI operating layer

## Phase 1: Foundation

### Goal

Create the product, data, and governance foundation that prevents Project Zero becoming another disconnected dashboard.

### Build

- Product architecture and module boundaries
- Core entity model
- Unique IDs for every asset, project, decision, supplier, document, action, location, and financial event
- Database schema design
- Document ingestion strategy
- Photo and drawing storage strategy
- Basic app shell
- Authentication and role model
- Property map baseline
- Import pipeline from current Markdown and CSV files

### Convert From Repository

| Current source | Future system |
| --- | --- |
| `data/assets.csv` | `assets` table |
| `data/action_register.csv` | `actions` table |
| Decision logs | `decisions` table plus linked Markdown archive |
| Financial model output | `financial_scenarios` and `financial_assumptions` |
| Master Index | App navigation and module registry |
| Governance docs | System rules and AI policy layer |

### Outcomes

- Project Zero has a defined data model.
- Every new record can be linked to assets, decisions, projects, and locations.
- The app can ingest current repository data without losing context.

## Phase 2: Property Digital Twin

### Goal

Create the live spatial and asset model of the property.

### Build

- GIS map of property boundaries, buildings, roads, tracks, fences, dam, waterhole, forestry blocks, koala corridor, and infrastructure
- Asset map layer
- Building footprints
- Utility routes
- Photo geotagging
- Drone imagery library
- Asset pages generated from database records
- Maintenance history by asset
- Decision history by asset
- Supplier and document links by asset

### Key Requirements

- PostGIS or equivalent spatial database capability
- Coordinate system and GPS accuracy standard
- Offline map capture
- Support for drone orthomosaic and LiDAR later
- Asset relationship graph

### Outcomes

- The map becomes the main interface.
- Assets are no longer only rows in a CSV.
- Decisions and actions can be viewed spatially.

## Phase 3: Engineering Systems

### Goal

Model the property's infrastructure as connected engineering systems.

### Build

- Electrical system model
- Solar, battery, generator, grid, switchboard, distribution board, and major load records
- Water system model
- Dam pump, irrigation, stormwater, water pipes, tanks, valves, and drainage records
- Communications model
- NBN, Starlink, WiFi, CCTV, sensors, and network coverage records
- Machinery load profile database
- Engineering document register
- Drawings and revision control
- Scenario planning for expansion

### Dashboards

- Energy system dashboard
- Water and irrigation dashboard
- Workshop load dashboard
- Communications health dashboard
- Engineering risks dashboard

### Outcomes

- Expansion decisions are tested against known system capacity.
- Project Zero can show dependencies before work starts.
- Engineering drawings become linked system records.

## Phase 4: Financial Intelligence

### Goal

Make every dollar traceable and every major spend comparable.

### Build

- Financial ledger by asset and project
- Capital expenditure tracking
- Operating cost tracking
- Maintenance cost tracking
- Supplier quote comparison
- Depreciation and insurance value fields
- Grant and incentive tracking
- Loan and finance scenario modelling
- ROI, payback, NPV, IRR, and opportunity cost modules
- Budget vs actual by project

### Dashboards

- Property investment dashboard
- Energy savings dashboard
- Asset replacement forecast
- Project cashflow dashboard
- Grant pipeline dashboard
- Supplier spend dashboard

### Outcomes

- Capital purchases over $1,000 can be evaluated consistently.
- Solar, battery, machinery, water, buildings, and land projects can be compared.
- Financial records connect to decisions, assets, suppliers, and maintenance.

## Phase 5: Automation

### Goal

Reduce future work by automating data capture, reminders, monitoring, and routine workflows.

### Build

- Bill and invoice ingestion
- Quote ingestion and comparison
- Maintenance reminders
- Warranty expiry alerts
- Insurance review alerts
- Grant deadline monitoring
- Weather-triggered workflows
- Pump and irrigation scheduling
- Sensor health checks
- Camera and security event capture
- Document classification and tagging
- Action generation from decisions

### Automations

- New quote received -> supplier record, quote record, comparison prompt
- New decision approved -> linked actions and affected asset updates
- Maintenance due -> notification and asset history update
- Large spend proposed -> financial scorecard required
- New drone imagery uploaded -> map layer and asset photo candidates

### Outcomes

- The system starts removing admin instead of adding it.
- Important follow-ups are not lost.
- The property becomes easier to operate over time.

## Phase 6: Artificial Intelligence

### Goal

Embed AI as a decision-support and operating layer, not a chatbot bolted onto documents.

### Build

- AI retrieval over documents, assets, decisions, suppliers, finance, and GIS
- Quote comparison agent
- Engineering assumption checker
- Grant opportunity agent
- Financial scenario agent
- Maintenance prediction assistant
- Drone imagery analysis assistant
- Document extraction pipeline
- Voice/photo field capture assistant
- AI-generated decision record drafts
- AI-generated action recommendations

### Guardrails

- AI must cite source records.
- AI cannot overwrite accepted decisions.
- AI must identify missing data.
- AI recommendations must link to assets, projects, decisions, and assumptions.
- AI must separate facts, estimates, and opinions.

### Outcomes

- Project Zero becomes a thinking layer over the property.
- The AI reduces decision risk and knowledge loss.
- Every AI suggestion strengthens the system of record.

## Phase 7: Predictive Property Management

### Goal

Move from reactive operation to predictive management.

### Build

- Predictive maintenance models
- Energy load forecasting
- Battery and solar performance forecasting
- Water availability forecasting
- Irrigation demand forecasting
- Fire risk and storm preparation workflows
- Road and drainage risk monitoring
- Asset replacement forecasting
- Cashflow and capital planning forecast
- Ecological trend monitoring
- Scenario simulator for future buildings, manufacturing growth, accommodation, and grid/off-grid decisions

### Outcomes

- Project Zero identifies problems before they become expensive.
- Infrastructure planning becomes proactive.
- The property compounds in operational intelligence every year.

## Five-Year Success Definition

Project Zero succeeds if, within five years:

- Every major asset has a digital identity.
- Every capital project has a financial and decision record.
- The property map is the primary interface.
- Key systems have live or regularly updated data.
- Maintenance is visible before failure.
- Expansion decisions are modelled before spending.
- AI can answer property questions with citations.
- The system saves more time than it takes to maintain.
