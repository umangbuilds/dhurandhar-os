# Running memory log

This file is appended by the soul-keeper skill at session end and on user-marked decisions. Format: ISO timestamp, one-line summary, detail block.

Skills must:
- Append, never overwrite.
- Use ISO 8601 timestamps with India timezone (`2026-05-02T14:30:00+05:30`).
- Auto-summarise entries older than 30 days into a quarterly digest at line top.
- Never auto-fill MEMORY.md without user confirmation.
- Never lose entries during summarisation — archive originals to `MEMORY-archive-<quarter>.md`.

---

## Entries

<!-- soul-keeper appends below this line -->

## 2026-05-09T12:00:00+05:30 — DhurandharOS GitHub org claimed defensively

The `github.com/DhurandharOS` org is squatted to prevent typo-impersonation and brand hijacking. No active use, no migration plan. Canonical repo stays at `umangbuilds/dhurandhar-os`. Do not propose moving the codebase unless the operator explicitly raises it.
