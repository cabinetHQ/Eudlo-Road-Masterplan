# DEC-008: Canonical Data Model

## Status

Accepted

## Date

2026-07-04

## Decision

Project Zero will now treat structured entities as the future source of truth. Markdown remains the narrative and decision archive, but future app development will use canonical data models for assets, projects, decisions, actions, finance, GIS, documents and sensors.

## Context

Project Zero has moved beyond documentation into platform architecture. The current repository contains useful Markdown documents and CSV registers, but the Project Zero app requires canonical entities, relationships, database tables, GIS layers, and migration rules.

The repository review identified duplicate folder numbering, parallel asset CSVs, missing database schema, missing GIS model, missing entity relationship model, and duplicated information across Markdown and CSV files.

## Rationale

- Structured entities are required for app workflows, dashboards, AI, automation, GIS, and financial intelligence.
- Markdown cannot be the long-term operational source for assets, actions, finance, maintenance, sensors, and GIS.
- Decision history and strategic narrative should remain in Markdown because they are human-readable and auditable.
- Canonical models reduce duplication and make future generated views possible.

## Consequences

- `data/assets.csv` becomes the preferred seed for the future `assets` table.
- `data/asset_register.csv` should be archived after migration.
- Action and decision Markdown views should eventually be generated from structured data.
- Future app work should start from the architecture files in `/architecture`.
- AI agents should treat Markdown as narrative/archive and canonical entities as the future app source of truth.
