# GIS Data Model

## Purpose

GIS is core architecture for Project Zero.

The map is the primary operating interface. Assets, projects, decisions, actions, documents, photos, sensors, maintenance, and finance should be able to connect to location and spatial features.

## GIS Principles

- Capture spatial data once and reuse it everywhere.
- Every mapped item should link to a canonical entity where practical.
- Store geometry in PostGIS, not only in drawings or screenshots.
- Support offline capture from mobile.
- Support future drone imagery and LiDAR without redesign.

## Coordinate And Accuracy Requirements

Initial requirements:

- Coordinate reference system: TBD after base property data is confirmed.
- Capture method: GPS/mobile first, survey-grade later where needed.
- Accuracy field required for captured GPS records.
- Source field required for all GIS features.
- Date captured field required for all GIS features.

## GIS Layers

### Property Boundary

Geometry: polygon or multipolygon.

Purpose: define the operating boundary for Project Zero.

Links to: Location, Documents, Permits, Projects.

Required fields: boundary name, geometry, source, capture date, accuracy, status.

Source: title/survey data, council/GIS export, manual import.

### Buildings

Geometry: polygon.

Purpose: map existing and future building footprints.

Includes: workshop, existing house, future house, tiny home factory, future tiny homes, sheds, carports.

Links to: Assets, Projects, Documents, Photos, Maintenance Events.

Required fields: building asset ID, geometry, status, source, capture date.

### Roads / Tracks

Geometry: line.

Purpose: map driveways, internal roads, access tracks, and maintenance paths.

Links to: Assets, Locations, Maintenance Events, Photos, Projects.

Required fields: road/track name, geometry, surface type, status, source, capture date.

### Fences

Geometry: line.

Purpose: track property fencing, gates, wildlife protection, and koala corridor interfaces.

Links to: Assets, Locations, Wildlife/Koala layers, Maintenance Events.

Required fields: fence type, geometry, condition, status, source, capture date.

### Water / Dam / Spillway

Geometry: polygon and line.

Purpose: map dam, waterhole, spillway, creek/cascade concept, drainage, and water flow paths.

Links to: Assets, Projects, Permits, Sensors, Photos, Maintenance Events.

Required fields: feature type, geometry, status, source, capture date.

### Electrical Routes

Geometry: line and point.

Purpose: map switchboards, distribution boards, conduits, solar, battery, generator, and major electrical routes.

Links to: Assets, Projects, Drawings, Permits, Maintenance Events.

Required fields: asset ID, route type, geometry, status, source, confidence level.

Security note: electrical route visibility may need role-based permissions.

### Water Pipes

Geometry: line and point.

Purpose: map water pipes, valves, pumps, tanks, irrigation supply, and future pipe runs.

Links to: Assets, Projects, Drawings, Maintenance Events, Sensors.

Required fields: pipe type, diameter, material, geometry, status, source, confidence level.

### Communications

Geometry: line, point, polygon.

Purpose: map NBN, Starlink, WiFi, CCTV, coverage zones, network routes, and camera fields of view.

Links to: Assets, Sensors, Security, Maintenance Events.

Required fields: communications type, geometry, status, source, confidence level.

### Forestry Blocks

Geometry: polygon.

Purpose: define forestry management zones.

Links to: Land Assets, Projects, Photos, Drone Imagery, Financial Events.

Required fields: block ID, species/description, geometry, status, source, capture date.

### Koala Corridor

Geometry: polygon and line.

Purpose: define koala corridor, habitat, constraints, protection zones, and improvement opportunities.

Links to: Land Assets, Wildlife Records, Grants, Permits, Projects.

Required fields: corridor name, geometry, source, status, notes.

### Asset Points

Geometry: point.

Purpose: represent assets where a point is the most useful map form.

Includes: switchboards, generator, pump, sensor, gate, camera, machinery location.

Links to: Assets.

Required fields: asset ID, geometry, source, accuracy, capture date.

### Drone Imagery

Geometry: raster reference and polygon footprint.

Purpose: store drone flight outputs, image footprints, orthomosaics, and before/after references.

Links to: Drone Flight, Photos, GIS Features, Projects, AI Insights.

Required fields: flight ID, storage URI, footprint geometry, capture date, resolution, source.

Storage note: imagery should live in object storage, with metadata and footprint in database.

### LiDAR-Ready Terrain Layer

Geometry: raster or derived terrain model reference.

Purpose: support future elevation, drainage, erosion, road grade, and building site analysis.

Links to: GIS Features, Projects, Engineering Analysis, AI Insights.

Required fields: dataset ID, storage URI, footprint, resolution, vertical accuracy, capture date, source.

## GIS Feature Types

Initial controlled values:

- `property_boundary`
- `building`
- `road_track`
- `fence`
- `gate`
- `dam`
- `waterhole`
- `spillway`
- `drainage`
- `electrical_route`
- `water_pipe`
- `communications`
- `forestry_block`
- `koala_corridor`
- `asset_point`
- `drone_imagery`
- `lidar_terrain`

## GIS To App Requirements

The app must support:

- Map layer toggles
- Asset click-through
- Drawing overlays
- Photo points
- Offline GPS capture
- Import/export GeoJSON
- Spatial filtering of actions and projects
- AI querying by location
- Future drone imagery and LiDAR overlays

## First GIS Data Capture Priorities

1. Property boundary
2. Workshop footprint
3. Existing house footprint
4. Dam polygon
5. Main driveway and tracks
6. Proposed solar roof and ground-mount zones
7. Main switchboard location
8. Battery location candidates
9. Generator location candidates
10. Dam pump panel location candidate
11. Forestry blocks
12. Koala corridor placeholder
