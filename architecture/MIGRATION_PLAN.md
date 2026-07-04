# Migration Plan

## Purpose

This plan describes how to migrate the current repository into the Project Zero canonical data model.

The goal is not to delete the knowledge base. The goal is to convert it into app-ready structured data while preserving Markdown as narrative and decision archive.

## Migration Principle

Do not destroy source material.

Every migration step should:

- Keep original files available until imported data is verified.
- Record mapping assumptions.
- Preserve decision history.
- Avoid creating duplicate sources of truth.
- Allow generated Markdown views later.

## Phase 1: Stabilise Current Sources

### Resolve Duplicate Docs Folder Numbering

Current issue:

- `docs/06_Asset_Register`
- `docs/06_Workshop_Manufacturing`
- `docs/07_Buildings`
- `docs/07_Tiny_Homes`
- `docs/08_Utilities`
- `docs/08_Forestry_Land`

Plan:

1. Do not rename immediately.
2. Create a migration branch when app ingestion work begins.
3. Decide final product-domain folder naming.
4. Add redirects or index notes before moving files.
5. Update all relative links.
6. Run link validation.

Recommended future pattern:

- `docs/assets`
- `docs/buildings`
- `docs/utilities`
- `docs/workshop`
- `docs/land`
- `docs/water`
- `docs/energy`
- `docs/project_zero`

### Make `data/assets.csv` Canonical

Current issue:

- `data/assets.csv` is richer.
- `data/asset_register.csv` is older and overlaps.

Plan:

1. Treat `data/assets.csv` as canonical asset seed.
2. Compare rows from `data/asset_register.csv`.
3. Migrate any missing capacity/location notes into `data/assets.csv`.
4. Mark `data/asset_register.csv` as archived in the Master Index.
5. Eventually move `data/asset_register.csv` to an archive folder.

Do not delete until the app import confirms no information is lost.

### Convert Action Register Into Canonical Actions

Current sources:

- `docs/10_Action_Register/Action_Register.md`
- `data/action_register.csv`

Plan:

1. Treat `data/action_register.csv` as seed input.
2. Import each row into `actions`.
3. Preserve `action_id`.
4. Parse owner, status, due date, and notes.
5. Add relationship columns after import:
   - related assets
   - related projects
   - related decisions
   - related locations
6. Generate Markdown action register from database later.

### Convert Decision Logs Into Structured Decisions

Current source:

- `docs/09_Decision_Logs/*.md`

Plan:

1. Parse filename for `decision_id`.
2. Parse title, status, date, decision, context, rationale, consequences.
3. Store source file path.
4. Link decisions to assets and projects manually at first.
5. Keep Markdown files as decision archive.
6. Later generate decision index from database.

### Convert Financial Model Outputs Into Financial Scenarios

Current sources:

- `tools/solar_financial_model.py`
- `docs/02_Investment_Financial_Strategy/Financial_Model_Output.md`
- `data/assumptions.json`
- financial strategy documents

Plan:

1. Treat `data/assumptions.json` as scenario input.
2. Convert model outputs into `financial_scenarios`.
3. Store model version and source file.
4. Link scenarios to Project `PRJ-001 Stage 1 Solar Battery`.
5. Link scenarios to assets `INF-001` and `INF-002`.
6. Keep Markdown output as generated report.

### Keep Markdown As Narrative / Archive

Markdown should remain for:

- Strategic narrative
- Business cases
- Decision archive
- Founder vision
- Governance
- Human-readable reports
- Generated views

Markdown should not remain the only source for:

- Assets
- Actions
- Maintenance events
- Financial events
- Suppliers
- Quotes
- Sensor readings
- GIS features

## Phase 2: Create Import Maps

Create import mapping files or scripts for:

- `data/assets.csv` -> `assets`
- `data/action_register.csv` -> `actions`
- `docs/09_Decision_Logs/*.md` -> `decisions`
- `data/grants_register.csv` -> `grants`
- `data/investment_options.csv` -> `financial_scenarios`
- `data/energy_usage.csv` -> `sensor_readings` or `energy_usage_imports`
- `data/assumptions.json` -> `financial_assumptions`

## Phase 3: Add Missing IDs

Create stable IDs for:

- Projects
- Suppliers
- Documents
- Photos
- Drawings
- Financial events
- Financial scenarios
- Maintenance events
- Grants
- Loans
- Insurance records
- Permits
- Sensors
- GIS features
- AI insights

## Phase 4: Create Relationship Links

After basic import, create relationship links:

- Assets to decisions
- Assets to actions
- Assets to projects
- Projects to financial scenarios
- Decisions to actions
- Documents to entities
- GIS features to assets
- Sensors to assets

## Phase 5: Generated Markdown Views

Once database import exists, stop manually maintaining duplicate Markdown/CSV views.

Generated views should include:

- Asset register
- Action register
- Decision index
- Supplier quote comparison
- Grant register
- Financial model reports
- Maintenance calendar
- Missing data report

Generated files should clearly say:

```text
Generated from Project Zero database. Do not edit manually.
```

## Phase 6: Archive Legacy Data

Only after verification:

1. Move superseded CSV files to archive.
2. Keep historical Markdown decisions.
3. Keep narrative strategy docs.
4. Replace duplicate registers with generated views.
5. Update Master Index.
6. Record migration in changelog.

## Migration Risks

- Losing context hidden in prose.
- Breaking relative links.
- Treating old CSVs as equal sources of truth.
- Importing `TBD` values as real facts.
- Creating IDs that later need to change.
- Moving folders too early.
- Letting generated Markdown and source tables drift.

## Immediate Next Steps

1. Approve this canonical model.
2. Create a schema implementation branch.
3. Build import scripts for assets, actions, and decisions first.
4. Add structured relationship fields to imported records.
5. Create missing data report.
6. Decide final folder migration plan.
