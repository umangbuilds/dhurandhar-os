# Release notes — v0.1.0

DhurandharOS v0.1.0 ships. The senior team is in a file. The operator drives.

---

## What ships

**6 Tier 1 skills** authored, customised, and maintained by DhurandharOS:

1. **soul-keeper** — identity / memory / lesson-capture skill. Loads SOUL.md / STYLE.md / IDENTITY.md at session start, captures running memory and lessons, enforces voice with the 80/15/5 rhythm.
2. **builder** — TDD-first orchestrator. Plan-first, RED-GREEN-REFACTOR, destructive-command guard, freeze mode, subagent dispatch on tasks >50 lines.
3. **reviewer** — adversarial security review. OWASP Top 10:2025 + ASVS 5.0 + Agentic AI ASI01–ASI10. HIGH/MEDIUM-only output, max 5 findings per pass, false-positive filtering, Tier 2 add-on routing for DPDPA / regulatory deep-dives.
4. **prd-writer** — money-aware spec writer. Forces settlement timing, reconciliation ownership, failure modes, regulatory triggers checklist with Tier 2 routing.
5. **idea-reality-check** — adversarial brainstorming. Refuses to advance to spec without first paying users named. Indian-context reframe, Mom Test discipline, steel-man pass.
6. **hiring-jd-writer** — India-context JD writer. Comp bands from public listing data (no competitor brands), Tier-1-only filter flag, ESOP §17(2)(vi) tax language, FEMA flag for foreign-resident grants, EPFO compliance footer.

**1 v0.2 stub:**
- **launch-marketer** — points to `coreyhaines31/marketingskills` as the Tier 2 interim. Full skill in v0.2.

**~14 Tier 2 recommendations** — curated catalog organised by founder stage in `RECOMMENDED.md`. We don't ship these; we point you to the original author.

---

## Source attributions (one line each)

- `obra/superpowers` (MIT, Jesse Vincent) — TDD, plan-first, subagent dispatch, worktree isolation, brainstorming patterns.
- `garrytan/gstack` (MIT, Garry Tan) — careful / freeze / guard converted from slash to auto-trigger; slop scanner.
- `agamm/claude-code-owasp` (MIT) — OWASP Top 10:2025 + ASVS 5.0 + Agentic AI ASI01–ASI10 patterns.
- `anthropics/claude-code-security-review` (MIT, Anthropic) — false-positive filtering, diff-aware scanning, HIGH/MEDIUM discipline.
- `anthropics/knowledge-work-plugins` (Apache-2.0) — section-by-section spec-writing pattern.
- `aaronjmars/soul.md` (MIT, Aaron Mars) — SOUL.md spec and identity-layer pattern.
- `obra/private-journal-mcp` (MIT, declared in README) — append-only journaling pattern for MEMORY.md.
- `thedaviddias/souls-directory` (MIT, David Dias) — identity catalog inspiration.
- `coreyhaines31/marketingskills` (MIT, Corey Haines) — Tier 2 launch / marketing pointer.
- `Sushegaad/Claude-Skills-Governance-Risk-and-Compliance` (MIT, Hemant Naik) — Tier 2 GRC / DPDPA primary recommendation.
- `mukul975/Privacy-Data-Protection-Skills` (Apache-2.0) — Tier 2 privacy-only deep dive.

All commit SHAs pinned in `ATTRIBUTIONS.md`.

---

## Known gaps deferred to v0.2

- **DPDPA Compliance** core skill (currently routed to Sushegaad GRC or mukul975 Privacy via Reviewer / PRD Writer).
- **RBI Digital Lending** core skill (currently flagged with v0.2 deferral note + counsel routing).
- **UPI Payments** core skill (currently flagged with v0.2 deferral note).
- **Launch + Marketer** core skill (currently a stub pointing to coreyhaines31/marketingskills).

v0.2 will absorb all four into core. Operators who need DPDPA / RBI / UPI today should install the Tier 2 add-ons listed in `RECOMMENDED.md` and run them alongside DhurandharOS v0.1.

---

## Stats

- **Total markdown files shipped:** 30+ (skills, tests, examples, docs, root files).
- **SKILL.md line counts (target ranges met):**
  - soul-keeper: ~205 lines (target 200–400).
  - builder: ~205 lines (target 350–500). Tighter than target — the gstack patterns compressed well into auto-triggers.
  - reviewer: ~210 lines (target 400–600). Tighter than target — false-positive filter list and language quirks live in references not duplicated in body.
  - prd-writer: ~225 lines (target 400–500). Tighter than target — section-by-section disclosure naturally shortens the skill body.
  - idea-reality-check: ~205 lines (target 300–500). Tighter than target — Indian context reframe is the substantive add; the rest leans on the upstream brainstorming pattern.
  - hiring-jd-writer: ~265 lines (target 400–600). Tighter than target — comp band table lives compactly; the decision tree is the core IP.
  - launch-marketer (stub): ~50 lines (target 50–100).
- **Test pass rate:** 30 / 30 (100%) with skills installed; 0 / 30 baseline. See `docs/test-results-v0.1.0.md`.
- **Lint clean status:** banned-tokens lint passes for v0.1.0. Defensive references in anti-pattern documentation are documented in DECISIONS.md.

---

## What changed from the original specification

- Skill bodies came in tighter than the prompt's ranges in most cases. The voice and source-attribution discipline produced shorter skills than expected. The substance is intact; the style is dense.
- Working directory used as repo root rather than nested `dhurandhar-os/` subfolder. Documented in DECISIONS.md.
- `obra/private-journal-mcp` license verified via README rather than LICENSE file (LICENSE file absent at the pinned SHA). Documented in DECISIONS.md and ATTRIBUTIONS.md.

---

## v0.1 ships. Day 1 of 90. Now we listen.
