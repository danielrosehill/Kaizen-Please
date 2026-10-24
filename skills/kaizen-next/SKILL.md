---
name: kaizen-next
description: Take exactly one small step: do it if the agent can, or hand it to the user ready to act on, then record it and stop. Use for "next step", "what should I do now", "do the next three".
---

# Next: one step

The unit of Kaizen work. One invocation handles **one** step end to end. For "the
next three", run the whole procedure three times in order, finishing each first.

## Inputs

- Optional: a specific step, by its wording or its parent item.
- Optional: a count.

## Steps

1. **Locate Kaizen** as `kaizen-breakdown` step 1 does. Read `PRINCIPLES.md`,
   `kaizen.json` and the task lists in `task_lists`.

2. **Pick the step.** The named one, or the first unchecked step that can start now:
   leaf items first (nested steps before their parent), in file order, skipping
   anything blocked. If the candidate fails the five-part test, run
   `kaizen-breakdown` on it and pick its first new step. If there are no small steps
   at all, offer `kaizen-breakdown` and stop.

3. **If the step is the agent's**, do it, and only it:
   - stay inside the step; anything else noticed becomes a new unchecked item under
     the right parent;
   - check that it is done by the step's own definition (the file exists and reads
     well, the research answers the question);
   - if it cannot be finished, mark it blocked with the reason (`- [ ] (agent) …
     — blocked: <reason>`) and stop.

4. **If the step is the user's**, prepare it so their part is as small as possible:
   the draft to send, the address or link, the facts they need, the exact decision
   written as options. Present it in a few lines and ask them to say when it is done
   or what happened. When they report back, record the outcome as evidence. If they
   decide not to do it, mark it dropped.

   Do not perform user-owned actions yourself (sending, buying, submitting,
   contacting someone) unless the user explicitly hands that action to you.

5. **Close and log.** Tick the step in the task list. If that completes every child
   of a parent, ask whether the parent is done too. Append a `log.md` entry in its
   documented format.

6. **Commit**, if this is a git repo, the step's files, the task-list change and the
   log entry together: `kaizen: <step wording>`. Stage only those files.

7. **Report** in two or three lines: what was done, the evidence, and what the next
   step is. Then stop, unless a count remains.

## Notes

- Small and finished beats large and half done. If the step is growing, stop and
  split it.
- Do not push or publish unless the project's own instructions say to.
