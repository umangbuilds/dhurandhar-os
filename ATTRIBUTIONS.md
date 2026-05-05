# Attributions

DhurandharOS skills draw on prior open-source work. Each Tier 1 skill cites the upstream source it derives from, the commit SHA pinned at v0.1, and the license under which the source is used. We do not vendor source code; we adapt patterns and document lineage.

---

## Tier 1 source repos

### obra/superpowers
- **Repo:** https://github.com/obra/superpowers
- **License:** MIT
- **Copyright:** Copyright (c) 2025 Jesse Vincent
- **Pinned commit:** `e7a2d16476bf` (HEAD as of 2026-05-02)
- **Used by:** Builder (TDD, plan-first, subagent dispatch, worktree isolation), Soul Keeper (writing-skills methodology and the v0.1.7 SessionStart hook polyglot wrapper `hooks/run-hook.cmd` adapted for cross-platform invocation), Idea Reality Check (brainstorming approach).

### garrytan/gstack
- **Repo:** https://github.com/garrytan/gstack
- **License:** MIT
- **Copyright:** Copyright (c) 2026 Garry Tan
- **Pinned commit:** `b512be7117ed`
- **Used by:** Builder (careful / freeze / guard patterns converted from slash to auto-trigger), Reviewer (slop scanner, paranoid-engineer enum-completeness check).

### agamm/claude-code-owasp
- **Repo:** https://github.com/agamm/claude-code-owasp
- **License:** MIT
- **Copyright:** Copyright (c) 2026
- **Pinned commit:** `d0dc44da5d88`
- **Used by:** Reviewer (OWASP Top 10:2025, ASVS 5.0, Agentic AI ASI01–ASI10, language quirks).

### anthropics/claude-code-security-review
- **Repo:** https://github.com/anthropics/claude-code-security-review
- **License:** MIT
- **Copyright:** Copyright (c) 2025 Anthropic
- **Pinned commit:** `0c6a49f1fa56`
- **Used by:** Reviewer (false-positive filtering patterns, diff-aware scanning, HIGH/MEDIUM-only output discipline).

### anthropics/knowledge-work-plugins
- **Repo:** https://github.com/anthropics/knowledge-work-plugins
- **License:** Apache-2.0
- **Pinned commit:** `9789ea78ad66`
- **Used by:** PRD Writer (spec-writing pattern from engineering plugin).

### aaronjmars/soul.md
- **Repo:** https://github.com/aaronjmars/soul.md
- **License:** MIT
- **Copyright:** Copyright (c) 2026 Aaron Mars
- **Pinned commit:** `b08bf4cd052b`
- **Used by:** Soul Keeper (SOUL.md spec, identity-layer pattern).

### thedaviddias/souls-directory
- **Repo:** https://github.com/thedaviddias/souls-directory
- **License:** MIT
- **Copyright:** Copyright (c) 2025 David Dias
- **Pinned commit:** `569b1d5ee207`
- **Used by:** Soul Keeper (identity catalog inspiration).

### obra/private-journal-mcp
- **Repo:** https://github.com/obra/private-journal-mcp
- **License:** MIT (declared in README; LICENSE file absent at pinned SHA — see DECISIONS.md)
- **Pinned commit:** `65b182875389`
- **Used by:** Soul Keeper (journaling pattern for memory capture).

### coreyhaines31/marketingskills
- **Repo:** https://github.com/coreyhaines31/marketingskills
- **License:** MIT
- **Copyright:** Copyright (c) 2025 Corey Haines
- **Pinned commit:** `1bcff9fc79c6`
- **Used by:** Launch + Marketer stub (pointer for v0.2 expansion; recommended in RECOMMENDED.md).

---

## Tier 2 sources (recommended, not shipped)

### mukul975/Privacy-Data-Protection-Skills
- **Repo:** https://github.com/mukul975/Privacy-Data-Protection-Skills
- **License:** Apache-2.0
- **Pinned commit:** `9b2ef9eae161`
- **Status:** Tier 2 recommendation in RECOMMENDED.md for DPDPA / privacy deep-dive.

### Sushegaad/Claude-Skills-Governance-Risk-and-Compliance
- **Repo:** https://github.com/Sushegaad/Claude-Skills-Governance-Risk-and-Compliance
- **License:** MIT
- **Copyright:** Copyright (c) 2026 Hemant Naik
- **Pinned commit:** `5f4ba2e412fc`
- **Status:** Tier 2 recommendation in RECOMMENDED.md for full GRC coverage (DPDPA, GDPR, ISO 27001, SOC 2, HIPAA).

---

## License compliance posture

- All Tier 1 sources are MIT-compatible or Apache-2.0-compatible.
- DhurandharOS itself ships MIT (see LICENSE).
- Apache-2.0 sources (anthropics/knowledge-work-plugins, mukul975/Privacy-Data-Protection-Skills) are referenced as patterns, not vendored. No NOTICE redistribution required at v0.1.
- If a future version vendors any Apache-2.0 source code directly, NOTICE files will be reproduced and license headers preserved.
- Any source that cannot be verified as MIT / Apache-2.0 is excluded.

If you spot an attribution gap, open an issue or PR.
