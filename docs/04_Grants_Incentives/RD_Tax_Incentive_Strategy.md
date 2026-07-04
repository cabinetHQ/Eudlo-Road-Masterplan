# R&D Tax Incentive Strategy

## Executive Summary

The R&D Tax Incentive should be investigated for cabinetHQ and BoundHQ development work, especially where there is genuine technical uncertainty, systematic experimentation, and evidence of new or improved processes, software, automation, or optimisation.

This document is not a claim position. It is a screening guide for the accountant and R&D tax advisor.

## What The R&D Tax Incentive Is

The R&D Tax Incentive is an Australian Government program for eligible companies conducting eligible R&D activities. Official guidance separates activities into core R&D activities and supporting R&D activities. Core activities must be conducted to generate new knowledge, and the outcome cannot be known or determined in advance without a systematic progression of work.

The Department of Industry and the ATO jointly administer the program. The Department manages activity registration and eligibility rules, while the ATO manages eligible entities and expenditure.

Sources:

- [business.gov.au - R&D Tax Incentive eligibility](https://business.gov.au/grants-and-programs/research-and-development-tax-incentive/check-if-you-are-eligible-for-the-randd-tax-incentive)
- [business.gov.au - Conducting core activities](https://business.gov.au/grants-and-programs/research-and-development-tax-incentive/check-if-you-are-eligible-for-the-randd-tax-incentive/conducting-core-activities)
- [Department of Industry - R&D Tax Incentive](https://www.industry.gov.au/science-technology-and-innovation/industry-innovation/research-and-development-tax-incentive)

## Potential cabinetHQ / BoundHQ Eligible Areas

Potential eligibility depends on whether the work involved genuine experimentation and technical uncertainty. The fact that software or automation was built is not enough by itself.

### AI Email Intake

Potential R&D question:

- Can incoming customer emails, drawings, attachments, specifications, and job context be reliably classified and converted into structured cabinet/manufacturing workflow data with acceptable accuracy?

Possible eligible activities:

- Testing different extraction methods
- Measuring accuracy against known job data
- Experimenting with human-in-the-loop review
- Reducing manual triage time without increasing quoting errors

### Quoting Automation

Potential R&D question:

- Can quote inputs, customer requirements, material assumptions, labour assumptions, and production constraints be converted into a reliable quote workflow with less manual handling?

Possible eligible activities:

- Experimenting with quote logic
- Testing rule-based vs AI-assisted extraction
- Validating error rates
- Comparing outputs against historical quotes

### Mozaik / Import Automation

Potential R&D question:

- Can external job data be transformed into Mozaik/import-ready formats with fewer manual corrections and fewer production errors?

Possible eligible activities:

- Testing import mapping approaches
- Validating geometry and material data
- Reducing rework from import errors
- Capturing failed import cases and iterating on the method

### Production Scheduling Optimisation

Potential R&D question:

- Can production sequencing be optimised using real constraints such as machine availability, labour, materials, due dates, and energy windows?

Possible eligible activities:

- Testing scheduling algorithms
- Comparing predicted vs actual production time
- Experimenting with batch sequencing
- Measuring bottleneck reduction

### Machine Data Capture

Potential R&D question:

- Can workshop machine activity be captured and converted into useful production, maintenance, load, and costing data?

Possible eligible activities:

- Testing data capture methods
- Comparing sensor/controller data against actual production
- Capturing downtime and idle time
- Integrating machine data into scheduling or quoting models

### Energy / Load Optimisation

Potential R&D question:

- Can workshop production be scheduled or controlled to reduce energy costs, avoid demand peaks, and improve solar/battery self-consumption without harming production output?

Possible eligible activities:

- Testing load-shifting strategies
- Comparing interval energy data against production schedules
- Experimenting with compressor, dust extraction, CNC, and charging schedules
- Developing control logic for solar/battery-aware production planning

## What Is Likely Not Eligible

The following are unlikely to qualify unless they directly support eligible experimental activity:

- Ordinary website development
- Routine app development with known methods
- Buying off-the-shelf software
- Installing ordinary solar and batteries
- Installing standard monitoring without experimentation
- Normal quoting admin
- Normal production scheduling using established tools
- Data entry, cleanup, or migration by itself
- Routine bug fixing
- Cosmetic user interface changes
- General business process improvement without technical uncertainty

## Evidence Required

The R&D advisor and accountant should ask for evidence before deciding whether to register activities.

Useful evidence:

- Project plans
- Technical uncertainty statements
- Hypotheses tested
- Experiment logs
- Failed approaches
- Test datasets
- Accuracy measurements
- Before/after workflow measurements
- Screenshots and version history
- Git commits
- Design notes
- Meeting notes
- Supplier/developer invoices
- Timesheets
- Staff time allocation
- Production error reports
- Energy interval data linked to production schedules

ATO guidance emphasises keeping records to show what R&D activities were undertaken and to support claims.

Source: [ATO - Keeping records and calculating notional deductions](https://www.ato.gov.au/businesses-and-organisations/income-deductions-and-concessions/incentives-and-concessions/research-and-development-tax-incentive/keeping-records-and-calculating-your-notional-deductions)

## Risks

- Activities may be routine software development rather than eligible R&D.
- Work may lack documented hypotheses or experiments.
- Evidence may be missing or retrospective.
- Activities may be commercial production work rather than core R&D.
- Supporting activities may fail the dominant-purpose test.
- Expenditure may not be properly apportioned.
- Related-party, contractor, or overseas work may need specialist treatment.
- Claims may create audit exposure if not prepared carefully.

## Next Actions For Accountant / R&D Advisor

| Action | Purpose | Owner |
| --- | --- | --- |
| Speak to accountant about R&D Tax Incentive | Confirm entity, tax, and expenditure basics | Brendan/accountant |
| Speak to R&D tax advisor | Screen activities before relying on claim value | Brendan/R&D advisor |
| Identify experimental work already completed | Determine whether prior cabinetHQ/BoundHQ work should be assessed | Brendan/team |
| Identify eligible future R&D activities | Set up projects correctly from the start | Brendan/R&D advisor |
| Collect evidence and timesheets | Build defensible records | Brendan/team |
| Separate routine build from experimental work | Avoid overstating eligible activities | Accountant/R&D advisor |
| Map activities to core and supporting categories | Prepare registration-ready structure | R&D advisor |

## Working Recommendation

Do not assume BoundHQ or cabinetHQ automation work is automatically eligible. Treat R&D as a structured evidence project.

The best next step is a short R&D screening session with the accountant and an R&D tax advisor, using actual examples from AI email intake, quoting automation, Mozaik/import automation, production scheduling, machine data capture, and energy/load optimisation.
