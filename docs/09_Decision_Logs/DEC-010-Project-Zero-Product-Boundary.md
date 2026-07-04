# DEC-010: Project Zero Product Boundary

## Status

Accepted

## Date

2026-07-04

## Decision

Project Zero / Eudlo App may reuse BoundHQ's technical stack, patterns and infrastructure, but must remain a separate application with separate login, permissions, database boundary and product roadmap.

## Context

Project Zero is the Eudlo App. It is a separate platform from BoundHQ and is the proving ground for ideas about operating the Eudlo Road property.

The practical build path may still use the proven BoundHQ technical foundation, including app framework patterns, deployment patterns, UI conventions, document/AI tooling, and operational infrastructure. Reusing stable technical rails is sensible, provided the product boundary remains clear.

## Rationale

- Project Zero should not waste effort reinventing technical foundations that already work.
- Project Zero's data, login, permissions, roadmap and product logic must stay independent.
- BoundHQ may later adopt ideas from Project Zero, but Project Zero must not be constrained by BoundHQ business workflows.
- A separate boundary protects the property operating system from becoming a side feature inside another product.

## Consequences

- Project Zero can share code patterns, infrastructure lessons and reusable components with BoundHQ.
- Project Zero must have separate authentication and user roles.
- Project Zero must have a separate database boundary or strict application-level data isolation.
- Project Zero must have separate navigation, product modules and roadmap.
- Any shared component must be treated as platform reuse, not domain coupling.
- Future app scaffolding should explicitly document what is shared and what is isolated.
