# Entity Relationship Model

## Purpose

This document defines how Project Zero entities link together.

The relationship model is the core of the operating system. It prevents Project Zero from becoming separate dashboards for assets, finance, documents, GIS, maintenance, and AI.

## Relationship Principles

- Assets are the primary anchor for physical reality.
- Locations and GIS Features anchor spatial reality.
- Projects organise change.
- Decisions explain why change happened.
- Actions move work forward.
- Documents, photos, drawings, quotes, and financial records provide evidence.
- Sensors and AI Insights turn static records into operating intelligence.

## Core Relationships

### Asset To Location

Relationship: many Assets may belong to one Location; one Asset may also have multiple spatial references.

Purpose: show where assets are installed, stored, or planned.

Example: `MAC-002 Compressor` belongs to `LOC-001 Workshop Area`.

Implementation: `assets.location_id` points to `locations.location_id`.

### Asset To GIS Feature

Relationship: one Asset may link to one or more GIS Features.

Purpose: represent points, lines, polygons, and infrastructure routes on the map.

Examples:

- Solar array as polygon
- Underground conduit as line
- Switchboard as point
- Dam as polygon

Implementation: primary link through `assets.primary_gis_feature_id`; additional links through `entity_links` or `asset_gis_features`.

### Asset To Project

Relationship: many-to-many.

Purpose: projects create, modify, retire, maintain, or depend on assets.

Example: `PRJ-001 Stage 1 Solar Battery` creates `INF-001 Stage 1 Solar` and `INF-002 Stage 1 Battery`.

Implementation: `project_assets` join table.

### Project To Decision

Relationship: many-to-many.

Purpose: projects need decisions; decisions may affect multiple projects.

Example: `DEC-003 Stay Grid-Connected Initially` affects Stage 1 solar/battery and future microgrid projects.

Implementation: `project_decisions` join table.

### Decision To Action

Relationship: one decision may generate many actions; actions may also relate to multiple decisions.

Purpose: make accepted decisions operational.

Example: `DEC-004 Dam Pump Concept` creates actions to measure lift, estimate pipe run, identify panel location, and obtain pump advice.

Implementation: `decision_actions` join table.

### Asset To Maintenance

Relationship: one Asset has many Maintenance Events.

Purpose: build maintenance history, costs, reliability, and prediction.

Example: `MAC-002 Compressor` has service events, faults, efficiency upgrades, and replacement records.

Implementation: `maintenance_events.asset_id`.

### Asset To Financial Event

Relationship: one Asset may have many Financial Events.

Purpose: trace every dollar to assets and projects.

Examples:

- Purchase cost
- Installation invoice
- Maintenance payment
- Insurance payout
- Depreciation adjustment

Implementation: `financial_events.asset_id` and `financial_events.project_id`.

### Supplier To Quote

Relationship: one Supplier has many Quotes.

Purpose: quote comparison and supplier history.

Example: three solar suppliers each submit a quote for `PRJ-001 Stage 1 Solar Battery`.

Implementation: `quotes.supplier_id`.

### Document To Asset / Project / Decision

Relationship: many-to-many.

Purpose: a document can support several records.

Examples:

- Solar quote links to a supplier, project, assets, and financial scenario.
- Engineering drawing links to an asset, project, GIS feature, and decision.
- Accountant advice links to financial scenario and decision record.

Implementation: `document_links` table with `document_id`, `entity_type`, `entity_id`, and `link_type`.

### Sensor To Asset

Relationship: one Sensor usually belongs to one Asset, but may monitor a Location or GIS Feature.

Purpose: connect live data to the physical system.

Examples:

- Dam level sensor belongs to dam.
- Pump runtime sensor belongs to dam pump.
- Energy meter belongs to switchboard.

Implementation: `sensors.asset_id`, `sensors.location_id`, `sensors.gis_feature_id`.

### AI Insight To Source Records

Relationship: many-to-many.

Purpose: every AI output must cite source records.

Examples:

- Quote comparison insight cites three quotes, two financial scenarios, and one decision record.
- Missing data insight cites assets with `TBD` locations.
- Contradiction insight cites two documents with conflicting assumptions.

Implementation: `ai_insight_sources` with `ai_insight_id`, `source_entity_type`, `source_entity_id`, `evidence_note`.

## Secondary Relationships

| Relationship | Purpose | Recommended implementation |
| --- | --- | --- |
| Asset to Asset | Dependencies and system topology | `asset_relationships` |
| Project to Financial Scenario | Compare options before spend | `financial_scenarios.project_id` |
| Quote to Financial Scenario | Model supplier options | `financial_scenarios.quote_id` or join table |
| Grant to Project | Track funding opportunities | `project_grants` |
| Loan to Project | Track finance options | `loans.project_id` |
| Permit to GIS Feature | Spatial approvals | `permits.gis_feature_id` |
| Photo to GIS Feature | Map field evidence | `photos.gis_feature_id` |
| Drawing to GIS Feature | Connect plans to map | `drawings.gis_feature_id` |
| Maintenance Event to Financial Event | Trace service cost | `financial_events.maintenance_event_id` |
| Action to Asset | Work required on asset | `action_links` |
| Action to Location | Field work by place | `actions.location_id` or `action_links` |

## Relationship Graph Requirements

The app must support relationship traversal.

Example question:

```text
Show everything related to INF-002 Stage 1 Battery.
```

Expected result:

- Asset record
- Location
- GIS point/polygon
- Supplier quotes
- Financial scenarios
- Decisions DEC-001, DEC-002, DEC-003
- Actions ACT-012, ACT-013, ACT-020
- Documents and drawings
- Maintenance events
- Sensor readings
- AI insights
- Audit history

## Relationship Integrity Rules

- A Financial Event over $1,000 should link to at least one Asset or Project.
- A Decision affecting infrastructure should link to at least one Asset or Project.
- A Maintenance Event must link to an Asset.
- A Sensor Reading must link to a Sensor.
- A Quote must link to a Supplier.
- A Document should link to at least one relevant entity.
- An AI Insight must link to source records.
- A GIS Feature should link to a Location, Asset, Project, or layer purpose.
