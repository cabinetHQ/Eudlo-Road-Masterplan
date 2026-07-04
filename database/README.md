# Project Zero Database

## Purpose

This folder contains the first app-ready database layer for Project Zero.

It is not the app. It is the foundation that future app development, imports, dashboards, automation, GIS, and AI retrieval should build on.

## Files

- [schema.sql](schema.sql): draft PostgreSQL/PostGIS schema.
- [seed/assets.seed.sql](seed/assets.seed.sql): initial locations, GIS placeholders, suppliers, projects, assets, and asset relationships.
- [seed/decisions.seed.sql](seed/decisions.seed.sql): seed records for DEC-001 to DEC-008.
- [seed/actions.seed.sql](seed/actions.seed.sql): seed records for key open actions and initial links.

## Source Of Truth Direction

Markdown remains the narrative record and decision archive.

The database becomes the future operational source of truth for:

- Assets
- Locations
- GIS features
- Projects
- Decisions
- Actions
- Documents
- Suppliers
- Quotes
- Financial records
- Maintenance records
- Grants
- Loans
- Permits
- Sensors
- AI insights
- Audit history

## Current Status

The schema is a draft and may change before app build.

The current goal is to define stable foundations:

- text IDs instead of UUIDs for readable records
- PostgreSQL tables for canonical entities
- PostGIS support for map-first architecture
- seed data from the current repository
- audit-ready relationships for future AI and automation

## Suggested Load Order

```sql
\i database/schema.sql
\i database/seed/assets.seed.sql
\i database/seed/decisions.seed.sql
\i database/seed/actions.seed.sql
```

## Notes

- `CREATE EXTENSION IF NOT EXISTS postgis;` requires PostGIS to be installed in the target PostgreSQL environment.
- Geometry values are seeded as `NULL` until property boundary, asset GPS points, and GIS layers are captured.
- Future generated Markdown views should come from the database rather than being manually duplicated.
