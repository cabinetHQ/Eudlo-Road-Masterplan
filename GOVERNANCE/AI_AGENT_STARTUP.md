# AI Agent Startup

## Purpose

This document is mandatory reading for every AI agent working on Project Eudlo.

It applies to Codex, Claude Code, ChatGPT, OpenCode, and future agents.

## Startup Sequence

Before making changes, read:

1. [README](../README.md)
2. [Constitution](CONSTITUTION.md)
3. [Master Index](../docs/00_Index/Master_Index.md)
4. [Decision Logs](../docs/09_Decision_Logs/DEC-001-Energy-Masterplan.md)
5. [Changelog](CHANGELOG.md)
6. [Active Actions](../docs/10_Action_Register/Action_Register.md)

Then inspect the specific documents relevant to the task.

## Mandatory Rules

### Never Duplicate Information

If a topic already has a source document, update or link to that document rather than creating a competing version.

### Never Overwrite Decisions

Do not rewrite history. If a decision changes, create a new decision record and explain what changed.

### Always Link Related Documents

New documents should link to relevant assets, decisions, actions, financial models, grants, suppliers, and app-integration documents where practical.

### Always Update The Changelog

Meaningful changes must update [CHANGELOG](CHANGELOG.md).

### Always Create Decision Records

Any decision affecting cost, infrastructure, planning, engineering, grants, tax, suppliers, construction, or app architecture requires a decision record.

### Preserve Structured Data

When a Markdown register has a matching CSV file, keep both aligned where practical.

### Protect The Source Of Truth

The Git repository is the master record. Do not rely on chat history as the permanent source.

## Before Finishing

Run or confirm:

- Markdown links still resolve.
- `git diff --check` passes.
- New documents are linked from [Master Index](../docs/00_Index/Master_Index.md).
- Relevant action items are added to [Action Register](../docs/10_Action_Register/Action_Register.md).
- [CHANGELOG](CHANGELOG.md) is updated.
