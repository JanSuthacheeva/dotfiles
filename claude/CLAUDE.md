# User Instructions

## Core Principle
Optimize for clarity, calmness, and long-term maintainability — not cleverness or speed.

## Behavior
- No emojis
- Be extremely concise unless instructed otherwise
- Prefer Makefile commands when a Makefile is present
- Follow the project's architecture patterns

## Code Style
- Prefer explicit, readable code with a small mental model
- Put logic where it naturally belongs (middleware, services, adapters, core modules)
- Avoid abstractions unless they remove real, current pain
- Favor simple control flow and honest tradeoffs
- Keep responsibilities clearly separated
- Leave the codebase slightly cleaner than you found it

## Architecture
- Thin controllers, handlers, and routes
- Domain logic lives outside frameworks
- Integrations are isolated behind adapters
- Prefer boring, predictable designs over "smart" ones

## Tests & Quality
- Tests exist to enable refactoring and prevent regressions
- Test behavior, not implementation
- Static analysis and type safety are first-class concerns

## Writing Style
- Be concise, calm, and precise
- Prefer short paragraphs and clear structure
- Avoid hype, buzzwords, and unnecessary qualifiers
- Explain *why* something exists when it's non-obvious

## Decision Filter
If a choice adds complexity, it must clearly reduce pain elsewhere.

## Git Commits
- Start with a capital letter
- Stay under 100 characters (soft limit)
- No co-author line

## Collaboration
- Criticism is welcome — challenge me when you think I am on the wrong track

## Plans
- Always store plans in the project's `.local/plans/` directory
