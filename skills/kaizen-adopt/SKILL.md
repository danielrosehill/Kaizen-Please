---
name: kaizen-adopt
description: Make Kaizen (small steady steps) the guiding principle for one project or for every project at user level. Use for "use kaizen here", "add kaizen to this project", "make kaizen my default".
---

# Adopt Kaizen

Installs Kaizen as the guiding principle, at one of two scopes:

- **project**: this folder or repo. Creates the Kaizen folder, adds a marked block to
  the project's `CLAUDE.md`, and optionally enables the plugin for the project.
- **user**: every project. Adds a marked block to the user-level instructions file.
  No project folder is created now; each project gets its Kaizen folder the first
  time a Kaizen skill runs there.

Idempotent: run it again to repair a partial setup. It never overwrites an existing
`PRINCIPLES.md`, `log.md`, `kaizen.json`, `reviews/` or `essays/`.

Works in any folder. Git is helpful (changes can be committed) but not required.

## Inputs

- Scope: `project` or `user`. If the user did not say, ask once. "For all my
  projects" or "user level" means `user`.
- Optional: a folder to hold the Kaizen files.

## Steps — project scope

1. **Find the project root**: `git rev-parse --show-toplevel`, or the current folder
   if it is not a repo.

2. **Check for an existing setup**: search for `kaizen.json` files containing
   `"plugin": "kaizen-please"` under the root (skip `.git`, `node_modules`,
   `vendor`). If found, that folder is `KAIZEN_DIR`; go to step 5 and fill in only
   what is missing.

3. **Choose `KAIZEN_DIR`**, in order:
   1. the folder the user named;
   2. `<folder>/kaizen` inside an existing planning folder at the root — `planning/`,
      `project-management/`, `pm/`, `.planning/`, `docs/planning/`;
   3. otherwise `kaizen/` at the root.
   If the code-focused `kaizen` plugin already uses `<folder>/kaizen`, use
   `<folder>/kaizen-please` instead so the two never share files.

4. **Find the task lists** the project already has: `TODO*`, `TASKS*`, `tasks/`,
   `todo/`, `*.md` files with Markdown checkboxes (`- [ ]`), `ROADMAP*`, `PLAN*`,
   and any file the project's `CLAUDE.md` or `README` names as the task list. Show
   the user what was found in one short list and confirm which ones Kaizen should
   work in. Nothing found is fine: `kaizen-breakdown` creates `TODO.md` when first
   needed.

5. **Write the folder** from `templates/`, creating only what is missing:
   - `PRINCIPLES.md` ← `templates/PRINCIPLES.md`
   - `log.md` ← `templates/log.md`
   - `kaizen.json` ← `templates/kaizen.json`, with `__KAIZEN_DIR__` and `__DATE__`
     (ISO) replaced and `task_lists` set to the confirmed paths, relative to the root
   - `reviews/` and `essays/` are created by the skills that write into them.

6. **Add the instructions block.** Take `templates/claude-md-project.md`, replace
   `__KAIZEN_DIR__`. In the project-root `CLAUDE.md` (create it if absent; also
   `AGENTS.md` if the project has one):
   - if a `<!-- kaizen-please:begin -->` … `<!-- kaizen-please:end -->` block exists,
     replace it;
   - otherwise append it at the end, after a blank line.
   Never touch anything outside the markers.

7. **Enable the plugin for the project** (Claude Code only, and only if the user
   wants collaborators or other machines to get the skills; ask once):
   `claude plugin list --json`, find the id starting `kaizen-please@`, then from the
   root run `claude plugin install kaizen-please@<marketplace> --scope project`.
   Read `.claude/settings.json` back and confirm the `enabledPlugins` entry. If the
   CLI is unavailable, add the entry by hand and say so.

8. **Commit**, if this is a git repo, only the files this skill wrote:
   `kaizen: adopt incremental improvement`.

9. **Report** in a few lines: `KAIZEN_DIR`, the task lists in use, and the next step,
   usually `kaizen-essay` (a written assessment of the project) or
   `kaizen-breakdown`.

## Steps — user scope

1. **Find the user-level instructions file.** For Claude Code this is
   `~/.claude/CLAUDE.md`. If the user keeps their global instructions elsewhere
   (for example a home-folder `CLAUDE.md`, or an `AGENTS.md` another agent reads),
   use the file they name. Ask if it is unclear; never guess between two.
2. **Insert `templates/claude-md-user.md`** using the same marker rules as project
   step 6. Leave every other part of the file, including other tools' marked
   blocks, untouched.
3. **Confirm the plugin is installed at user scope** (`claude plugin list --json`).
   If it is only project-enabled somewhere, say that the user-level block names
   skills the user may not have everywhere.
4. **Report** the file changed and that each project gets its Kaizen folder on first
   use. Do not commit; user-level files are usually not in a repo. If that file is in
   a repo the user manages, say so and leave committing to them.

## Notes

- `PRINCIPLES.md` is copied, not linked, so the principle holds for agents without
  the plugin. The user may edit it.
- `kaizen-remove` undoes everything this skill does.
