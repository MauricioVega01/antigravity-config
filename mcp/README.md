# MCP configuration — manual by machine

Do NOT synchronize `mcp_config.json` with credentials or local paths across PCs. Configure trusted MCPs from Antigravity's MCP manager on each computer. The global file is typically `%USERPROFILE%\.gemini\config\mcp_config.json`.

Recommended start: built-in browser integration / Chrome DevTools. Add GitHub MCP only if actually needed, with least-privilege credentials per PC. Check the official current documentation and run each connector under a non-admin user when practical.

This template intentionally contains no active servers and the installer does not touch MCP configuration.
