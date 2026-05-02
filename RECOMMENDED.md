# Recommended — Tier 2 catalog

DhurandharOS curates these. We do not ship them. Author owns the work. We point you to the right one at the right founder stage.

Each entry has:
- Repo URL + author.
- License (verified) + approximate star count (as of v0.1 release).
- One-line install command.
- A 2–3 sentence "why this skill at this stage" rationale in DhurandharOS voice.
- "SOUL.md compatible: Y/N" + integration note.
- A footer warning per entry: scan with mcp-scan or SkillCheck before installing — skills can contain hostile code.

Organised by founder stage: IDEA → BUILD → LAUNCH → SCALE → COMPLIANCE deep-dive.

---

## IDEA stage

Skills for the operator who is still validating, before code is written.

### `obra/superpowers` — brainstorming + writing-plans skills
- **Repo:** https://github.com/obra/superpowers
- **License:** MIT
- **Install:** `/plugin marketplace add obra/superpowers-marketplace && /plugin install superpowers@superpowers-marketplace`
- **Why at this stage:** DhurandharOS's `idea-reality-check` and `builder` already use superpowers' brainstorming and writing-plans patterns under the hood. Installing the full superpowers package gives you the rest — TDD-for-skills, executing-plans, dispatching-parallel-agents — for your own custom skill authoring.
- **SOUL.md compatible:** Y. Voice is engineer-direct, not Pan-Indian English; expect tone differences when superpowers triggers, but values align.
- **Scan before install.**

### `mvanhorn/last30days-skill` — research and validation
- **Repo:** referenced as a Tier 2 IDEA-stage research skill. Verify availability before installing (some experimental skills move locations).
- **License:** verify on install.
- **Why at this stage:** structured research-pattern skills help you turn customer-discovery conversations into shipped insights. Useful between the first 5 customer interviews and the locked spec.
- **SOUL.md compatible:** verify on install — voice may be US-default.
- **Scan before install.**

---

## BUILD stage

Skills for the operator with a locked spec, building.

### `anthropics/claude-code-security-review` — full security review (standalone)
- **Repo:** https://github.com/anthropics/claude-code-security-review
- **License:** MIT
- **Install:** clone and reference per the repo's README.
- **Why at this stage:** DhurandharOS's `reviewer` skill uses this pattern internally. Installing the full Anthropic security review gives you the GitHub Action wrapping and PR-comment integration if you want CI-level enforcement.
- **SOUL.md compatible:** Y. Voice is technical-direct, aligns with reviewer voice.
- **Scan before install.**

### `obra/superpowers-developing-for-claude-code`
- **Repo:** https://github.com/obra/superpowers-marketplace (specifically the `superpowers-developing-for-claude-code` plugin within the marketplace).
- **License:** MIT.
- **Install:** `/plugin install superpowers-developing-for-claude-code@superpowers-marketplace`
- **Why at this stage:** Anthropic's 42 official Claude Code docs in one place plus skill-authoring patterns. Essential for operators authoring custom skills on top of DhurandharOS.
- **SOUL.md compatible:** Y. Reference, not voice.
- **Scan before install.**

### `anthropics/knowledge-work-plugins` — engineering plugin (spec-writing, etc.)
- **Repo:** https://github.com/anthropics/knowledge-work-plugins
- **License:** Apache-2.0
- **Install:** clone and reference per README.
- **Why at this stage:** DhurandharOS's `prd-writer` adapts patterns from this plugin's spec-writing skill. Installing the full plugin gives you adjacent knowledge-work skills (research synthesis, document generation) that complement PRD Writer.
- **SOUL.md compatible:** Y mostly, US-default frames in some skills.
- **Scan before install.**

### `agamm/claude-code-owasp` — OWASP-only standalone
- **Repo:** https://github.com/agamm/claude-code-owasp
- **License:** MIT
- **Install:** clone per repo README.
- **Why at this stage:** DhurandharOS's `reviewer` skill uses this internally. Standalone install useful if you want OWASP-only without DhurandharOS's filtering layer.
- **SOUL.md compatible:** Y. Engineer-direct voice.
- **Scan before install.**

---

## LAUNCH stage

Skills for the operator with a working product, ready to launch.

### `coreyhaines31/marketingskills`
- **Repo:** https://github.com/coreyhaines31/marketingskills
- **License:** MIT
- **Copyright:** Copyright (c) 2025 Corey Haines
- **Install:** clone per repo README.
- **Why at this stage:** broad coverage of positioning, channels, content, and growth experiments. DhurandharOS's `launch-marketer` is a v0.2 stub; for v0.1 launch / marketing work, this is the recommended kit.
- **SOUL.md compatible:** partially — voice is US-default-discursive, not Pan-Indian English. Useful for frameworks and tactics; supplement with your own Indian-context adaptation. v0.2 will absorb a curated subset into a DhurandharOS-voiced core skill.
- **Scan before install.**

### `AgriciDaniel/claude-seo`
- **Repo:** referenced as a Tier 2 LAUNCH-stage SEO skill. Verify availability before installing.
- **License:** verify on install.
- **Why at this stage:** if your launch motion is SEO-led (content → search → conversion), structured SEO skills compound over months.
- **SOUL.md compatible:** verify on install.
- **Scan before install.**

---

## SCALE stage

Skills for the operator past first customers, scaling operations.

### `founderjourney/claude-skills` — saas-financial-projections
- **Repo:** referenced as a Tier 2 SCALE-stage finance skill. Verify availability before installing.
- **License:** verify on install.
- **Why at this stage:** SaaS financial projections (CAC payback, LTV, runway, scenario modelling) are the language of post-PMF conversations with customers, hires, and (if needed) investors.
- **SOUL.md compatible:** verify on install — likely US-default frames around fundraising; useful for the math, less for the framing.
- **Scan before install.**

### `obra/private-journal-mcp` (standalone)
- **Repo:** https://github.com/obra/private-journal-mcp
- **License:** MIT (declared in README; LICENSE file absent — see DECISIONS.md)
- **Install:** clone per repo README.
- **Why at this stage:** DhurandharOS's `soul-keeper` uses the journaling pattern from this MCP under the hood. Standalone install gives you a richer journaling MCP for personal / operational logs separate from MEMORY.md.
- **SOUL.md compatible:** Y. Reference, not voice.
- **Scan before install.**

### `adagradschool/cc-gtd`
- **Repo:** referenced as a Tier 2 SCALE-stage productivity skill (Getting Things Done methodology). Verify availability before installing.
- **License:** verify on install.
- **Why at this stage:** GTD-style task and project management embedded in Claude Code. Useful for operators juggling product / hiring / customers / compliance simultaneously.
- **SOUL.md compatible:** Y. GTD is method-neutral.
- **Scan before install.**

---

## COMPLIANCE deep-dive

This is where DhurandharOS routes for DPDPA, GDPR, ISO 27001, SOC 2, HIPAA, and broader privacy / governance work. v0.1 does not ship a core compliance skill — we curate the best third-party options.

### `Sushegaad/Claude-Skills-Governance-Risk-and-Compliance` — primary recommendation
- **Repo:** https://github.com/Sushegaad/Claude-Skills-Governance-Risk-and-Compliance
- **License:** MIT
- **Copyright:** Copyright (c) 2026 Hemant Naik
- **Install:** clone per repo README.
- **Why at this stage:** broadest GRC coverage — DPDPA, GDPR, ISO 27001, SOC 2, HIPAA, and others. Primary recommendation if you need DPDPA + adjacent compliance work today.
- **SOUL.md compatible:** Y mostly; voice is regulatory-direct.
- **Note:** DPDPA module status is fluid — was advertised, briefly absent from main; verify the module is present at the pinned SHA when you install.
- **Scan before install.**

### `mukul975/Privacy-Data-Protection-Skills` — privacy-only deep dive
- **Repo:** https://github.com/mukul975/Privacy-Data-Protection-Skills
- **License:** Apache-2.0
- **Install:** clone per repo README.
- **Why at this stage:** 282+ privacy-focused skills with DPDP Act coverage. Backup recommendation if you need privacy-only depth without the broader GRC scope.
- **SOUL.md compatible:** Y mostly; expect US-default examples in some skills.
- **Scan before install.**

**v0.1 stance on DPDPA / RBI / UPI:**
> DhurandharOS does not ship a DPDPA core skill, an RBI Digital Lending core skill, or a UPI Payments core skill in v0.1. We curate the best third-party options. Pick Sushegaad if you also need ISO 27001 / SOC 2; pick mukul975 if pure privacy. v0.2 will absorb DPDPA, RBI Digital Lending, and UPI Payments into core, voiced in DhurandharOS register.

---

## DhurandharOS curates these. We don't ship them. Author owns the work.

We point you to the right one at the right stage. v0.2 will absorb DPDPA, RBI Digital Lending, and UPI Payments into core. Until then, install honestly and scan everything.
