# Kaizen principles

This project runs on Kaizen: progress through small, steady, deliberate steps rather
than big pushes. These rules are written for an AI agent arriving cold, and they hold
whether or not the Kaizen Please plugin is installed.

The project may be anything: a job hunt, a house move, a book, a research question, a
business, a codebase. The principle is the same.

## The one rule: the next small step

Big tasks are not worked on directly. They are broken into **small steps** first, and
steps are taken **one at a time**: do it, check it, record it, then the next.

A step is small enough when all of these hold:

1. **One action.** Its wording is a single sentence with no "and". "Send the cover
   letter to Acme" is a step. "Research Acme and write the cover letter" is two.
2. **Doable in one sitting.** Roughly an hour or less of focused effort, by whoever
   does it.
3. **Has an owner.** Either the agent can do it (draft, research, organise, edit
   files) or the user must (send, call, decide, attend, pay). Say which.
4. **Done is observable.** It is clear how anyone would know it is finished: a file
   exists, a message was sent, a decision is written down.
5. **Starts now.** Nothing outside the step blocks it. If something does, that
   something is the step.

## Working rules

- **Break down before doing.** When the user hands over a big task or a long list,
  the first action is breakdown, not execution. Show the steps; then take the first.
- **Use the project's own task lists.** Break items down where they already live
  (nested under the original item), rather than starting a second list. The original
  wording stays, so the breakdown can be checked against what was meant.
- **One step at a time.** "Do the next five" means five complete cycles, each
  finished and recorded before the next starts.
- **Stay on the step.** Anything else noticed along the way becomes a new item in
  the task list, not part of the current step.
- **A stuck item gets smaller, not harder.** If a step has not moved across two
  reviews, split it again or find what blocks it, and make that the step.
- **Hand the user's steps over ready to act on.** For a user-owned step, prepare
  everything the agent can (draft, contact details, links, the exact decision to
  make) so the user's part is as small as possible. Then record the outcome they
  report.
- **Record what happened.** Every step that is done, dropped or blocked gets one
  line in `log.md`. Reviews measure progress from the log.

## Reviews

A review looks back since the last one: what moved, what stalled, what changed in the
goals. It re-splits stuck items and adds new ones. Broad rethinking happens in
reviews; between reviews, work is step by step.

## Files in this folder

| File | Purpose |
| --- | --- |
| `PRINCIPLES.md` | This document. Edit it to fit the project; re-running adopt never overwrites it. |
| `kaizen.json` | Machine state: scope, task-list paths, last review, delivery preferences |
| `log.md` | Append-only: one entry per step done, dropped or blocked |
| `reviews/` | One record per review |
| `essays/` | Kaizen assessments of the project (Typst source and PDF) |
