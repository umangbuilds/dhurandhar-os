# Install DhurandharOS

DhurandharOS is a Claude Code skills package. Install it once, the skills auto-trigger on the operator's natural language, and the senior team is in the room.

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

```bash
# 1. Clone the repo into your project directory
git clone https://github.com/<your-handle>/dhurandhar-os.git ~/.claude/plugins/dhurandhar-os

# 2. Point Claude Code's plugin marketplace at the local clone
#    (in Claude Code: /plugin marketplace add ~/.claude/plugins/dhurandhar-os)

# 3. Install the plugin
#    /plugin install dhurandhar-os@dhurandhar-os

# 4. Verify
#    /plugin list  → should show dhurandhar-os v0.1.0
```

The skills auto-trigger on natural language. You do not need to memorise slash commands.

---

## Verifying skills are loaded

In Claude Code, ask:

> "What DhurandharOS skills are available?"

You should see the seven skills listed:
1. soul-keeper
2. builder
3. reviewer
4. prd-writer
5. idea-reality-check
6. hiring-jd-writer
7. launch-marketer (stub)

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

```bash
cd /your/project/directory
cp ~/.claude/plugins/dhurandhar-os/SOUL.md .
cp ~/.claude/plugins/dhurandhar-os/STYLE.md .
cp ~/.claude/plugins/dhurandhar-os/IDENTITY.md .
cp ~/.claude/plugins/dhurandhar-os/MEMORY.md .
cp ~/.claude/plugins/dhurandhar-os/lessons.md .
```

You can edit `IDENTITY.md` to give your project its own name and one-line. SOUL.md and STYLE.md are designed to be DhurandharOS-default; you can customise but the 80/15/5 voice and banned-tokens list should stay intact unless you have a strong reason.

`MEMORY.md` and `lessons.md` are append-only. Soul Keeper will write to them as you mark moments.

---

## Tier 2 add-ons

DhurandharOS's `reviewer` and `prd-writer` skills route to Tier 2 add-ons for regulatory deep-dives (DPDPA, RBI, UPI). Those add-ons are *not* shipped with DhurandharOS — install them separately from the original author.

See [RECOMMENDED.md](RECOMMENDED.md) for the curated catalog organised by founder stage.

**Always scan a Tier 2 add-on with `mcp-scan` or `SkillCheck` before activation.** Skills can contain hostile code; treat any third-party skill the way you'd treat any third-party dependency — verify before activating.

---

## Troubleshooting

### Skills don't auto-trigger
- Confirm `/plugin list` shows `dhurandhar-os v0.1.0`.
- Confirm each `skills/<skill-name>/SKILL.md` has valid YAML frontmatter (no parsing errors).
- Try explicit invocation: "use the prd-writer skill on this." If explicit works but auto-trigger doesn't, the `description` field's natural-language matching may need tuning.

### Voice is wrong (US-default, sycophantic, emoji)
- Confirm `SOUL.md` and `STYLE.md` are in the working directory root.
- Confirm `soul-keeper` triggered at session start (look for the "Soul loaded" acknowledgement).
- If voice drifts mid-session, ask the operator to say "re-load the soul" — soul-keeper will re-read SOUL.md and STYLE.md.

### Memory writes aren't happening
- soul-keeper requires explicit confirmation before any MEMORY.md / lessons.md write. If you said "remember this" but didn't see a confirmation prompt, check that the trigger phrase was clearly in your message.
- Verify MEMORY.md and lessons.md exist at the project root.

### Plugin install fails
- Confirm Claude Code version >= 2.x.
- Confirm `.claude-plugin/plugin.json` is valid JSON.
- Try cloning the repo into `~/.claude/plugins/` directly and pointing the marketplace at it.

---

## Updating

```bash
cd ~/.claude/plugins/dhurandhar-os
git pull
# /plugin reload dhurandhar-os@dhurandhar-os in Claude Code
```

DhurandharOS pins all source-repo SHAs in `ATTRIBUTIONS.md`. When you update, those SHAs may advance — check `ATTRIBUTIONS.md` for the pinned version.

---

## Uninstall

```bash
# In Claude Code
/plugin uninstall dhurandhar-os@dhurandhar-os
/plugin marketplace remove dhurandhar-os

# On disk
rm -rf ~/.claude/plugins/dhurandhar-os
```

`MEMORY.md` and `lessons.md` in your project directory are NOT touched. Those are your data, append-only, preserved.
