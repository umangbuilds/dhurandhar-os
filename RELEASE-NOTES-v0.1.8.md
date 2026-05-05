# DhurandharOS v0.1.8 — Skill Cleanup + Routing + Compact Preservation

**Released:** 2026-05-06
**Theme:** v0.1.7 made Soul Keeper win the trigger race. v0.1.8 cleans up what wins.

---

## What changed

### 1. Removed: Hiring JD Writer (deferred to v0.2)

`skills/hiring-jd-writer/` and its tests / examples deleted. v0.1 ships a tighter, more honest set of universal solo-operator skills. Hiring JD Writer ships in v0.2 alongside DPDPA Compliance and RBI Digital Lending — that's where the India-context regulatory cluster belongs. References removed from README, INSTALL, ROADMAP, mission, STYLE, docs/architecture, docs/operator-glossary, docs/voice-guide, marketplace and plugin manifests. Historical files (RELEASE-NOTES-v0.1.x, test-results-v0.1.x, DECISIONS) left intact as version record.

### 2. Added: `skills/using-dhurandhar/` — skill-routing layer

A new meta-skill that maps the operator's natural-language request to the right Tier 1 skill. Loaded at session start via the v0.1.7 SessionStart hook (now cats both `soul-keeper/SKILL.md` and `using-dhurandhar/SKILL.md`).

Routing table embedded:

| Skill | Triggers on |
|---|---|
| Soul Keeper | Always active. Identity / voice. |
| Idea + Reality Check | New ideas, "should I build", risky decisions. Refuses code without three named first paying users. |
| PRD Writer | "spec", "PRD", "lock the spec", "scope this". |
| Builder | "build this", "implement", "ship it" — only after spec is locked. |
| Reviewer | "review this", git diff, PR — AND auto-runs after Builder. |
| Deployment Advisor | "deploy", "hosting", "Vercel", "Supabase", "AWS Mumbai". |
| Launch + Marketer | Stub — "coming in v0.2". |

**Mandatory rule:** Builder MUST run Reviewer post-build. Idea + Reality Check runs before Builder for new ideas. PRD Writer runs before Builder for non-trivial builds.

### 3. Added: Builder post-build review section

Builder's SKILL.md now contains a "Post-Build Review (mandatory)" section. Every build task — full feature, fix, component, or script — runs a review pass before results reach the operator. Three checks: spec match, obvious errors, non-technical-user clarity. Non-trivial builds hand off to the full Reviewer skill.

### 4. Added: `CLAUDE.md.template` with compact-preservation

Operators copy this to their project root as `CLAUDE.md`. The Compact Instructions section names what to preserve (mission, locked decisions, voice calibration, pending memory writes, current build state) and what to drop (full file contents, verbose tool outputs, exploratory discussion, dead paths) when the conversation compacts.

---

## Honest size measurement

The SessionStart hook now injects ~19,000 characters / ~4,750 estimated tokens (4 chars/token approximation). The original target in the v0.1.8 plan was 3,000 tokens. The v0.1.7 base injection (full soul-keeper SKILL.md alone) was already ~3,500 tokens. The `using-dhurandhar` routing layer added ~1,100 tokens.

Trimming soul-keeper's body would risk losing the memory-capture and lesson-capture protocols that fire later in the session. Per the v0.1.8 plan's "Do NOT touch the SessionStart hook mechanism from v0.1.7" constraint, soul-keeper SKILL.md is preserved byte-for-byte. The 3,000-token target was missed; the architecture decision is honest about it.

A future release may extract memory/lesson protocols into separate skills (lazy-loaded on trigger) and slim the SessionStart injection. That is a v0.2 concern.

---

## v0.1.8 ships

- 5 universal solo-operator skills: Soul Keeper, Builder, Reviewer, PRD Writer, Idea + Reality Check
- Deployment Advisor (added v0.1.2)
- 1 stub: Launch + Marketer
- 1 meta-routing layer: using-dhurandhar
- Identity layer: SOUL.md / STYLE.md / IDENTITY.md / MEMORY.md / lessons.md
- SessionStart hook (v0.1.7) with two-skill injection (soul-keeper + using-dhurandhar)
- CLAUDE.md.template with compact-preservation rules

Total: 6 Tier 1 skills + 1 stub + 1 meta-routing layer + 1 SessionStart hook + 1 project template.

---

## Versions bumped

- `.claude-plugin/plugin.json`
- `.claude-plugin/marketplace.json` (both `metadata.version` and `plugins[0].version`)
- `README.md` status badge
- `INSTALL.md` reference lines

`hiring` keyword removed from both manifest keyword lists.

---

## Upgrade path

```
$ claude plugin marketplace update
$ claude plugin update dhurandhar-os@dhurandhar-os
```

Should report 0.1.7 → 0.1.8. Restart Claude Code so the updated hook registers. In a fresh session, type something like "I want to build an invoicing app for freelancers" and verify Idea + Reality Check triggers — it should ask about the customer first before any builder activity.

---

## Closing

v0.1.7 made Soul Keeper win the trigger race. v0.1.8 makes sure what wins is the right thing. The senior team is in the room — and now there's a routing layer that decides who speaks.

Day 4 of 90.
