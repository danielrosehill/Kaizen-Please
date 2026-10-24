---
name: kaizen-remove
description: Uninstall Kaizen Please cleanly from a project or from user level: remove its instruction blocks and plugin settings, and keep, archive or delete its own files as the user chooses. Use for "remove kaizen", "I don't want kaizen anymore".
---

# Remove Kaizen

Undoes `kaizen-adopt`. It removes only what Kaizen Please added. **It never touches
the user's own task lists, notes or work**, including the steps Kaizen added to
them, which are now the user's content.

## Inputs

- Scope: `project`, `user`, or both. If the user did not say, check where Kaizen is
  set up (steps below) and ask once, listing what was found.

## Steps

1. **Inventory first.** List everything Kaizen Please added that still exists:
   - project: the `kaizen.json` folder (with `"plugin": "kaizen-please"`), the
     `<!-- kaizen-please:begin/end -->` block in `CLAUDE.md` and `AGENTS.md`, and a
     `kaizen-please@…` entry in `.claude/settings.json` `enabledPlugins`;
   - user: the marked block in the user-level instructions file
     (`~/.claude/CLAUDE.md`, or the file the user keeps them in), and the user-scope
     plugin install.
   Show the inventory and what will happen to each item.

2. **Ask what to do with the Kaizen folder**, once: **keep** it (the log and reviews
   stay as a record), **archive** it (move to `<parent>/archive/kaizen-<YYYY-MM-DD>/`),
   or **delete** it. Default is keep. Delete only on an explicit answer, and remind
   the user it holds the log, reviews and essays.

3. **Remove the instruction blocks.** Delete everything from
   `<!-- kaizen-please:begin -->` through `<!-- kaizen-please:end -->` inclusive,
   plus one blank line left behind. Touch nothing else. If removing the block leaves
   a `CLAUDE.md` that this plugin created and that is now empty, delete that file.

4. **Remove the plugin settings.** For project scope, from the project root run
   `claude plugin uninstall kaizen-please@<marketplace> --scope project`; read
   `.claude/settings.json` back and, if the entry remains, delete it by hand. For user
   scope, run `claude plugin uninstall kaizen-please@<marketplace>` last, after
   everything else, since it removes these skills.

5. **Handle the folder** as the user chose in step 2.

6. **Verify**: search again for the markers, the `kaizen-please@` settings entry and
   (unless kept) the folder. Report anything still present.

7. **Commit** in a git repo, only the files this skill changed:
   `kaizen: remove Kaizen Please`.

8. **Report** what was removed, what was kept and where, and that the task lists were
   left as they are.
