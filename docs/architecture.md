# Architecture

DhurandharOS is structured around three layers: identity (loaded once per session), workflow (skills that auto-trigger on the operator's natural language), and memory (persistent state that accumulates across sessions). This document explains how those layers fit together and how the 6+1 skill set is wired.

---

## The three layers

### 1. Identity layer (loaded at session start)
Every session begins with the Soul Keeper skill auto-loading three files:

- **SOUL.md** — what DhurandharOS believes (worldview, opinions, anti-patterns, mirror principle, boundaries).
- **STYLE.md** — how DhurandharOS speaks (80/15/5 voice rhythm, banned tokens, voice samples, lint rules).
- **IDENTITY.md** — name, one-line, avatar guidance, three-word tone.

These are not user-editable mid-session. They are the constants that flex the voice without flexing the values.

### 2. Workflow layer (auto-trigger skills)
Six Tier 1 skills, each with explicit auto-trigger conditions in YAML frontmatter. The Claude Code skill loader matches the user's natural language against the description, activates the relevant skill, and executes the workflow.

```
session-start  → Soul Keeper loads identity + memory
   │
   ├── operator says "let's build / implement / ship"     → Builder (auto-runs Reviewer post-build)
   ├── operator says "spec / PRD / lock the requirements"  → PRD Writer
   ├── operator says "idea / should I build / pivot"       → Idea Reality Check
   ├── operator says "deploy / hosting / where to host"    → Deployment Advisor
   ├── git diff / PR / "review this"                       → Reviewer
   └── operator says "remember / log / lesson"             → Soul Keeper (memory write)

session-end → Soul Keeper prompts for memory + lessons capture
```

Skills are not mutually exclusive. PRD Writer can hand off to Builder, Builder can hand off to Reviewer, Reviewer can route to a Tier 2 add-on for regulatory deep-dives.

### 3. Memory layer (persistent across sessions)
Two append-only files at the repo root:

- **MEMORY.md** — running log of decisions, context, and operator-marked moments. ISO 8601 timestamps with India timezone. Quarterly digest at the top once entries exceed 90 days.
- **lessons.md** — `LESSON: [what went wrong] → [what to do instead] — [date]`. Captured when the operator says "lesson learned" or "next time."

Memory is sacred. Append-only. Never silently rewritten. When the file gets long, the original is archived to `MEMORY-archive-<quarter>.md` and a digest is summarised at the top of the live file. Originals are preserved.

---

## The 6+1 skill map

| Skill | Source(s) | Length target | What it does |
|---|---|---|---|
| Soul Keeper | aaronjmars/soul.md, obra/private-journal-mcp | 200–400 lines | Identity load (cache fallback) + memory + lesson capture + voice enforcement + SessionStart hook precedence |
| Builder | obra/superpowers, garrytan/gstack | 350–500 lines | TDD-first + plan-first + destructive-command guards + worktree isolation + mandatory post-build review |
| Reviewer | agamm/claude-code-owasp, anthropics/claude-code-security-review, garrytan/gstack | 400–600 lines | OWASP/ASVS adversarial review + false-positive filter + Tier 2 routing |
| PRD Writer | anthropics/knowledge-work-plugins, obra/superpowers | 400–500 lines | Money-aware spec + regulatory triggers + failure modes + reconciliation |
| Idea Reality Check | obra/superpowers (brainstorming) | 300–500 lines | Adversarial brainstorm + Mom Test + Indian-context reframe |
| Deployment Advisor | AWS/Vercel/Supabase docs + Indian fintech post-mortems | 200–400 lines | Vercel + Supabase pre-revenue, AWS Mumbai for regulated production, migration triggers, PSP guidance on demand |
| Launch + Marketer (stub) | coreyhaines31/marketingskills | 50–100 lines | v0.2 deferral pointer |

All six Tier 1 skills derive their patterns from MIT-licensed sources, pinned to specific commit SHAs in [ATTRIBUTIONS.md](../ATTRIBUTIONS.md).

---

## Auto-trigger model

Slash commands are not the primary UX. Each skill's YAML frontmatter `description` field carries the trigger conditions in natural language, plus explicit phrase-level triggers. Claude Code matches the operator's input against descriptions to decide which skill to load.

This means:
- The operator does not need to memorise slash commands.
- The operator can still invoke a skill explicitly by name (e.g. "use the reviewer skill on this diff").
- Skills can chain: PRD Writer hands the locked spec to Builder, which hands the diff to Reviewer.

A slash command exists as fallback for power users, but it is not advertised in the README's Quickstart.

---

## Routing to Tier 2 add-ons

DhurandharOS v0.1 ships universal solo-operator skills + Deployment Advisor for Indian infrastructure context. It does not ship a Hiring JD Writer, DPDPA core skill, RBI Digital Lending core skill, or UPI Payments core skill. Those are deferred to v0.2.

For the operator who needs DPDPA / RBI / UPI today, the Reviewer and PRD Writer skills route to Tier 2 recommendations:

- **DPDPA / GDPR / ISO 27001 / SOC 2 / HIPAA:** route to `Sushegaad/Claude-Skills-Governance-Risk-and-Compliance`.
- **Privacy-only deep-dive:** route to `mukul975/Privacy-Data-Protection-Skills`.
- **Marketing / launch:** route to `coreyhaines31/marketingskills`.
- **Security review (full):** Tier 1 Reviewer covers this; Tier 2 supplement is `anthropics/claude-code-security-review` standalone.

The full catalog with stage-by-stage organisation is in [RECOMMENDED.md](../RECOMMENDED.md).

---

## File hygiene

Every shipped file has:
- A clear header (in markdown, the H1 title).
- No competitor brand names in user-facing copy (lint enforced).
- No emoji of any kind.
- No "Sanskrit-as-theatre," no "Hinglish-as-marketing."
- A consistent voice — STYLE.md is the law.

Lint pass before every commit. See `STYLE.md` for the regex patterns.

---

## v0.2 architecture preview

v0.2 will add:
- DPDPA Compliance core skill (alongside the Tier 2 router).
- RBI Digital Lending core skill (Digital Lending Guidelines 2022 + 2023 amendments).
- UPI Payments core skill (NPCI dispute resolution, autopay mandates, QR specifications).
- Launch + Marketer expanded from stub.

The auto-trigger architecture stays the same. v0.2 just deepens the workflow surface.
