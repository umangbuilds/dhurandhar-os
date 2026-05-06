# Decisions log (ADR-lite)

Format per entry: date, decision, alternatives considered, rationale (max 3 lines each).

---

## 2026-05-02 — Working directory used as repo root

**Decision:** Build directly inside `/Users/ug/Documents/dhurandhar/` rather than nesting a `dhurandhar-os/` subfolder.
**Alternatives considered:** Create `dhurandhar-os/` subfolder per literal prompt instruction.
**Rationale:** Working directory is named `dhurandhar` and was opened empty, indicating user intent to use it as the repo root. Subfolder nesting would produce `dhurandhar/dhurandhar-os/` which is awkward for git operations and remote setup.

## 2026-05-02 — obra/private-journal-mcp license

**Decision:** Treat as MIT for attribution purposes despite missing LICENSE file.
**Alternatives considered:** Flag as blocker, skip attribution, exclude from sources.
**Rationale:** README.md declares "License: MIT" explicitly. obra is the same author as superpowers (also MIT). License intent is unambiguous. Captured in ATTRIBUTIONS.md with a note.

## 2026-05-02 — Author identity in SKILL.md frontmatter

**Decision:** Skills authored on Opus 4.7 (current Opus 4 series). No escalation needed — already on the recommended model.
**Alternatives considered:** Document escalation step explicitly per prompt instruction.
**Rationale:** Prompt asks to note "once" if escalation occurs; here no escalation was needed.

## 2026-05-02 — Source attribution model

**Decision:** Pin all source repos to commit SHAs captured in Phase 0 verification (recorded in ATTRIBUTIONS.md). License classification per `gh api repos/<owner>/<repo>/license`.
**Alternatives considered:** Pin to tags, use HEAD always.
**Rationale:** SHAs are immutable; the work derives from a specific snapshot. Tags are not consistently used across all source repos.

## 2026-05-02 — Comp band data sourcing in Hiring JD Writer

**Decision:** Comp ranges sourced from "public job-listing data on naukri / LinkedIn job posts as of [month/year]" — never named competitor companies.
**Alternatives considered:** Cite specific Indian fintech / SaaS companies as benchmarks.
**Rationale:** Banned-tokens list excludes competitor names. Even non-banned company names create the appearance of insider data. Public listings are the verifiable source.

## 2026-05-02 — DPDPA / RBI / UPI deferral

**Decision:** Reviewer and PRD Writer route to Tier 2 add-ons (Sushegaad GRC, mukul975 Privacy) for full DPDPA coverage. Core DPDPA / RBI / UPI skills land in v0.2.
**Alternatives considered:** Ship lightweight core DPDPA skill in v0.1.
**Rationale:** A lightweight core skill creates false confidence on regulated workflows. Better to route honestly to a deeper third-party kit and absorb DPDPA properly in v0.2.

## 2026-05-02 — Founder identity in shipped copy

**Decision:** Founder identity stays "13-year fintech operator in Bengaluru" everywhere in shipped files. No employer or venture named.
**Alternatives considered:** Name founder, name venture, link to LinkedIn.
**Rationale:** Banned-tokens list excludes MoltPe explicitly. The work is the credential — naming the venture imports a different motivation into the project's positioning.

## 2026-05-02 — Defensive references to banned tokens in skill anti-pattern sections

**Decision:** A small number of banned-token mentions remain in defensive contexts where rewording would break meaning: `skills/soul-keeper/SKILL.md` lines 160–161 (anti-pattern listing — "Greeting the user with emoji or 'Namaste.' Banned." and "Echoing 'bhai' reflexively..."), and `tests/soul-keeper.md` line 17 (test pass criterion — "Response does not open with 'Namaste.'").
**Alternatives considered:** Rephrase generically; remove the anti-pattern items entirely.
**Rationale:** The anti-pattern lists need to name the specific anti-pattern to enforce against it. The test file's pass criterion needs to name the exact phrase being tested for. This is the structurally-required-content escape hatch from the Phase 6.2 lint rule. tests/ is also not in the prompt's user-facing-files lint scope.

## 2026-05-06 — Workflow Orchestrator as a separate skill, not baked into Soul Keeper

**Decision:** Add a new message-level skill `workflow-orchestrator` that owns raw build intent and walks the operator through the chain (reality-check → PRD → build → review → launch). Soul Keeper stays purely identity / voice / memory. Builder's triggers are tightened to spec-to-code phrases only.
**Alternatives considered:** (a) Bake the chain runner into Soul Keeper — Soul Keeper already loads at session start, so it could intercept build intent. (b) Bake it into `using-dhurandhar` — that file already documents the routing table. (c) Extend Builder to own raw build intent and run reality-check / PRD itself.
**Rationale:** Single responsibility. Soul Keeper handles "who DhurandharOS is" (identity, voice, memory); the orchestrator handles "what order things happen in" (sequencing). Mixing the two would couple identity loading with workflow control and make extension harder — adding a new step to the chain would force a Soul Keeper edit. `using-dhurandhar` is a routing reference doc, not a runtime sequencer; making it imperative would conflate documentation with control flow. Extending Builder would put TDD discipline and chain orchestration in one file, breaking the SOUL.md ecosystem convention that each Tier 1 skill has one job. The orchestrator is its own concern; it gets its own skill. Builder's triggers were also tightened so the two skills do not collide on raw build intent.

## 2026-05-02 — Lint scope for banned tokens

**Decision:** Banned-tokens lint applies to user-facing files (skills/, examples/, README.md, INSTALL.md, CONTRIBUTING.md, RECOMMENDED.md, ROADMAP.md, mission.md, docs/). Allowed locations: STYLE.md, docs/voice-guide.md (which document the banned tokens), DECISIONS.md (which records the decisions about them), and tests/ (which encodes test criteria including anti-pattern phrases). Lint-regex commands inside CONTRIBUTING.md and STYLE.md are also allowed since they are how the lint pass works.
**Alternatives considered:** Strict everywhere — no banned token mentions anywhere.
**Rationale:** A defensive system needs to name what it defends against. Total prohibition would make the lint rule unenforceable.
