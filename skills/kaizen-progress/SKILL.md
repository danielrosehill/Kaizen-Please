---
name: kaizen-progress
description: Read-only Kaizen summary for a project: next step, open and blocked steps, recent log, days since last review, setup health. Use for "where are we", "kaizen status".
---

# Progress

Read-only. Changes nothing.

## Steps

1. Find `kaizen.json` with `"plugin": "kaizen-please"` under the project root. If
   there is none, say Kaizen is not set up here and point to `kaizen-adopt` (or note
   that a user-level block will create it on first use).
2. Read `kaizen.json`, the task lists, the last five `log.md` entries and the latest
   review.
3. Check setup health: the `<!-- kaizen-please:begin -->` block is in the project
   `CLAUDE.md` (or in the user-level file), and each path in `task_lists` exists.
   Report anything missing and suggest `kaizen-adopt` to repair it.
4. Report briefly:
   - the next step that can start now, and its owner;
   - open steps by owner, and any blocked ones with their reasons;
   - the last few log entries;
   - the last review and how many days ago it was; suggest `kaizen-review` if it has
     been more than about a week and steps have moved.
