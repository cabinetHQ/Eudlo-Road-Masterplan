-- Project Zero seed actions

INSERT INTO actions (action_id, title, owner, status, due_date, notes, source)
VALUES
  ('ACT-001', 'Collect 12 months electricity bills', 'TBD', 'Open', NULL, 'Needed for baseline annual cost and seasonality.', 'data/action_register.csv'),
  ('ACT-002', 'Obtain interval data from retailer', 'TBD', 'Open', NULL, 'Request 15-minute or 30-minute data if available.', 'data/action_register.csv'),
  ('ACT-003', 'List major machine loads', 'TBD', 'Open', NULL, 'Include kW duty cycle start-up current and operating hours.', 'data/action_register.csv'),
  ('ACT-012', 'Get 3 commercial solar/battery quotes', 'TBD', 'Open', NULL, 'Quote 50 kW solar plus 100 kWh battery and pathway to 100 kW solar.', 'data/action_register.csv'),
  ('ACT-017', 'Map workshop roof area', 'TBD', 'Open', NULL, 'Needed for panel layout access shading and structural review.', 'data/action_register.csv'),
  ('ACT-018', 'Map possible ground-mount solar area', 'TBD', 'Open', NULL, 'Include shading access cable route slope and future expansion.', 'data/action_register.csv'),
  ('ACT-019', 'Identify switchboard location', 'TBD', 'Open', NULL, 'Confirm upgrade requirements and cable pathways.', 'data/action_register.csv'),
  ('ACT-020', 'Identify battery location', 'TBD', 'Open', NULL, 'Consider ventilation fire separation access and flood/weather exposure.', 'data/action_register.csv'),
  ('ACT-021', 'Identify generator location', 'TBD', 'Open', NULL, 'Consider noise exhaust refuelling access and transfer switch route.', 'data/action_register.csv'),
  ('ACT-022', 'Measure dam pump lift height', 'TBD', 'Open', NULL, 'Confirm actual vertical lift against 20 m concept assumption.', 'data/action_register.csv'),
  ('ACT-023', 'Estimate pipe run length', 'TBD', 'Open', NULL, 'Needed for friction loss and pump sizing.', 'data/action_register.csv'),
  ('ACT-024', 'Identify sunny location for dam pump panels', 'TBD', 'Open', NULL, 'Assess shade and practical cable route to pump/controller.', 'data/action_register.csv'),
  ('ACT-025', 'Obtain pump sizing advice', 'TBD', 'Open', NULL, 'Target approximately 6000 L/hour at around 20 m lift.', 'data/action_register.csv'),
  ('ACT-026', 'Check whether plunge basin works affect any waterway/spillway approvals', 'TBD', 'Open', NULL, 'Confirm before earthworks or changes near dam spillway waterway areas.', 'data/action_register.csv'),
  ('ACT-044', 'Define Project Zero canonical entity relationship model', 'TBD', 'Open', NULL, 'Include assets projects decisions actions finance documents GIS sensors and AI insights.', 'data/action_register.csv'),
  ('ACT-047', 'Draft Project Zero database schema', 'TBD', 'Open', NULL, 'Include relational spatial object storage time-series and vector retrieval needs.', 'data/action_register.csv'),
  ('ACT-048', 'Capture first GIS base layers', 'TBD', 'Open', NULL, 'Property boundary buildings roads dam utilities forestry koala corridor.', 'data/action_register.csv'),
  ('ACT-051', 'Review and approve canonical data model', 'TBD', 'Open', NULL, 'Confirm entity list required fields relationships and app modules.', 'data/action_register.csv'),
  ('ACT-052', 'Create import mapping for assets.csv', 'TBD', 'Open', NULL, 'Map current columns to future assets table.', 'data/action_register.csv'),
  ('ACT-053', 'Create import mapping for action_register.csv', 'TBD', 'Open', NULL, 'Preserve ACT IDs and add relationship fields after import.', 'data/action_register.csv'),
  ('ACT-054', 'Create parser plan for decision log Markdown files', 'TBD', 'Open', NULL, 'Extract status date decision context rationale consequences and source file.', 'data/action_register.csv'),
  ('ACT-055', 'Define PostGIS coordinate and accuracy standard', 'TBD', 'Open', NULL, 'Required before field capture and GIS imports.', 'data/action_register.csv'),
  ('ACT-056', 'Draft first implementation schema from architecture docs', 'TBD', 'Open', NULL, 'Convert plain-English schema into SQL only after review.', 'data/action_register.csv')
ON CONFLICT (action_id) DO NOTHING;

INSERT INTO entity_links (entity_link_id, source_entity_type, source_entity_id, target_entity_type, target_entity_id, link_type, notes)
VALUES
  ('ELK-ACT-012-PRJ-001', 'action', 'ACT-012', 'project', 'PRJ-001', 'supports', 'Commercial solar/battery quote action.'),
  ('ELK-ACT-017-BLD-001', 'action', 'ACT-017', 'asset', 'BLD-001', 'field_work', 'Workshop roof mapping.'),
  ('ELK-ACT-019-INF-004', 'action', 'ACT-019', 'asset', 'INF-004', 'field_work', 'Switchboard location confirmation.'),
  ('ELK-ACT-020-INF-002', 'action', 'ACT-020', 'asset', 'INF-002', 'field_work', 'Battery location confirmation.'),
  ('ELK-ACT-021-INF-003', 'action', 'ACT-021', 'asset', 'INF-003', 'field_work', 'Generator location confirmation.'),
  ('ELK-ACT-022-INF-005', 'action', 'ACT-022', 'asset', 'INF-005', 'field_work', 'Dam pump lift measurement.'),
  ('ELK-ACT-024-INF-006', 'action', 'ACT-024', 'asset', 'INF-006', 'field_work', 'Dam pump panel location.'),
  ('ELK-ACT-025-INF-006', 'action', 'ACT-025', 'asset', 'INF-006', 'supplier_advice', 'Pump sizing advice.'),
  ('ELK-ACT-044-PRJ-003', 'action', 'ACT-044', 'project', 'PRJ-003', 'architecture', 'Canonical entity relationship model.'),
  ('ELK-ACT-047-PRJ-003', 'action', 'ACT-047', 'project', 'PRJ-003', 'architecture', 'Database schema draft.'),
  ('ELK-ACT-048-PRJ-003', 'action', 'ACT-048', 'project', 'PRJ-003', 'gis_foundation', 'First GIS base layers.'),
  ('ELK-ACT-055-PRJ-003', 'action', 'ACT-055', 'project', 'PRJ-003', 'gis_foundation', 'PostGIS coordinate and accuracy standard.')
ON CONFLICT (entity_link_id) DO NOTHING;
