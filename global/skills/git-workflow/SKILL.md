---
name: git-workflow
description: Uses Git safely for incremental development, branches, commits and merge conflict avoidance.
---

# Git workflow
1. Run git status before editing and preserve uncommitted user work.
2. Prefer a feature branch or worktree for risky changes. Ask before initializing or publishing any repository.
3. Check .gitignore and staged diff for secrets, local media, caches and databases.
4. Never force push, reset --hard, clean, rewrite history or create remote repositories without explicit approval.
5. Explain commit scope and rollback method.
