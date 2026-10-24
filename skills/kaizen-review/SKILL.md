---
name: kaizen-review
description: Periodic Kaizen check-in on a project: what moved since the last review, what is stuck, re-split stuck items, add new ones. Use for "weekly review", "how's this going", "kaizen review".
---

# Review

Looks back from the last review: what moved, what stalled, whether the goals still
hold. It re-splits stuck items and adds new ones. It does not take steps itself.

## Steps

1. **Locate Kaizen** as `kaizen-breakdown` step 1 does. Read `PRINCIPLES.md`,
   `kaizen.json`, the task lists, `log.md`, and the latest file in `reviews/`.
   `SINCE` is the date of the last review, or the `adopted` date if there is none.

2. **Measure since `SINCE`**, from `log.md` (and `git log --since` if in a repo):
   - steps done, dropped and blocked, split by agent and user;
   - items with open steps that had no log entry in that time: these are stalled;
   - new files and notes in the project that are not reflected in the task lists.

3. **Ask the user two short questions** before judging, and use their answers:
   what changed for them since last time, and whether the main goal is still the
   same. Skip a question the user has already answered in this conversation.

4. **Deal with stalls.** For each stalled item, find why: too big, waiting on someone,
   unclear, or no longer wanted. Then split it smaller, make the blocker the step,
   ask the one question that unclears it, or propose dropping it. A step stalled
   across two reviews is always split or questioned, never left as is.

5. **Add new items** for goals or opportunities that surfaced, broken down through
   `kaizen-breakdown`.

6. **Write `reviews/R<NNN>-<YYYY-MM-DD>.md`**, with `NNN` from `next_review_id`:

   ```markdown
   # R<NNN> — <YYYY-MM-DD>
   - since: <SINCE>
   - goal: <the main goal, as the user put it today>
   ## Moved
   <steps done, by item; counts by owner>
   ## Stalled, and what we did about it
   <item — reason — split / unblocked / question asked / dropped>
   ## New
   <items added>
   ## Next three steps
   <the first three steps that can start now>
   ```

7. **Update `kaizen.json`**: append `{"review": "R<NNN>", "date": "<ISO>"}` to
   `reviews`, increment `next_review_id`. Commit review, task lists, log and state
   together, if in a repo: `kaizen: review R<NNN>`.

8. **Report** the short version: what moved, what was unstuck, the next three steps.

## Notes

- A review with little movement is still a valid review. Say so plainly; do not
  pad it.
- If the open list grows review after review, suggest dropping low-value items.
