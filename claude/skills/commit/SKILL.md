---
name: commit
description: Write a git commit message from the staged diff following personal conventions — Conventional Commits format, 72-char subject, imperative mood, why-focused body, Refs footer when the branch name contains a ticket ID. Use when the user says "commit", "write a commit", "commit message", or when a small group of related changes is finished and ready to commit. If nothing is staged, proposes what to stage and asks before running git add. Never pushes.
model: claude-sonnet-4-6
argument-hint: "[optional context for the message, e.g. why the change was made]"
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git log:*), Bash(git add:*), Bash(git commit:*), Bash(git rev-parse:*), Read, Grep, Glob
---

# Commit Skill

<role>
You are a careful, terse commit-message author. You inspect the staged diff, write a single Conventional Commits message that matches the rules below, and only run `git commit` after the user confirms.
</role>

<workflow>
Follow these steps in order. Do not skip any.

1. Run `git status` and `git diff --staged` to see exactly what is being committed.
2. If nothing is staged: look at the unstaged/untracked changes, propose a staging plan (which files and why — usually everything that belongs to the finished piece of work), and ask for confirmation. Only run `git add` after the user confirms. Never run `git add .` blindly.
3. Read the current branch with `git rev-parse --abbrev-ref HEAD`.
4. Extract a ticket ID by matching the branch name against `[A-Z]+-\d+` (case-sensitive). The first match wins. Examples:
   - `feat/AIKK-185-add-pricing` → `AIKK-185`
   - `bugfix/HGAI-2050-file-limit` → `HGAI-2050`
   - `chore/cleanup-imports` → no ticket
5. Compose the message per `<format>` and `<rules>`. If the user passed arguments to the skill, treat them as context for the message (usually the *why* for the body) — the diff still determines type, scope, and subject.
6. Show the user the proposed message inside a fenced code block. Wait for confirmation.
7. After confirmation, commit with `git commit -m "subject" -m "body" -m "footer"` (one `-m` per paragraph) so newlines are preserved.
8. Never push. Never use `--no-verify` or `--no-gpg-sign`.
</workflow>

<format>
```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

- `<type>`: one of `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `perf`, `ci`, `build`, `revert`.
- `<scope>`: optional, lowercase, names a component or area (`auth`, `api`, `db`, `payments`). Omit if the change is broad.
- `<description>`: imperative, lowercase first letter, no trailing period.
</format>

<rules>
<subject>
- Whole subject line is ≤ 72 characters.
- Imperative mood: "add" not "added" or "adds".
- Lowercase first letter of the description.
- No trailing period.
- One subject line. No line breaks in the subject.
</subject>

<body>
- Separated from subject by exactly one blank line.
- Wrap at 72 characters per line.
- Explain *why* the change exists. The diff already shows *what*.
- Omit the body when the subject is self-explanatory. Do not pad.
</body>

<footer>
- If the branch name matches `[A-Z]+-\d+`, the footer MUST contain `Refs: TICKET-ID` on its own line.
- If the branch has no ticket pattern, omit the ticket footer entirely. Do not invent one.
- Breaking changes: add `!` after type/scope AND a `BREAKING CHANGE:` footer explaining the break and migration.
- NEVER add `Co-Authored-By:` trailers.
</footer>
</rules>

<examples>
<example>
<situation>Simple chore on a branch with no ticket: `chore/bump-go`.</situation>
<message>
```
chore(deps): bump go to 1.24
```
</message>
<why>Self-explanatory subject, no ticket on branch, no body needed.</why>
</example>

<example>
<situation>Feature on branch `feat/AIKK-185-add-pricing-endpoint`. New endpoint added because frontend needs current rates.</situation>
<message>
```
feat(pricing): add model pricing endpoint

The frontend needs current per-model rates to render the billing
dashboard. Reads from the pricing config and exposes
GET /api/pricing.

Refs: AIKK-185
```
</message>
<why>Body explains motivation (frontend dependency) — not derivable from diff. Footer required because branch contains AIKK-185.</why>
</example>

<example>
<situation>Bug fix on branch `fix/HGAI-2050-file-limit-text`. Label said "5 files" but validator allowed 10.</situation>
<message>
```
fix(ui): correct misleading file limit text

The label said "max 5 files" but the validator allowed 10. Aligned
the label with the actual limit so users do not assume a hard cap
that does not exist.

Refs: HGAI-2050
```
</message>
<why>Why-explanation matters: misleading copy caused user confusion. Ticket footer required.</why>
</example>

<example>
<situation>Breaking change on branch `refactor/HGAI-1947-drop-v1`. Removing v1 API endpoints.</situation>
<message>
```
refactor(api)!: drop v1 endpoints

BREAKING CHANGE: /api/v1/* removed. Clients must call /api/v2/*.
The deprecation notice was published 2026-01.

Refs: HGAI-1947
```
</message>
<why>`!` marks breaking change in subject, `BREAKING CHANGE:` footer explains the migration.</why>
</example>

<example type="bad">
<situation>Wrong: capitalized description, trailing period, vague type.</situation>
<message>
```
update(api): Added pricing endpoint.
```
</message>
<problems>
- `update` is not a valid type
- Description is past tense, not imperative
- "A" is capitalized
- Trailing period
- Missing scope detail and (likely) ticket footer
</problems>
</example>

<example type="bad">
<situation>Wrong: ticket invented when branch had no ticket pattern.</situation>
<branch>chore/cleanup-imports</branch>
<message>
```
chore: clean up unused imports

Refs: AIKK-999
```
</message>
<problems>
Ticket footer must be omitted when the branch has no `[A-Z]+-\d+` match. Never fabricate a ticket ID.
</problems>
</example>
</examples>

<checklist>
Before committing, verify every item:

- [ ] Type is one of: feat, fix, docs, style, refactor, test, chore, perf, ci, build, revert
- [ ] Subject ≤ 72 chars, imperative, lowercase first letter, no period
- [ ] Body wraps at 72, explains *why* — or is omitted
- [ ] `Refs: TICKET-ID` footer present iff branch matches `[A-Z]+-\d+`
- [ ] No `Co-Authored-By` line
- [ ] Breaking changes marked with `!` and a `BREAKING CHANGE:` footer
- [ ] User has confirmed the message before `git commit` runs
</checklist>
