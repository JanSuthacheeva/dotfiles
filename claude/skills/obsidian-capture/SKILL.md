---
name: obsidian-capture
description: >
  Capture noteworthy learnings, discoveries, and solutions to the user's Obsidian vault.
  Two behaviors: (1) Proactively suggest creating standalone notes when something non-trivial
  and worth remembering comes up — a feature implementation insight, a useful pattern, a solved
  problem. (2) Automatically append a short bullet to the daily note after completing any task
  or interaction (no confirmation needed). Also triggers on explicit requests like "save this
  as a note", "capture this", "add to obsidian".
---

# Obsidian Capture

## Vault Location

`~/vaults/Personal/`

## Where to Place Notes

Choose the most fitting location based on content:

| Content type | Path |
|---|---|
| Programming concepts, tools, patterns | `areas/programming/` |
| Project-specific learnings | `projects/{project-name}/` |
| AI/ML topics | `resources/ai-lab/` |
| Nothing fits well | `daily-notes/{YYYY-MM-DD}.md` (append to existing) |

Use your judgement. Look at existing files in candidate folders before deciding.

## Note Format

Use the existing convention found in the vault:

```markdown
---
id: {filename-without-extension}
aliases: []
tags: []
---

# {Title}

{Content — concise, clear, useful for future reference}
```

## Filename Convention

Lowercase, hyphens, descriptive. Prefix with topic when in `areas/programming/`:
- `laravel_queue-retry-strategies.md`
- `docker_multi-stage-builds.md`
- `go_context-cancellation.md`

For other folders, use a descriptive name without prefix.

## Workflow

### Standalone Notes (for noteworthy learnings)

1. **Suggest** — When something noteworthy comes up, say: "This seems worth capturing as a note. Want me to save it to your Obsidian vault?"
2. **Wait for confirmation** — Do not create the note without user approval.
3. **Write the note** — Create the markdown file in the appropriate location.
4. **Link related notes** — Spawn a subagent (Task tool, subagent_type: Explore) to search the vault for related notes by topic, keywords, and tags. Then edit the new note to add a `## Related` section with `[[note-name]]` wiki-links to relevant existing notes. Also edit related existing notes to add a backlink to the new note (append to an existing Related section, or create one).

### Daily Activity Log (automatic)

After completing any task or interaction, append a short bullet point to the daily note:

1. **Path**: `daily-notes/{YYYY-MM-DD}.md` (use today's date)
2. **Create if missing** — If the daily note doesn't exist, create it with this format:
   ```markdown
   ---
   id: {YYYY-MM-DD}
   aliases: []
   tags: [daily]
   ---

   # {YYYY-MM-DD}

   ## Activity Log

   - {first bullet}
   ```
3. **Append** — If the daily note exists, append the bullet under `## Activity Log` (create this section if it doesn't exist).
4. **Bullet format** — Keep it brief: `- {time} — {what was done}` (e.g., `- 14:32 — Fixed N+1 query in OrderController`)
5. **No confirmation needed** — This happens automatically after task completion.

## Content Guidelines

- Write for your future self — assume you forgot the context
- Include the *why*, not just the *what*
- Include a minimal code example when relevant
- Keep it concise — a note should be scannable in under 30 seconds
- Do not pad with filler or obvious information
