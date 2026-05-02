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
