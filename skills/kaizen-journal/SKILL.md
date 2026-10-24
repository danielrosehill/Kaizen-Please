---
name: kaizen-journal
description: Set up and keep a Kaizen journal in the project, a plain Markdown log of small steps and improvements that the user and the agent both write in. Use for "set up a kaizen journal", "journal this", "log that I…", "what's in the journal".
---

# Kaizen journal

The journal is the project's record of incremental improvement, and the only log
Kaizen Please keeps. It is written for people first: you should be able to open it
and add a line by hand with no tooling. The agent writes to it in exactly the same
format, and other Kaizen skills read it.

Layout: `KAIZEN_DIR/journal/README.md` (the format guide) and one file per month,
`KAIZEN_DIR/journal/YYYY-MM.md`, each with one `## YYYY-MM-DD (Ddd)` heading per day
and one line per entry. The format is in `templates/README.md`.

## Modes

- **set up**: create the journal (also run by `kaizen-adopt`, and by any Kaizen skill
  that needs to write an entry when no journal exists).
- **add**: write one or more entries, from what the user says or from a step the
  agent just finished.
- **read**: show recent entries, or answer a question from the journal ("what did I
  improve this month?").

## Set up

1. **Locate Kaizen**: find `kaizen.json` with `"plugin": "kaizen-please"` under the
   project root. If there is none, create the Kaizen folder as `kaizen-adopt`
   project steps 3–5 do, and say so.
2. If `KAIZEN_DIR/journal/README.md` is missing, copy `templates/README.md` there.
   Never overwrite it; the user may have adapted it.
3. Create this month's file if missing, with the heading
   `# Kaizen journal — <Month YYYY>` and a blank line.
4. If the project has an older log in another format (for example a `log.md` from an
   earlier version of this plugin), leave it where it is and add a `note:` entry
   pointing at it. Do not convert or delete it.
5. Record `"journal": "<KAIZEN_DIR>/journal"` in `kaizen.json`.
6. Commit in a repo: `kaizen: set up journal`.

## Add

1. Open this month's file (create it as in set-up step 3 if it is a new month).
2. Find today's heading; add it at the bottom if absent. Dates are the user's local
   date.
3. Write each entry as one line in the documented format: a kind (`done`,
   `dropped`, `blocked`, `improved`, `learned`, `note`, `next`), an owner in
   parentheses for `done`/`dropped`/`blocked`, the step's wording as it appears in
   the task list, and `→ evidence` where there is any.
4. When the user dictates loosely ("I called the recruiter, it went well, she'll
   send the form Monday"), split it into entries (`done (you): Called the
   recruiter`, `next: Fill in the form when it arrives Monday`) and show them before
   writing if the reading is not obvious.
5. Append only. Never edit or remove an earlier line, the user's or the agent's.
   Corrections are new lines.
6. Commit in a repo with the change it records, or alone as
   `kaizen: journal <YYYY-MM-DD>`.

## Read

Read the month files needed, newest first, and answer briefly: counts by kind, the
`improved` and `learned` lines (the ones most worth seeing again), open `next`
entries not yet matched by a `done`, and long-standing `blocked` entries.

## Notes

- Keep lines short. Detail belongs in the linked file, not the journal.
- The user's entries are theirs. Do not "tidy" their wording.
