---
name: kaizen-breakdown
description: Break big tasks or a long list into small, doable next steps, in the project's own task lists. Never does the steps. Use when the user hands over a list or says a task is too big.
---

# Breakdown: big tasks into small steps

Turns big tasks into small steps that pass the test in `PRINCIPLES.md`: one action,
one sitting, one owner, observable done, starts now. **Breakdown never does the
steps.** It is the gate that stops a big task being attacked all at once.

## Inputs

- What to break down: a task the user names, a pasted list, a whole task-list file,
  or "everything open".
- Optional: what matters most right now, to order the steps.

## Steps

1. **Locate Kaizen.** Find `kaizen.json` with `"plugin": "kaizen-please"` under the
   project root. If there is none, create the folder as `kaizen-adopt` project steps
   3–5 do, without the instructions block if a user-level block already covers it.
   Read `PRINCIPLES.md` and `kaizen.json`.

2. **Find the items.** Read the task lists in `task_lists`. A pasted list that is not
   in any file goes into the first task list, or a new `TODO.md` at the root if there
   is none; record a new file in `task_lists`.

3. **Understand before splitting.** Read enough of the project (README, notes, recent
   files) to make the steps concrete: real names, real files, real deadlines. A step
   like "research companies" is not concrete; "list five companies hiring
   product managers in Tel Aviv, in `targets.md`" is.

4. **Split each big item.** Apply the five-part test. Split on every "and", every
   change of owner (agent drafts, user sends), every wait (send, then follow up in a
   week), and every decision the user must make. Prefer more, smaller steps. Three to
   eight steps per item is normal.

5. **Mark the owner** on each step: `(agent)` or `(you)`. Agent steps are things the
   agent can finish with the tools it has. Anything that needs the user's voice,
   money, signature, presence or decision is `(you)`.

6. **Write the steps in place**, nested under the original item, keeping its wording:

   ```markdown
   - [ ] Apply to Acme
     - [ ] (agent) Draft a cover letter for the Acme PM role in `applications/acme.md`
     - [ ] (you) Choose which two projects the letter should lead with
     - [ ] (you) Send the application through Acme's careers page
     - [ ] (agent) Add a follow-up reminder for 7 days after sending
   ```

   Keep the file's existing style (checkbox, numbered, heading-per-task). If the
   format cannot nest, put the steps directly after the item with the same indent
   rules the file already uses. Order steps so the first one can start now.

7. **Show the user** the new steps briefly, grouped by item, plus anything that
   looked out of place (a duplicate, a task that may no longer matter). Ask whether to
   reorder or drop any. Do not start the first step.

8. **Commit** the task-list change alone, if this is a git repo:
   `kaizen: break down <N> items`.

## Notes

- Never delete or reword the user's original item. The breakdown is checkable only if
  the original intent stays visible.
- If an item is already small, leave it alone. Not everything needs splitting.
