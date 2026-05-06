# Release Notes — v0.1.11

Docs-only release. No code changes.

## What's fixed

The previous install instructions in `README.md` and `INSTALL.md` told users to run `/plugin marketplace add` and `/plugin install` inside the Claude Desktop **Code** tab. That does not work — `/plugin` slash commands are registered only in the Claude Code CLI (terminal), not in Claude Desktop's Code tab. This is tracked upstream as Anthropic GitHub issue #42142.

## What's changed

### `README.md` — install section restructured

The install section now leads with the **natural-language agentic install**, which is verified to work in Claude Desktop's Code tab. The operator types one English sentence — `install DhurandharOS from github.com/umangbuilds/dhurandhar-os` — and Claude Code agentically runs the right commands with explicit permission prompts. No `/plugin` slash commands. No terminal. No CLI.

The existing terminal CLI flow is preserved as the **power-user path** for operators who already live in the terminal.

### `INSTALL.md` — same restructure + troubleshooting note

The "Quick install" subsection now leads with the desktop app + Code tab natural-language method. The terminal CLI path moves to "Power-user path." A new troubleshooting entry explains the `"/plugin isn't available in this environment"` error and points the operator at the natural-language install.

The manual install path (`git clone`), Windows section, voice / memory troubleshooting, and uninstalling sections are untouched.

### Version bumps

- `plugin.json` — 0.1.10 → 0.1.11
- `marketplace.json` — 0.1.10 → 0.1.11
- `README.md` status badge — 0.1.8 → 0.1.11
- `INSTALL.md` version references — 0.1.8 → 0.1.11

## Why this matters

A non-technical operator opening the Claude desktop app should not have to know that `/plugin` is a CLI-only thing. The natural-language install path is the one that holds up under "I don't have a terminal, I just opened the app." That's the operator we ship for.

## Files changed

- Changed: `README.md` (install section, status badge)
- Changed: `INSTALL.md` (quick install, troubleshooting, version refs)
- Changed: `.claude-plugin/plugin.json` (0.1.10 → 0.1.11)
- Changed: `.claude-plugin/marketplace.json` (0.1.10 → 0.1.11)
- Added: `RELEASE-NOTES-v0.1.11.md`

## License

MIT.
