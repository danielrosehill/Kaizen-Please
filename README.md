# Kaizen Please

Kaizen for any project, not just code. A job hunt, a house move, a book, a research
question, a small business: if it lives in a folder or a repo, Kaizen Please makes
small, steady steps its guiding principle.

The idea is simple. Big tasks are not attacked head on. They are broken into small
steps (one action, one sitting, one owner, observable done) right inside the
project's own task lists, and steps are taken one at a time. The agent does the steps
it can; the steps that need you are handed over ready to act on. Regular reviews
catch what has stalled and split it smaller.

For code-specific Kaizen (atomic refactors, one commit per unit, verified by tests),
see the sibling plugin [`kaizen`](https://github.com/danielrosehill/Claude-Kaizen).
The two can run in the same repo without sharing files.

## Skills

| Skill | What it does |
| --- | --- |
| `kaizen-essay` | Reads the project and writes an essay: what the project is, what it is trying to achieve, and how Kaizen applies. Typeset to PDF with Typst, saved in the project, delivered by your preferred email or document route |
| `kaizen-adopt` | Makes Kaizen the guiding principle, for one project (a marked `CLAUDE.md` block and a small Kaizen folder) or for every project (a block in your user-level instructions) |
| `kaizen-breakdown` | Splits big tasks or a pasted list into small steps, nested under the original items in your existing task lists. Never does the steps |
| `kaizen-next` | Takes exactly one step: does it, or hands it to you ready to act on, then records it |
| `kaizen-review` | Periodic check-in: what moved, what stalled, what to split or drop, the next three steps |
| `kaizen-progress` | Read-only summary: next step, open and blocked steps, last review, setup health |
| `kaizen-remove` | Uninstalls cleanly: removes the instruction blocks and plugin settings, keeps, archives or deletes the Kaizen folder as you choose, and never touches your task lists |

## What it adds to a project

```text
CLAUDE.md                 # a <!-- kaizen-please:begin/end --> block (project scope)
kaizen/                   # or inside an existing planning folder
├── PRINCIPLES.md         # the rules, copied in so they hold without the plugin
├── kaizen.json           # scope, task-list paths, reviews, delivery preferences
├── log.md                # append-only: one line per step done, dropped or blocked
├── reviews/R001-<date>.md
└── essays/<date>-kaizen-assessment.{typ,pdf}
```

Your task lists stay where they are. Breakdown adds nested steps under your items and
never rewords or deletes the originals.

At user scope, only the block in your user-level instructions file is added; each
project gets its Kaizen folder the first time a Kaizen skill runs there.

## Typical flow

1. `kaizen-essay`: get a written read of the project and where small steps would help.
2. `kaizen-adopt`: once per project, or once at user level for all of them.
3. `kaizen-breakdown`: whenever a task is too big or you have a new list.
4. `kaizen-next`: repeatedly. "Next step", "what should I do now", "do the next three".
5. `kaizen-review`: weekly or so.
6. `kaizen-remove`: if you decide it is not for you.

## Delivery of essays

`kaizen-essay` does not assume an email provider or a cloud drive. It uses, in order:
the preferences recorded in `kaizen.json`, the email and document skills your own
instructions name, then whatever email and storage tools the session has. It asks
before sending anything unless you asked for delivery in the same request.

## Requirements

- [Typst](https://github.com/typst/typst) for PDF output. Without it, the essay is
  saved as `.typ` and Markdown.
- Git is optional. In a repo, each step's changes are committed on their own.

## Installation

```bash
claude plugin marketplace add danielrosehill/Claude-Code-Plugins
claude plugin install kaizen-please@danielrosehill
```

## License

MIT
