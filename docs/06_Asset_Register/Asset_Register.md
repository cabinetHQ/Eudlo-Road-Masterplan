# Asset Register

## Purpose

This register is the foundation for the Eudlo Road digital twin.

Every physical asset should eventually have its own page with a unique ID, location, documents, maintenance history, financial history, supplier information, decision references, and action items.

The Markdown register is for planning and human review. The structured data version is [assets.csv](../../data/assets.csv).

## Asset Categories

### Buildings

- Workshop
- Existing House
- Future House
- Tiny Home Factory
- Future Tiny Homes
- Sheds
- Carports

### Infrastructure

- Solar
- Battery
- Generator
- Switchboards
- Distribution boards
- Underground conduits
- Water pipes
- Stormwater
- Irrigation
- Dam

### Machinery

- CNC
- Compressor
- Edgebander
- Dust extraction
- Forklift
- Vehicles
- Trailers

### Land

- Forestry blocks
- Dam
- Waterhole
- Driveways
- Fencing
- Koala corridor

### Communications

- NBN
- Starlink
- WiFi
- CCTV

## Initial Placeholder Assets

| Asset ID | Asset name | Category | Status | Notes |
| --- | --- | --- | --- | --- |
| BLD-001 | Workshop | Buildings | Existing | Main manufacturing and energy load centre |
| BLD-002 | Existing House | Buildings | Existing | Existing accommodation/residence asset |
| BLD-003 | Future House | Buildings | Planned | Future residential building placeholder |
| BLD-004 | Tiny Home Factory | Buildings | Planned | Future manufacturing expansion placeholder |
| BLD-005 | Future Tiny Homes | Buildings | Planned | Accommodation/business model placeholder |
| INF-001 | Stage 1 Solar | Infrastructure | Planned | 50 kW solar with design pathway to 100 kW |
| INF-002 | Stage 1 Battery | Infrastructure | Planned | 100 kWh battery |
| INF-003 | Generator | Infrastructure | Planned | Backup/microgrid integration |
| INF-004 | Main Switchboard | Infrastructure | Existing/TBD | Location and capacity to be confirmed |
| INF-005 | Dam | Infrastructure | Existing | Water storage and future pump planning |
| INF-006 | Dam Solar Pump | Infrastructure | Concept | Solar-only recirculation pump concept |
| MAC-001 | CNC | Machinery | Existing/TBD | Confirm model, load, and maintenance requirements |
| MAC-002 | Compressor | Machinery | Existing/TBD | Candidate for MEEG efficiency upgrade |
| MAC-003 | Edgebander | Machinery | Existing/TBD | Confirm load and maintenance requirements |
| MAC-004 | Dust Extraction | Machinery | Existing/TBD | Confirm load and efficiency opportunities |
| LND-001 | Forestry Blocks | Land | Existing | Forestry and land management |
| LND-002 | Waterhole | Land | Concept | Lower plunge basin/waterhole concept |
| LND-003 | Koala Corridor | Land | Existing/TBD | Environmental planning placeholder |
| COM-001 | NBN | Communications | Existing/TBD | Confirm service details |
| COM-002 | Starlink | Communications | Existing/TBD | Confirm service details |
| COM-003 | WiFi | Communications | Existing/TBD | Site network planning |
| COM-004 | CCTV | Communications | Planned/TBD | Security and monitoring placeholder |

## Asset Page Template

Use this template when creating an individual page for an asset.

```markdown
# Asset ID: Asset Name

## Purpose

TBD

## Description

TBD

## Location

TBD

## Installation Date

TBD

## Expected Life

TBD

## Replacement Cost

TBD

## Maintenance Interval

TBD

## Maintenance History

| Date | Work completed | Supplier/person | Cost | Notes |
| --- | --- | --- | ---: | --- |
| TBD | TBD | TBD | TBD | TBD |

## Drawings

- TBD

## Photos

- TBD

## Documents

- TBD

## Supplier

TBD

## Warranty

TBD

## Depreciation Class

TBD

## Insurance Value

TBD

## Future Upgrades

- TBD

## Dependencies

- TBD

## Status

TBD

## Notes

TBD

## Action Items

- TBD

## Decision References

- TBD

## Knowledge Links

- TBD
```

## Next Step

Create individual pages for high-value and high-risk assets first:

- Workshop
- Stage 1 Solar
- Stage 1 Battery
- Generator
- Main Switchboard
- Dam
- Dam Solar Pump
- Compressor
- CNC
