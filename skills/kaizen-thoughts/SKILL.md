---
name: kaizen-thoughts
description: The agent reads the project and gives its considered thoughts on bringing Kaizen to it: what the project is, what it aims at, and how small steady steps would work here. Typeset as a PDF with Typst, saved in the project, delivered by the user's preferred email or document route. Use for "kaizen thoughts", "what do you think kaizen could do here".
---

# Kaizen thoughts

The agent's own considered view of a project, written as a short reflective piece
in the first person. It answers three questions in order:

1. **What is the project here?**
2. **What are its objectives?** What is the user actually trying to achieve?
3. **How could Kaizen, incremental improvement, be brought to bear on it?**

It is a thoughtful piece, not a checklist or a sales pitch. A reader who has never
seen the project should finish it understanding the project, its aims, and a
realistic path of small steps, along with where the agent thinks Kaizen fits poorly.
It works whether or not Kaizen has been adopted, and is a good first thing to run in
a new project.

## Inputs

- Optional: an angle or a worry the user wants weighed (for example "I keep stalling
  on applications").
- Optional: where to deliver it. Otherwise the delivery step decides.

## Steps

1. **Read the project.** Gather evidence before forming a view:
   - `README*`, `CLAUDE.md`/`AGENTS.md`, any brief, plan, goals or notes files;
   - task lists (`TODO*`, `tasks/`, checkbox lists), and how much of them is done;
   - the folder structure, the kinds of files, and what is recent
     (`git log --since=60.days --stat` in a repo, otherwise modification times);
   - if Kaizen is adopted: `PRINCIPLES.md`, the journal, the latest review.
   For a large project, read areas in parallel with subagents and merge the findings.
   Note the source of each claim you will make.

2. **Separate stated from inferred.** The project's own words about its purpose and
   goals are *stated*. Your reading of what the user is really after is *inferred*;
   it is often the most useful part, but mark it `_(inferred)_`. If the objectives are
   genuinely unclear, ask the user one question before writing.

3. **Think, then write.** Plan the argument before drafting. Write as yourself ("I
   think", "what I noticed"), addressed to the user:
   - **What the project is, as I read it**: its subject, stage, shape, and who it is
     for. One to three paragraphs.
   - **What it is trying to achieve**: the explicit goals, the underlying ones, how
     success would be recognised, and any tension between goals.
   - **How Kaizen could work here**: where small, steady steps would help most and
     where they would not; the project's natural size of a "step"; which current
     tasks are too big and how they would split; what a rhythm of reviews and journal
     entries would look like; the risks that incremental work alone will not
     address. Ground every point in something you saw in the project.
   - **The first steps**: three to five concrete steps that can start now, each with
     an owner, `(agent)` or `(you)`.
   Plain, direct prose. Roughly 1,000–2,000 words; shorter for a small project.
   Open with a one-paragraph summary.

4. **Typeset.** Copy `templates/thoughts.typ`, fill the placeholders (`__SUMMARY__`,
   `__SECTION_1__` … `__FIRST_STEPS__`) with Typst markup, and compile:
   `typst compile <file>.typ <file>.pdf`. Escape `#`, `$`, `@`, `<` and `*` in prose
   where Typst would read them as markup. On a compile error, fix and recompile.
   If `typst` is not installed, say so with the install route
   (https://github.com/typst/typst, or the system package manager), keep the `.typ`
   and also save the text as Markdown.

   Render the first page (or open the PDF) to check the layout before delivering.

5. **Save in the project.** `OUT_DIR` is `KAIZEN_DIR/thoughts/` if Kaizen is
   adopted, else `docs/kaizen/` if the project has a `docs/` folder, else
   `kaizen-thoughts/` at the root. Write
   `OUT_DIR/<YYYY-MM-DD>-kaizen-thoughts.typ` and `.pdf`; never overwrite an earlier
   one (add `-2`, `-3`). If a journal exists, add a `note:` line pointing at it.
   Commit in a repo: `kaizen: thoughts <YYYY-MM-DD>`.

6. **Deliver.** Work out the user's preferred routes instead of assuming one:
   1. `kaizen.json` `delivery` (if Kaizen is adopted);
   2. the user's own instructions and memory: a named email skill or tool, a named
      document store (Google Drive, OneDrive, Dropbox, a NAS, a notes app), or a
      drop folder;
   3. otherwise, the email and file-storage tools actually available in this session.
   Use the user's own skill for that route (it knows their signature, folders and
   accounts) rather than calling a raw tool. If more than one route fits and the user
   has not chosen, ask once, offering what you found plus "just keep it in the repo".
   Sending email or uploading is outward-facing: do it without asking only if the
   user asked for delivery in this request or a standing preference says so.

   The email is short: one line on what it is, the summary paragraph, and the PDF
   attached (or a link, if the route only takes links). Offer to record the chosen
   routes in `kaizen.json` `delivery` for next time.

7. **Report**: the saved paths, where it was delivered, and the first step
   recommended, with an offer to run `kaizen-adopt` or `kaizen-breakdown`.

## Notes

- This is about the user's project, in their terms. One sentence on what Kaizen is
  is plenty; no history lesson.
- Be honest about fit. If part of the project needs a decision or a leap rather than
  small steps, say so.
