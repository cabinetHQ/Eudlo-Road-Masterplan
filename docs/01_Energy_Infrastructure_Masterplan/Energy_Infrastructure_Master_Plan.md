# Energy Infrastructure Master Plan

## Executive Summary

The Eudlo Road energy system should be planned as a staged, grid-connected, microgrid-capable infrastructure project.

Stage 1 should remain the current planning target: 50 kW solar + 100 kWh battery, with generator integration and electrical design that allows future expansion to 100 kW solar. The system should support the existing workshop first, then future dam pumping, EV charging, tiny home manufacturing, future buildings, irrigation, and accommodation loads.

The recommended approach is to stay grid-connected initially. Off-grid operation should only be considered later if real interval data, workshop load data, solar production data, battery performance, and generator operating costs show that disconnection is safe and financially sensible.

## Current Known Baseline

| Item | Current known baseline |
| --- | ---: |
| Average monthly electricity bill | $1,200 |
| Estimated annual electricity cost | $14,400 |
| Average daily consumption | 93 kWh/day |
| Likely workday load | Higher than average |
| Current tariff details | TBD |
| Demand charges | TBD |
| Export limit | TBD |

The current bill is the primary financial baseline. The 93 kWh/day usage figure is a useful sizing reference, but it does not show peak demand, daytime load, machine start-up demand, export constraints, or weekend/workday differences.

## Existing Workshop Load Assumptions

The workshop is assumed to be the main controllable and expandable electrical load on site.

Current assumptions:

- Workday consumption is likely higher than the daily average.
- Major machine loads are not yet fully listed.
- Some loads may be shiftable into solar production windows.
- Compressor, motors, dust extraction, lighting, and automation loads may affect peak demand.
- Machine start-up current may be more important than average kWh consumption for inverter and generator sizing.

Required load data:

- Machine name
- Rated kW or amps
- Phase requirements
- Start-up current
- Typical run hours
- Duty cycle
- Criticality during outages

## Stage 1 System

Stage 1 should be planned as:

| Component | Planning target |
| --- | ---: |
| Solar array | 50 kW |
| Battery | 100 kWh |
| Future solar design allowance | 100 kW |
| Generator integration | Required |
| Grid connection | Retain initially |

The Stage 1 system should prioritise reducing daytime grid imports, shifting solar into evening/early morning loads, improving outage resilience, and creating the electrical foundation for future expansion.

## Design-For-Expansion Principle

Infrastructure should be sized and located with the 100 kW future solar target in mind.

Design items to consider:

- Switchboard capacity and location
- Inverter location and expandability
- Battery location and ventilation/fire separation
- Cable pathways
- Roof and ground-mount layout
- Export control requirements
- Generator transfer arrangements
- Monitoring and data capture
- Space for future isolation, protection, and metering equipment

The goal is not to buy everything on day one. The goal is to avoid rework when Stage 2 becomes justified.

## Conservative Solar Realism

Do not assume solar nameplate output is continuous.

For planning purposes, 100 kW of panels should be treated as a reliable 40-60 kW daytime source, not a 100 kW continuous supply. Output will vary with weather, season, panel orientation, shading, inverter limits, export controls, and site load.

This assumption should be used when assessing workshop production, battery charging, dam pumping, EV charging, and future building loads.

## Generator Integration

Generator integration should be part of the core energy architecture.

Planning questions:

- Which circuits are critical during an outage?
- Should the generator support the whole workshop or only selected loads?
- Should the generator charge the battery?
- Is manual transfer adequate, or is automatic transfer required?
- What generator capacity is needed for machine start-up loads?
- Where can the generator be safely located for noise, exhaust, refuelling, and access?

Generator design should reduce outage risk without creating dependence on fuel as the normal operating strategy.

## Grid-Connected Vs Off-Grid Recommendation

The initial recommendation is to stay grid-connected.

Reasons:

- The site has active workshop and future manufacturing loads.
- Interval data is not yet available.
- Off-grid design requires much larger safety margins.
- Generator dependency can become expensive and operationally risky.
- Production downtime may cost more than grid supply charges.
- Future loads are still uncertain.

The system should be designed as microgrid-capable, meaning it can operate selected loads during outages and may support later disconnection if justified by data.

## Future Loads

### Dam Pump

The dam pump should be assessed separately from the main workshop system if it can operate as a solar-only non-critical load. A solar-only pump may avoid adding unnecessary load to the main battery system.

### EV Charging

EV charging should be treated as a controllable load. It should be scheduled for solar production windows where practical and should not be allowed to compromise workshop operations.

### Tiny Home Manufacturing

Tiny home manufacturing may increase workshop energy use, especially if production volume increases. Load planning should include tools, compressor use, dust extraction, lighting, CNC or automation equipment, and finishing equipment.

### Future Buildings

Future buildings may add lighting, air conditioning, hot water, refrigeration, office equipment, workshop sub-loads, or accommodation loads. Electrical pathways should be planned early even if buildings are staged later.

### Irrigation

Irrigation pumping should be scheduled during solar windows where possible. Pipe length, lift height, required pressure, and water volume will determine whether it belongs on the main energy system or a separate solar pump system.

### Accommodation

Accommodation loads may include hot water, cooking, air conditioning, refrigeration, lighting, Wi-Fi, laundry, and EV charging. These loads can be significant because they may occur outside solar production hours.

## Risks And Unknowns

- Actual interval load profile is unknown.
- Demand charges and tariff structure are not confirmed.
- Export limits are unknown.
- Major machine loads are not yet listed.
- Roof and ground-mount solar locations are not yet mapped.
- Switchboard capacity is unknown.
- Battery and inverter location constraints are unknown.
- Generator size and integration method are unknown.
- Future load growth may change the preferred system size.
- Off-grid operation may require more battery and generator capacity than expected.

## Data Still Required

- 12 months of electricity bills
- 12 months of interval data
- Tariff type and demand charge details
- Export limit and network connection requirements
- Major workshop machine load list
- Roof area map
- Ground-mount solar area map
- Switchboard location and capacity
- Battery location options
- Generator location options
- Solar/battery quotes with expansion pathway
- Future load estimates for dam pump, EV charging, irrigation, accommodation, and tiny home manufacturing

## Recommendation

Proceed with Stage 1 planning for 50 kW solar + 100 kWh battery, while designing core infrastructure for future 100 kW solar expansion.

Remain grid-connected initially. Build the system so it can operate selected loads during outages and collect the data needed to decide whether deeper microgrid operation or eventual disconnection is sensible.
