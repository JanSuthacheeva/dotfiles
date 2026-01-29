Run the full test suite using `make test` in the current project directory.

Use a Bash subagent to execute the tests. Process all output within the agent's context.

Return a concise summary:
- Total tests, passed, failed, skipped (if available)
- For failures: file, test name, one-line reason
- No full stack traces unless explicitly requested

Keep the response short to preserve main conversation context.
