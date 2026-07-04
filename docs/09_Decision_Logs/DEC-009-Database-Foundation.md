# DEC-009: Database Foundation

## Status

Accepted

## Date

2026-07-04

## Decision

Project Zero now has a draft PostgreSQL/PostGIS database foundation. The database schema will become the basis for future app development, imports, dashboards and AI retrieval.

## Context

Project Zero now has a canonical data model, entity relationship model, database schema draft, GIS data model, and migration plan. The next step is to turn those architecture documents into the first implementation-ready database package.

The repository still remains the source of truth during the transition, but the future app requires structured tables, relationships, indexes, seed data, spatial support, and audit-ready records.

## Rationale

- PostgreSQL provides a stable relational foundation.
- PostGIS supports the map-first property operating system vision.
- Stable text IDs keep records readable during early development.
- Seed SQL allows the current repository knowledge to become app-ready data.
- A database foundation is required before dashboards, imports, automations, and AI retrieval can be built reliably.

## Consequences

- `/database/schema.sql` becomes the first draft implementation schema.
- `/database/seed` becomes the first migration seed layer.
- Markdown continues as narrative and decision archive.
- Future work should create import scripts and generated views rather than manually duplicating structured data.
- The schema may change before app build, but future changes should preserve the canonical entity direction.
