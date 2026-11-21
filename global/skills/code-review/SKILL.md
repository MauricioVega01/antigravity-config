---
name: code-review
description: Reviews code diffs for bugs, security regressions, data loss and maintainability; use for pull requests and before accepting changes.
---

# Code review workflow
1. Inspect git diff and related callers, tests, and interfaces.
2. Rank issues by severity with file/line references and reproducible evidence.
3. Check authorization, input validation, resource limits, data safety, concurrency and error paths.
4. Distinguish verified bugs from hypotheses.
5. Do not edit unless asked; summarize remaining test gaps.
