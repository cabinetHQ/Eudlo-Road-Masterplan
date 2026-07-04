# Document Standards

## Purpose

This document defines the standard structure for important Project Eudlo documents.

Use this structure for new planning, engineering, financial, grant, supplier, and project documents unless a specialised template is more appropriate.

## Standard Document Template

```markdown
# Document Title

## Metadata

| Field | Value |
| --- | --- |
| Owner | TBD |
| Status | Draft |
| Review date | TBD |
| Related assets | TBD |
| Related decisions | TBD |
| Related actions | TBD |

## Purpose

Explain why this document exists.

## Background

Summarise the context, history, and relevant facts.

## Assumptions

List assumptions clearly. Use `TBD` for unknowns.

## Analysis

Explain options, calculations, comparisons, supplier advice, site constraints, and trade-offs.

## Recommendation

State the recommended next step or preferred option.

## Risks

List risks, unknowns, dependencies, and approval issues.

## Decision

Link to the decision record or state that a decision record is required.

## Actions

List required actions or link to the action register.

## Revision History

| Date | Change | Owner |
| --- | --- | --- |
| YYYY-MM-DD | Initial draft | TBD |
```

## Rules

- Every important document should have an owner and review date.
- Do not duplicate detailed content when a canonical document already exists; link to it.
- Use relative links inside the repository.
- Keep filenames stable after publication unless there is a strong reason.
- Mark unknown values as `TBD`.
- Update [CHANGELOG](CHANGELOG.md) when making meaningful structural, planning, or decision changes.
