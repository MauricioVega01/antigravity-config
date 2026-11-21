# BreakingChains workspace rules

- Existing application: Python/FastAPI + SQLite backend, Vanilla JS + CSS + Web Audio API frontend. Inspect actual files first.
- Preserve player, playlists, favorites, local music library, route contracts, and current UI event IDs.
- Visual design: near-black backgrounds, industrial red #ff1a1a, compact professional DJ workstation, not a generic streaming clone.
- No replacement with React/Vue or another framework unless authorized.
- No modifications to databases, audio files, `.env`, credentials, sessions or tunnels without explicit permission and a verified backup.
- Audio visualization: never describe pseudo-random graphics as measured waveforms; distinguish real decoded data, metadata estimates and fallback.
- For UI work modify static/index.html and static/style.css first; change static/app.js only when necessary after identifying callers.
- Work in small iterations: design system and navigation; cards/lists; player and responsive. Validate each iteration.
- Do not expose the app publicly until unauthenticated sensitive endpoints and file access have been secured.
