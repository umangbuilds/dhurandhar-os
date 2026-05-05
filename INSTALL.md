# Install DhurandharOS

DhurandharOS is a Claude Code skills package. Install it once, the skills auto-trigger on the operator's natural language, and the senior team is in the room.

> **Claude Code only.** DhurandharOS works in Claude Code (the CLI tool), not the Claude Desktop chat app. If you're not sure which one you have, see: `claude --version` in your terminal — if that works, you have Claude Code.

---

## How to read this guide

- **Lines starting with `$`** are terminal commands — run them in your operating system's terminal (Terminal.app on macOS, Ubuntu shell on WSL, PowerShell on native Windows).
- **Lines starting with `/`** are Claude Code interactive commands — type them inside an active Claude Code session, after you run `$ claude` to start.

Example:
- `$ claude plugin marketplace add umangbuilds/dhurandhar-os` — runs in your terminal
- `/plugin list` — type this inside Claude Code after running `$ claude`

---

## Prerequisites

- Claude Code 2.x or later. Earlier versions don't support the auto-triggering skill model used here.
- Git (any modern version).
- A working directory where you'll build your project. DhurandharOS lives alongside your code.

Optional but recommended:
- `mcp-scan` or `SkillCheck` for verifying any skill (Tier 1, Tier 2, or third-party) before activation.
- `gh` CLI if you plan to clone via GitHub auth.

---

## Quick install (recommended)

```
$ claude plugin marketplace add umangbuilds/dhurandhar-os
```

Then inside Claude Code:

```
/plugin install dhurandhar-os@dhurandhar-os
/plugin list
/reload-plugins
```

You should see `dhurandhar-os v0.1.4` listed as Enabled.

---

## Manual install (if marketplace add fails)

```
# 1. Clone the repo directly
$ git clone https://github.com/umangbuilds/dhurandhar-os.git ~/.claude/plugins/dhurandhar-os

# 2. Point Claude Code's plugin marketplace at the local clone
$ claude plugin marketplace add ~/.claude/plugins/dhurandhar-os
```

Then inside Claude Code:

```
/plugin install dhurandhar-os@dhurandhar-os
/plugin list
/reload-plugins
```

---

## Verifying skills are loaded

Inside Claude Code, ask:

> "What DhurandharOS skills are available?"

You should see the seven skills listed:
1. soul-keeper
2. builder
3. reviewer
4. prd-writer
5. idea-reality-check
6. hiring-jd-writer
7. launch-marketer (stub — full skill lands in v0.2)

If any skill is missing, check `dhurandhar-os/skills/<skill-name>/SKILL.md` exists and has valid YAML frontmatter.

---

## First session — what to expect

When you start a fresh session in a project that has `SOUL.md`, `STYLE.md`, and `IDENTITY.md` at the root, the **soul-keeper** skill auto-loads first. You'll see a brief identity-load acknowledgement:

> "Soul loaded. SOUL / STYLE / IDENTITY are in. Memory log shows N entries from the last 30 days. Where do we start?"

The voice is calibrated to the 80/15/5 rhythm (80% Pan-Indian English, 15% travel-vocabulary, 5% vernacular sparingly mirrored).

From there, just describe what you're doing in natural language. The relevant skill auto-triggers:

- "Let's spec the disbursement flow" → **prd-writer**.
- "I'm thinking of building a kirana super-app" → **idea-reality-check**.
- "Build the webhook handler" → **builder**.
- "Review this diff" → **reviewer**.
- "I want to hire an SDE-2" → **hiring-jd-writer**.
- "Remember this for next time" → **soul-keeper** (memory write).

---

## Setting up your project's identity layer

For DhurandharOS to be useful in your project, copy the identity files to your project root:

```
$ cd /your/project/directory
$ cp ~/.claude/plugins/dhurandhar-os/SOUL.md .
$ cp ~/.claude/plugins/dhurandhar-os/STYLE.md .
$ cp ~/.claude/plugins/dhurandhar-os/IDENTITY.md .
$ cp ~/.claude/plugins/dhurandhar-os/MEMORY.md .
$ cp ~/.claude/plugins/dhurandhar-os/lessons.md .
```

You can edit `IDENTITY.md` to give your project its own name and one-line. SOUL.md and STYLE.md are designed to be DhurandharOS-default; you can customise but the 80/15/5 voice and banned-tokens list should stay intact unless you have a strong reason.

`MEMORY.md` and `lessons.md` are append-only. Soul Keeper will write to them as you mark moments.

---

## Tier 2 add-ons

DhurandharOS's `reviewer` and `prd-writer` skills route to Tier 2 add-ons for regulatory deep-dives (DPDPA, RBI, UPI). Those add-ons are *not* shipped with DhurandharOS — install them separately from the original author.

See [RECOMMENDED.md](RECOMMENDED.md) for the curated catalog organised by founder stage.

**Always scan a Tier 2 add-on with `mcp-scan` or `SkillCheck` before activation.** Skills can contain hostile code; treat any third-party skill the way you'd treat any third-party dependency — verify before activating.

---

## Windows install

DhurandharOS works on Windows. Two paths:

### Path A — Native Windows (PowerShell)

```
# Install Claude Code
$ irm https://claude.ai/install.ps1 | iex

# Then proceed with Quick Install above
$ claude plugin marketplace add umangbuilds/dhurandhar-os
```

**Windows gotchas:**
- Plugin path is `%USERPROFILE%\.claude\plugins\` (not `~/.claude/plugins/` like macOS/Linux).
- Antivirus false positives: add `%USERPROFILE%\.claude\` to your antivirus exclusion list if installation hangs.
- PowerShell execution policy: if `irm ... | iex` fails, run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` first.
- npm-on-Windows path issues: if `claude` command isn't found after install, restart PowerShell as administrator and re-run the installer.

### Path B — WSL2 (recommended for developers)

Install Claude Code inside your WSL2 Ubuntu environment:

```
$ curl -fsSL https://claude.ai/install.sh | sh
$ claude plugin marketplace add umangbuilds/dhurandhar-os
```

Plugin path inside WSL2: `~/.claude/plugins/` (standard Linux path).

WSL2 file access: your Windows files are at `/mnt/c/Users/<your-name>/`. Run Claude Code from your WSL2 project directory, not the Windows path.

---

## Troubleshooting

### Skills don't auto-trigger
- Confirm `/plugin list` shows `dhurandhar-os v0.1.4`.
- Confirm each `skills/<skill-name>/SKILL.md` has valid YAML frontmatter (no parsing errors).
- Try explicit invocation: "use the prd-writer skill on this." If explicit works but auto-trigger doesn't, the `description` field's natural-language matching may need tuning.
- Anthropic issue #51806: if `claude plugin marketplace add` fails with "marketplace not found," manually add the marketplace URL by editing `~/.claude/known_marketplaces.json` and adding `"umangbuilds/dhurandhar-os"` to the list, then retry.

### Voice is wrong (US-default, sycophantic, emoji)
- Confirm `SOUL.md` and `STYLE.md` are in the working directory root.
- Confirm `soul-keeper` triggered at session start (look for the "Soul loaded" acknowledgement).
- If voice drifts mid-session, ask the operator to say "re-load the soul" — soul-keeper will re-read SOUL.md and STYLE.md.

### Memory writes aren't happening
- soul-keeper requires explicit confirmation before any MEMORY.md / lessons.md write. If you said "remember this" but didn't see a confirmation prompt, check that the trigger phrase was clearly in your message.
- Verify MEMORY.md and lessons.md exist at the project root.
- soul-keeper uses the Edit tool to append entries — confirm the tool call ran by checking MEMORY.md directly after the confirmation step.

### Plugin install fails
- Confirm Claude Code version >= 2.x (`$ claude --version`).
- Confirm `.claude-plugin/plugin.json` is valid JSON (`$ python3 -c "import json; json.load(open('.claude-plugin/plugin.json'))"` in the repo dir).
- Try the manual install path above.

---

## Updating

```
$ cd ~/.claude/plugins/dhurandhar-os
$ git pull
```

Then inside Claude Code:

```
/plugin reload dhurandhar-os@dhurandhar-os
```

DhurandharOS pins all source-repo SHAs in `ATTRIBUTIONS.md`. When you update, those SHAs may advance — check `ATTRIBUTIONS.md` for the pinned version.

---

## Uninstalling

Inside Claude Code:

```
/plugin uninstall dhurandhar-os@dhurandhar-os
/plugin marketplace remove dhurandhar-os
```

Then on disk:

```
$ rm -rf ~/.claude/plugins/dhurandhar-os
```

`MEMORY.md` and `lessons.md` in your project directory are NOT touched. Those are your data, append-only, preserved.
