# DhurandharOS v0.1.7 — Soul Keeper SessionStart Hook

**Released:** 2026-05-06
**Theme:** v0.1.6 fixed *what* Soul Keeper does on cold start. v0.1.7 fixes *when* it runs — before any other plugin's session-start skill.

---

## What was missing in v0.1.6

Soul Keeper relied entirely on the SKILL.md auto-trigger model: the description field said "ALWAYS LOADS AT SESSION START" and the model picked the skill out of its registry. In an environment with multiple plugins installed — `superpowers`, `marketingskills`, plus DhurandharOS — the auto-trigger race was non-deterministic. Other plugins shipping their own session-start skill (notably `superpowers`' `productivity:start`) sometimes won the trigger and the operator's first response came in the wrong voice.

The fix: don't rely on description-based auto-trigger for the most important boot step. Use the SessionStart hook system to inject Soul Keeper context as system-level reminder content before any user input is processed.

---

## What changed in v0.1.7

### `hooks/` directory — new

Three new files:

- **`hooks/hooks.json`** — registers a SessionStart hook against the matchers `startup|clear|compact`. Fires synchronously (`async: false`) so the context is in place before the first model turn.
- **`hooks/run-hook.cmd`** — cross-platform polyglot wrapper. Windows `cmd.exe` runs the batch portion to find Git-for-Windows bash; Unix shells skip the batch and fall through to the bash exec. Adapted from `obra/superpowers` (MIT) — see [ATTRIBUTIONS.md](ATTRIBUTIONS.md).
- **`hooks/session-start`** — bash script. Reads `skills/soul-keeper/SKILL.md`, escapes it for JSON, wraps it in a strong `<EXTREMELY_IMPORTANT>` preamble that asserts soul-keeper precedence over other plugins' session-start skills, and emits the result as `hookSpecificOutput.additionalContext` (Claude Code) / `additional_context` (Cursor) / `additionalContext` (Copilot CLI).

### How the race is won

When Claude Code starts a session in a directory where multiple plugins are installed, every plugin with a SessionStart hook injects context simultaneously. The model sees all of them as system reminders. Two things now make Soul Keeper the first thing actually executed:

1. **The preamble explicitly names the precedence rule.** Quoted from `hooks/session-start`:

   > "This takes precedence over generic session-start behaviour from other plugins. If another plugin also has a session-start skill (e.g. superpowers' productivity:start), run soul-keeper FIRST, then yield."

2. **The full SKILL.md is embedded in context.** The model doesn't need to look up the skill — it already has the session-start ritual in its window.

Combined, the model invokes soul-keeper before turning to any other plugin's session-start skill, because the soul-keeper instructions are in front of it as `<EXTREMELY_IMPORTANT>` system reminder content.

### v0.1.6 behaviour preserved

The hook does not replace any existing skill logic. Soul Keeper's two-tier file resolution (working dir → plugin cache fallback) added in v0.1.6 is unchanged. The hook simply ensures the skill is invoked at the right moment.

If the hook fails to fire (Windows without bash, hook execution disabled, plugin not enabled), Soul Keeper still works via the SKILL.md auto-trigger path. The hook is a strict additive — it raises the floor without changing the ceiling.

### Versions bumped to 0.1.7

- `.claude-plugin/plugin.json`
- `.claude-plugin/marketplace.json` (both `metadata.version` and `plugins[0].version`)
- `README.md` status badge
- `INSTALL.md` reference lines

### Nothing else changed

No skill body changes. No identity layer changes. No content edits. The seven existing skill directories, identity layer (SOUL.md / STYLE.md / IDENTITY.md), lint script, and tests are byte-for-byte identical to v0.1.6.

---

## Known limits

The SessionStart hook is the strongest signal we can send, but it is not a hard execution guarantee. The model still chooses what to do with the injected context. If a future Claude Code release changes hook ordering or precedence semantics, Soul Keeper's first-mover advantage may regress.

**Fallback path:** if the hook ever fails to win the race in a future environment, the operator can type `use dhurandhar` or `use the soul-keeper skill` as the opener. Soul Keeper's natural-language trigger handles that case unambiguously.

---

## Upgrade path

```
$ claude plugin marketplace update
$ claude plugin update dhurandhar-os@dhurandhar-os
```

Should report 0.1.6 → 0.1.7. Restart Claude Code so the hook registers.

In a fresh session, the first response should come in the calibrated voice:

> Soul loaded. DhurandharOS identity calibrated. Where do we start?

If a second plugin (superpowers, marketingskills) is also installed and its session-start skill *also* injects context, the model should still invoke Soul Keeper first because the preamble explicitly claims precedence.

---

## Closing

v0.1.5 fixed the install. v0.1.6 fixed cold-start identity load. v0.1.7 fixes who runs first when multiple plugins compete at session boot. The senior team is in the room — and Soul Keeper is at the door.

Day 4 of 90.
