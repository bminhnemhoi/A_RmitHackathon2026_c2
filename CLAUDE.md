@AGENTS.md

## Claude Code notes
- Windows host: Docker Desktop, Node 24, Git Bash (bash/jq/curl available, no `sudo`, no WSL). Strip `sudo` when running
  Tide init scripts, or run the `docker run` command from docs/CONTEXT.md manually.
- Ask the `tide-pack` MCP (`tide_choose_playbook` → `tide_playbook`) before writing TideCloak integration code.
- When a Tide call fails, capture the exact error text — it may become part of the demo (e.g. a blocked decrypt).
