---
name: debugging
description: Systematically diagnoses reproducible errors using logs, tests and minimal patches.
---

# Debugging workflow
1. Record expected and actual behavior plus reproduction steps.
2. Inspect logs safely (redact secrets), environment and recent diffs.
3. Form 2-3 hypotheses, design the cheapest discriminating tests.
4. Fix the root cause with a small change, not unrelated refactoring.
5. Add a regression test where practical; state remaining uncertainty.
