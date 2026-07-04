# DEC-006: Digital Twin Architecture

## Status

Accepted

## Date

2026-07-04

## Decision

The Eudlo Road app will use an asset-centric architecture where every physical asset has a unique record that links engineering, financial and operational information.

## Context

Project Eudlo is becoming a living documentation and planning system for energy, water, buildings, workshop infrastructure, machinery, land, suppliers, grants, decisions, and actions.

The future app needs a structure that can connect these domains without losing practical site context.

## Rationale

- Assets are the natural anchor point for property operations.
- Engineering documents, financial records, maintenance, insurance, suppliers, photos, grants, and decisions can all link back to assets.
- Unique asset IDs make future app ingestion easier.
- Asset-centric records support map views, maintenance planning, replacement planning, depreciation, and grant tracking.

## Consequences

- Every significant physical asset should eventually have its own page.
- `data/assets.csv` becomes the initial structured asset source for app ingestion.
- Decision records and action items should reference asset IDs where practical.
- Future documents should avoid describing assets only in prose when they need structured tracking.
