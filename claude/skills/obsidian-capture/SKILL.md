---
name: obsidian-capture
description: >
  Capture learnings, discoveries, and solutions to the user's Obsidian vault as standalone
  notes or daily log entries. Writes directly to vault files on disk.
  Use when the user says "save this as a note", "capture this", "add to obsidian",
  "write this down", or when a non-trivial insight emerges during work (a pattern discovered,
  a bug solved, a useful technique). Also automatically appends a short bullet to the daily
  note after completing any task.
---

# Obsidian Capture

All vault operations use direct file edits (Read/Write/Edit/Glob/Grep). Do **not** use the `obsidian` CLI — it is unreliable.

## Vault Path

```
/Users/jansuthacheeva/vaults/personal
```

All paths below are relative to this root. Always prepend the vault root when calling tools.

## Where to Place Notes

Choose the most fitting location based on content:

| Content type | Path |
|---|---|
| Programming concepts, tools, patterns | `areas/programming/` |
| Project-specific learnings | `projects/{project-name}/` |
| AI/ML topics | `resources/buzzwoo_ai-lab/` |
| Nothing fits well | Daily note (append, see below) |

Use your judgement. Before creating, use `Glob` on `{vault}/{candidate-folder}/*.md` to check existing files and naming patterns.

## Filename Convention

Lowercase, hyphens, descriptive. Prefix with topic when in `areas/programming/`:
- `laravel_queue-retry-strategies.md`
- `docker_multi-stage-builds.md`
- `go_context-cancellation.md`

For other folders, use a descriptive name without prefix.

## Note Format

```markdown
---
id: {filename-without-extension}
aliases: []
tags: [tag1, tag2]
---

# {Title}

{Content — concise, clear, useful for future reference}
```

## Workflow

### Standalone Notes (for noteworthy learnings)

1. **Suggest** — Say: "This seems worth capturing as a note. Want me to save it to your Obsidian vault?"
2. **Wait for confirmation** — Do not create the note without user approval.
3. **Check collisions** — `Glob` for the target filename. If a note exists:
   - Overlapping topic → `Read` it, then `Edit` to append new content under a new `## ` heading.
   - Unrelated topic → add a numeric suffix (e.g., `-2.md`).
4. **Create the note** — Use `Write` to produce the full file with frontmatter + body.
5. **Link related notes** — Dispatch a subagent (`Agent` tool, `subagent_type: Explore`) to find related notes:
   - Keyword search: `Grep` for terms across `{vault}/**/*.md`
   - Tag search: `Grep -r "tag-name"` on frontmatter or `#tag-name` in body
   - Backlinks: `Grep` for `[[new-note-name]]`
   - From results, pick 2–5 most genuinely related notes
   - `Edit` the new note to add a `## Related` section with `[[note-name]]` wiki-links
   - `Edit` each related note to add a backlink bullet under its own `## Related` section (create section if absent)

**Example — standalone note from a debugging session:**

> Discover that Go's `context.WithTimeout` does not cancel child goroutines if the parent context is already done.

Suggest, then `Write` to `/Users/jansuthacheeva/vaults/personal/areas/programming/go_context-timeout-parent-cancellation.md`:

```markdown
---
id: go_context-timeout-parent-cancellation
aliases: []
tags: [go, concurrency, context]
---

# Context Timeout Parent Cancellation

{insight and minimal code example}
```

### Daily Activity Log (automatic)

After completing any task, append a short bullet to today's daily note. No confirmation needed.

**Daily note path:** `{vault}/daily-notes/{YYYY-MM-DD}.md` (e.g., `2026-04-19.md`).

1. `Read` the daily note.
2. If it does not exist, `Write` it with the daily template (see below), then append the bullet.
3. If it exists, `Edit` to append the bullet at the bottom.

**Daily template** (used when creating a new daily note):

```markdown
---
id: {YYYY-MM-DD}
tags: [daily]
---

# {YYYY-MM-DD}

## Log

- {HH:MM} — {what was done}
```

**Bullet format:** `- {HH:MM} — {what was done}` (e.g., `- 14:32 — Fixed N+1 query in OrderController`)

Get current time from the shell (`date +%H:%M`) or from session context.

## Error Handling

| Problem | Action |
|---|---|
| Target folder does not exist | Stop and ask where to place the note instead. Do not create new folders silently. |
| Filename collision — overlapping topic | `Edit` to append content under a new `## ` heading. |
| Filename collision — unrelated topic | Add numeric suffix (`-2.md`). |
| No related notes found | Skip the `## Related` section entirely. Do not add an empty section. |
| Daily note template missing | Use the template above. Do not block on missing plugin config. |

## Content Guidelines

- Write for your future self — assume you forgot the context
- Include the *why*, not just the *what*
- Include a minimal code example when relevant
- Keep it concise — a note should be scannable in under 30 seconds
- Do not pad with filler or obvious information
