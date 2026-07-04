# Naming Standards

## Purpose

Consistent naming makes the repository easier to search, maintain, and convert into an app.

Use plain English, stable IDs, and predictable filenames.

## Assets

Format:

```text
CATEGORY-### Asset Name
```

Examples:

- `BLD-001 Workshop`
- `INF-001 Stage 1 Solar`
- `MAC-002 Compressor`
- `LND-003 Koala Corridor`
- `COM-004 CCTV`

Use the asset ID consistently in documents, action items, decisions, photos, drawings, and future app records.

## Buildings

Use clear building names:

- `Workshop`
- `Existing House`
- `Future House`
- `Tiny Home Factory`
- `Future Tiny Homes`
- `Shed 01`
- `Carport 01`

Suggested asset ID prefix: `BLD`.

## Projects

Format:

```text
PRJ-### Project Name
```

Examples:

- `PRJ-001 Stage 1 Solar Battery`
- `PRJ-002 Dam Solar Pump`
- `PRJ-003 Digital Twin`

## Decision Logs

Format:

```text
DEC-###-Short-Decision-Name.md
```

Examples:

- `DEC-001-Energy-Masterplan.md`
- `DEC-006-Digital-Twin.md`

Decision numbers must not be reused.

## Suppliers

Format:

```text
Supplier_Name_YYYY-MM-DD.md
```

Examples:

- `SolarSupplier_2026-07-04.md`
- `PumpSupplier_2026-07-04.md`

Use the legal supplier name when known.

## Financial Models

Format:

```text
Financial_Model_Topic_YYYY-MM-DD.md
```

Examples:

- `Financial_Model_Solar_Battery_2026-07-04.md`
- `Financial_Model_Dam_Pump_2026-07-04.md`

Generated outputs may keep stable filenames when scripts regenerate them.

## Photos

Format:

```text
ASSETID_YYYY-MM-DD_Description_Sequence.jpg
```

Examples:

- `INF-004_2026-07-04_Main-Switchboard_001.jpg`
- `BLD-001_2026-07-04_Workshop-Roof_001.jpg`

## Drone Imagery

Format:

```text
DRONE_YYYY-MM-DD_Location_Flight-###_Sequence.ext
```

Examples:

- `DRONE_2026-07-04_Workshop-Roof_Flight-001_001.jpg`
- `DRONE_2026-07-04_Dam_Flight-002_001.jpg`

## Drawings

Format:

```text
DRAWING_Asset-or-Project_Description_Revision.ext
```

Examples:

- `DRAWING_INF-001_Solar-Layout_R01.pdf`
- `DRAWING_PRJ-002_Dam-Pump-Concept_R01.pdf`

## Folders

Use numbered folders for major document sections and plain title case words separated by underscores.

Examples:

- `docs/01_Energy_Infrastructure_Masterplan`
- `docs/13_Digital_Twin`
- `GOVERNANCE`

Avoid renaming established folders unless there is a strong reason, because links and future app ingestion may depend on stable paths.
