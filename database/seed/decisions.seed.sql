-- Project Zero seed decisions DEC-001 to DEC-008

INSERT INTO decisions (
  decision_id,
  title,
  status,
  decision_date,
  decision_text,
  context,
  rationale,
  consequences,
  source_file
)
VALUES
  (
    'DEC-001',
    'Energy Masterplan Initial Design Basis',
    'Accepted',
    '2026-07-04',
    'Design infrastructure for 100 kW solar expansion but initially model 50 kW solar + 100 kWh battery.',
    'Known average power bill is approximately $1,200/month and usage is approximately 93 kWh/day.',
    'Stage 1 can reduce bills while limiting upfront commitment and avoiding rework later.',
    'Quotes should request Stage 1 pricing and future expansion pathway.',
    'docs/09_Decision_Logs/DEC-001-Energy-Masterplan.md'
  ),
  (
    'DEC-002',
    'Financial Modelling Approach',
    'Accepted',
    '2026-07-04',
    'Use current $1,200/month electricity bill as the primary financial baseline, with 93 kWh/day as the supporting usage baseline.',
    'Average daily usage does not show time-of-use, demand peaks, export constraints or workshop load behaviour.',
    'The bill captures tariff and usage effects and capital used for solar has offset opportunity cost.',
    'Every investment case must compare cash purchase against offset return.',
    'docs/09_Decision_Logs/DEC-002-Financial-Modelling-Approach.md'
  ),
  (
    'DEC-003',
    'Stay Grid-Connected Initially',
    'Accepted',
    '2026-07-04',
    'Design the system to be microgrid-capable, but remain grid-connected initially until real-world solar, battery and workshop load data proves off-grid operation is safe and financially sensible.',
    'Future loads may include dam pumping, EV charging, tiny home manufacturing, buildings, irrigation and accommodation.',
    'Grid connection reduces operational risk while data is collected.',
    'Quotes should include grid-connected operation and backup/microgrid capability.',
    'docs/09_Decision_Logs/DEC-003-Stay-Grid-Connected-Initially.md'
  ),
  (
    'DEC-004',
    'Dam Pump Concept',
    'Accepted',
    '2026-07-04',
    'Proceed with concept planning for a solar-only dam recirculation pump using second-hand panels, targeting approximately 6,000 L/hour at around 20 m lift, with creek/cascade return preferred over fountain.',
    'The dam pump is a non-critical load and does not need to depend on the main workshop battery system.',
    'Solar-only operation is appropriate for a non-critical system and second-hand panels may be cost-effective.',
    'Lift height, pipe run, pump sizing, panel location and approvals need to be checked.',
    'docs/09_Decision_Logs/DEC-004-Dam-Pump-Concept.md'
  ),
  (
    'DEC-005',
    'Separate Solar And Efficiency Grants',
    'Accepted',
    '2026-07-04',
    'Treat solar/battery incentives separately from workshop energy-efficiency grants. Do not rely on MEEG for solar or batteries.',
    'MEEG excludes energy generation equipment such as solar panels and electrical energy storage such as batteries.',
    'Separating streams keeps grant applications and business cases clean.',
    'MEEG should be investigated for compressor, VSD, lighting, monitoring, motors and controls only.',
    'docs/09_Decision_Logs/DEC-005-Separate-Solar-And-Efficiency-Grants.md'
  ),
  (
    'DEC-006',
    'Digital Twin Architecture',
    'Accepted',
    '2026-07-04',
    'The Eudlo Road app will use an asset-centric architecture where every physical asset has a unique record that links engineering, financial and operational information.',
    'The future app needs a structure that connects assets, decisions, actions, suppliers, grants, finance and maintenance.',
    'Assets are the natural anchor point for property operations.',
    'Every significant physical asset should eventually have its own page and structured record.',
    'docs/09_Decision_Logs/DEC-006-Digital-Twin.md'
  ),
  (
    'DEC-007',
    'Project Zero Architecture Direction',
    'Accepted',
    '2026-07-04',
    'Project Zero will be treated as a separate property operating system platform, not as a BoundHQ feature, farm app, asset register, or project management tool.',
    'The repository has evolved from documentation into planning, financial, asset, governance and digital twin foundation.',
    'Project Zero needs its own architecture, entity model, backlog and roadmap.',
    'Future work should think in systems, entities, workflows and app modules.',
    'docs/09_Decision_Logs/DEC-007-Project-Zero-Architecture.md'
  ),
  (
    'DEC-008',
    'Canonical Data Model',
    'Accepted',
    '2026-07-04',
    'Project Zero will now treat structured entities as the future source of truth. Markdown remains the narrative and decision archive, but future app development will use canonical data models for assets, projects, decisions, actions, finance, GIS, documents and sensors.',
    'The repository contains useful Markdown and CSV registers but requires canonical entities, relationships, database tables, GIS layers and migration rules.',
    'Structured entities are required for app workflows, dashboards, AI, automation, GIS and financial intelligence.',
    'Architecture files in /architecture become the basis for app development.',
    'docs/09_Decision_Logs/DEC-008-Canonical-Data-Model.md'
  )
ON CONFLICT (decision_id) DO NOTHING;

INSERT INTO entity_links (entity_link_id, source_entity_type, source_entity_id, target_entity_type, target_entity_id, link_type, notes)
VALUES
  ('ELK-DEC-001-INF-001', 'decision', 'DEC-001', 'asset', 'INF-001', 'affects', 'Solar expansion design decision.'),
  ('ELK-DEC-001-INF-002', 'decision', 'DEC-001', 'asset', 'INF-002', 'affects', 'Battery sizing decision.'),
  ('ELK-DEC-002-PRJ-001', 'decision', 'DEC-002', 'project', 'PRJ-001', 'sets_baseline', 'Financial baseline for solar/battery project.'),
  ('ELK-DEC-003-PRJ-001', 'decision', 'DEC-003', 'project', 'PRJ-001', 'affects', 'Grid-connected/microgrid design direction.'),
  ('ELK-DEC-004-INF-006', 'decision', 'DEC-004', 'asset', 'INF-006', 'creates_concept', 'Dam solar pump concept.'),
  ('ELK-DEC-005-MAC-002', 'decision', 'DEC-005', 'asset', 'MAC-002', 'grant_scope', 'Compressor may be eligible for efficiency grant investigation.'),
  ('ELK-DEC-006-PRJ-003', 'decision', 'DEC-006', 'project', 'PRJ-003', 'architecture', 'Asset-centric digital twin architecture.'),
  ('ELK-DEC-007-PRJ-003', 'decision', 'DEC-007', 'project', 'PRJ-003', 'architecture', 'Project Zero platform direction.'),
  ('ELK-DEC-008-PRJ-003', 'decision', 'DEC-008', 'project', 'PRJ-003', 'architecture', 'Canonical data model direction.')
ON CONFLICT (entity_link_id) DO NOTHING;
