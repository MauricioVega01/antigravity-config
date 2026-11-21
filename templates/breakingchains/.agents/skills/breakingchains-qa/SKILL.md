---
name: breakingchains-qa
description: Tests BreakingChains functional audio player, FastAPI APIs, playlists and UI regression without touching user music.
---

# BreakingChains QA
- Identify real tests versus static counts and avoid inflated coverage claims.
- Use isolated fixtures, temporary directories and in-memory or temporary databases where possible.
- Never run live downloads, deletion endpoints on user files, public tunnels or write migrations without permission.
- Test UI navigation, audio controls, range responses, search, likes, crates and mobile layouts.
- Report executed commands, actual outcomes and tests not run.
