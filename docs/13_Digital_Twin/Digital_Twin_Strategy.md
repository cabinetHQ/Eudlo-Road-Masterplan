# Digital Twin Strategy

## Executive Summary

The future Eudlo app should become a digital twin of the Eudlo Road property.

The app should not start as a dashboard full of disconnected charts. It should start as an asset-centric system where each physical asset has a unique record linking engineering, financial, operational, maintenance, supplier, grant, and decision information.

## Asset-Centric Architecture

Every physical asset should eventually have:

- Unique ID
- GPS location placeholder
- Drawings
- Documents
- Maintenance records
- Financial history
- Photos
- Linked decisions
- Linked grants
- Linked suppliers
- Linked projects

The initial human-readable source is [Asset Register](../06_Asset_Register/Asset_Register.md). The initial structured app-ingestion source is [assets.csv](../../data/assets.csv).

## Why This Matters

An asset-centric structure lets the future app answer practical questions:

- What assets exist on the property?
- Where are they located?
- What do they cost to maintain?
- What needs replacement?
- Which decisions affected this asset?
- Which supplier installed or serviced it?
- Which grants or incentives relate to it?
- What photos, drawings, and documents belong to it?
- What projects depend on it?

## Minimum Asset Record

| Field | Purpose |
| --- | --- |
| Unique ID | Stable app/database key |
| Asset name | Human-readable name |
| Category | Buildings, Infrastructure, Machinery, Land, Communications |
| Status | Existing, planned, concept, retired, unknown |
| GPS location placeholder | Future map and site-view integration |
| Description | Plain English context |
| Documents | Quotes, warranties, manuals, permits, drawings |
| Maintenance | Intervals and service history |
| Financial history | Purchase cost, replacement cost, depreciation, insurance |
| Linked decisions | Decision records that explain why the asset exists or changed |
| Linked grants | Grant applications or incentives tied to the asset |
| Linked suppliers | Installer, service provider, manufacturer, finance provider |
| Linked projects | Energy, water, buildings, forestry, accommodation, manufacturing |

## Relationship Model

The app should eventually support relationships such as:

- Asset depends on asset
- Asset belongs to project
- Asset has supplier
- Asset has documents
- Asset has photos
- Asset has maintenance event
- Asset has financial record
- Asset links to decision
- Asset links to grant
- Asset links to action item

Example:

```text
INF-002 Stage 1 Battery
  depends on INF-001 Stage 1 Solar
  depends on INF-004 Main Switchboard
  links to DEC-001 Energy Masterplan
  links to DEC-003 Stay Grid-Connected Initially
  links to ACT-020 Identify battery location
```

## Data Principles

- Use stable unique IDs.
- Keep app-ingestion data simple at first.
- Avoid hiding key context only in prose.
- Keep Markdown and CSV aligned.
- Record unknowns as `TBD` rather than guessing.
- Link decisions and actions early.
- Add documents and photos as assets mature.

## Future App Views

Possible app views:

- Property map
- Asset register
- Maintenance calendar
- Energy system view
- Water and dam view
- Building register
- Machinery register
- Supplier and quote view
- Grants and incentives tracker
- Decision timeline
- Action register
- Insurance and replacement-cost view

## Recommendation

Build the digital twin gradually from the asset register.

Start with high-value, high-risk, and infrastructure-critical assets, then expand into buildings, machinery, land, communications, photos, drawings, maintenance logs, and financial records.
