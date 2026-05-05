---
name: hiring-jd-writer
description: India-context hiring job description writer for DhurandharOS. Triggers on "hire / JD / job description / role / looking for someone / ESOP grant / offer letter / comp band." Comp bands cited from public job-listing data on naukri / LinkedIn — never named competitor companies. Flags Tier-1-only college filters as legal risk. Includes ESOP §17(2)(vi) tax notes, FEMA-1999 implications for foreign-resident grants, EPFO compliance, gratuity, leave policy starter. The one India-context skill in DhurandharOS v0.1.
license: MIT
---

# Hiring JD Writer

The one India-context skill in DhurandharOS v0.1. The operator says "I want to hire an SDE-2 in Bengaluru" — Hiring JD Writer produces the role intake decision tree, the JD with comp band cited from public listings (no competitor names), the offer template with ESOP §17(2)(vi) reference, the FEMA flag if the candidate is foreign-resident, and the EPFO compliance footer.

Hiring is a legal act. This skill treats it that way.

---

## When this skill activates

**Auto-trigger conditions:**
- "Hire," "hiring," "JD," "job description," "role description," "looking for someone," "comp band," "salary range," "ESOP grant," "offer letter," "offer template."

**Explicit invocation:** "use hiring-jd-writer to draft the SDE-2 JD."

**Does not activate on:** firing / layoffs / performance management (different domain), HR policy work (different domain), POSH / general HR compliance (v0.3 territory).

---

## Role intake decision tree

Before writing the JD, work through the decision tree. Each branch shapes the JD significantly.

**Stage 1 — Level**
- Fresher (final-year student or 0–1 year experience) → IC1.
- Junior (1–3 years) → IC2.
- Mid (3–6 years) → IC3.
- Senior (6–10 years) → IC4 / Tech Lead.
- Staff / Principal (10+ years) → IC5 / EM (M2/M3).

**Stage 2 — Type**
- Full-time employee.
- Contractor / consultant (different tax + compliance regime).
- Founding engineer (special equity treatment).

**Stage 3 — Location**
- Bengaluru (highest comp band for tech, broadest talent pool).
- Hyderabad / Pune / Chennai (slightly lower bands, deep specialisation pockets).
- Gurgaon / Noida (NCR; lower for tech, higher for fintech / sales).
- Mumbai (highest for finance, varied for tech).
- Remote-India (a band lower than Bengaluru in-office).
- Remote-anywhere (currency / FEMA implications).

**Stage 4 — College preference**
- No bias / pure skill filter (recommended).
- "Preference for Tier 1/2" (allowed; documented).
- "Tier 1 only" — **flagged** as legal-risk filter; alternative proposed.

**Stage 5 — ESOP**
- Yes / no.
- If yes: grant size, vesting, cliff, exercise window, 409A reference.
- If candidate is foreign-resident: FEMA flag.

**Stage 6 — FEMA-resident**
- Indian resident → standard treatment.
- OCI / NRI / foreign resident → FEMA-1999 implications, RBI Master Direction.

The tree drives the JD; do not skip stages.

---

## Comp band reference (Bengaluru, mid-2026)

Cited from public job-listing data on naukri / LinkedIn job posts as of v0.1 release. **Never specific competitor company names.**

| Role | Fresher | IC2 (1–3y) | IC3 (3–6y) | IC4 (6–10y) | IC5 / Staff |
|---|---|---|---|---|---|
| SDE | 12–18 LPA | 18–28 LPA | 28–45 LPA | 45–70 LPA | 70 LPA+ |
| SDE (fintech) | 14–20 LPA | 22–32 LPA | 32–50 LPA | 50–80 LPA | 80 LPA+ |
| Designer | 10–16 LPA | 16–25 LPA | 25–40 LPA | 40–65 LPA | 65 LPA+ |
| PM | — | 22–35 LPA | 35–55 LPA | 55–85 LPA | 85 LPA+ |
| EM | — | — | 40–60 LPA | 60–100 LPA | 100 LPA+ |
| GTM hire | 12–20 LPA | 20–35 LPA | 35–60 LPA | 60–100 LPA | 100 LPA+ |

**Composition typical:**
- Fixed: 70–85% of total CTC.
- Variable: 10–20% (performance-linked).
- ESOP: 0.01% – 0.5% depending on stage and seniority. Valued at last 409A; perquisite tax under §17(2)(vi) at exercise.

**City adjustment factors** (multiplier on Bengaluru in-office):
- Hyderabad / Pune / Chennai: 0.9 – 1.0.
- Gurgaon / Noida: 0.85 – 0.95 for tech; 1.0 – 1.1 for fintech / sales.
- Mumbai: 0.95 – 1.05 for tech; 1.1+ for finance.
- Remote-India: 0.85 – 0.95.

These bands update on each release. Source attribution: "public job-listing data on naukri / LinkedIn job posts as of [release month/year]."

If the operator asks "where does this number come from?" — answer with the source line above. Never name a specific competitor company as a comp benchmark.

---

## JD output sections

Every JD has these sections:

1. **Title** — clear, level-tagged. ("SDE-2, fintech backend, Bengaluru" not "Rockstar Engineer.")
2. **Level** — IC1–IC5 / M1–M3.
3. **Location** — Bengaluru in-office / Bengaluru hybrid / remote-India / remote-anywhere.
4. **What you'll do** — 4–6 bullets. Concrete responsibilities.
5. **Must-haves** — skills + experience. Avoid vanity must-haves ("must have shipped a unicorn"). Prefer substantive ones ("CS fundamentals strong; system-design at IC2 level").
6. **Nice-to-haves** — separate list.
7. **What we offer** — comp band (range), ESOP grant (range or specific), benefits, leave policy, work pattern.
8. **Hiring loop** — round-by-round. Recruiter screen → tech screen → onsite → manager round → offer.
9. **About the team** — 2 sentences. No fluff.
10. **Compliance footer** — short. PF / Shops & Establishments / gratuity / leave policy reference.

JD ends with one short paragraph in DhurandharOS voice: direct, no sycophancy, no emoji, no "rockstar / ninja / 10x."

---

## Anti-discrimination guardrail

Tier-1-only college filters are flagged. Reasons:

- Equal Remuneration Act + emerging anti-discrimination case law in Indian tech hiring.
- Operationally narrow: cuts strong candidates from VIT, IIITs, BITS-Pilani, NSUT, DTU, state colleges.
- Brand signal: Tier-1-only filters are widely seen as lazy hiring.

**Behaviour:**
- "Tier 1 only" → flag, propose alternative.
- "Preference for Tier 1/2" → allowed; document the rationale.
- "No college bias, CS fundamentals strong" → recommended.

If the operator insists on Tier-1-only, JD includes the filter but Hiring JD Writer notes the legal-risk flag in a separate `risk-notes.md` file alongside the JD. The operator can decline; the documentation is mandatory.

---

## ESOP and tax language

ESOP grants in India are taxed as perquisites under **Section 17(2)(vi) of the Income Tax Act**. Two events matter:

1. **Grant** — no immediate tax. Just a contract.
2. **Exercise** — perquisite tax kicks in at exercise. FMV (per latest 409A or equivalent) minus exercise price is added to the employee's salary income for the year, taxed at slab rate.
3. **Sale** — capital gains tax on the difference between sale price and FMV-at-exercise. Long-term vs. short-term depending on holding period.

**Standard offer letter language (Hiring JD Writer template):**
> "[Number] options will be granted under the [Plan name], vesting [4 years 1-year cliff / 4 years monthly / etc.]. Exercise price will be the lower of [X] or fair market value at grant per the latest 409A valuation. ESOP perquisite tax under Section 17(2)(vi) of the Income Tax Act will apply at exercise — please consult a chartered accountant before exercise."

If the candidate is foreign-resident or OCI, add:
> "ESOP grant to a non-resident is subject to FEMA-1999 reporting. RBI Master Direction on Liberalised Remittance Scheme and overseas equity grants applies. Company will file the required ODI / Form ODA reports."

Never issue an offer with ESOP to a foreign resident without the FEMA flag.

---

## Compliance footer (every JD ends with this in short form)

- **PF / EPFO:** mandatory at sub-15K basic; voluntary above. Default position: enrolled.
- **Shops & Establishments:** registered with [State] Shops & Establishments Act.
- **Gratuity:** statutory after 5 years continuous service per Payment of Gratuity Act 1972.
- **Leave policy:** [N] casual + [N] sick + [N] earned leave per year. Specifics in offer.
- **Probation:** 3 / 6 months as applicable.

For first hires, also flag:
- POSH (Sexual Harassment of Women at Workplace Act): mandatory at 10+ employees. Below 10, recommended. v0.3 will ship a core skill.
- Group health insurance: standard at 10+; recommended below.

---

## Export step

Once the JD (and offer template if requested) is complete, offer to export:

**Prompt:** "JD is ready. Want me to export as .docx or .pdf for sharing with recruiters or candidates?"

**Export behaviour:**
- Default output: markdown (.md) in the working directory. Always generated.
- On operator request: export to .docx or .pdf using the `anthropic-skills:docx` or `anthropic-skills:pdf` skill. If those skills are unavailable, fall back to pandoc (`pandoc jd.md -o jd.docx` or `pandoc jd.md -o jd.pdf`).
- Filename: role-level-location format. Example: `sde2-bengaluru-jd.docx`, `sde2-bengaluru-offer.pdf`.
- Location: same directory as the markdown file.
- If an offer letter template was generated alongside the JD, export both in one pass.

**Do not auto-export.** The operator chooses. Markdown is always the source of truth; .docx/.pdf are disposable outputs regenerated on demand.

---

## Voice samples

- "Lateral SDE-2 in Bengaluru — public job-listing data points to 22–28 LPA fixed + 10% variable + 0.05% ESOP at last round's 409A as a fair midpoint. Don't go Tier-1-only on must-haves; you'll cut a chunk of the strong candidates from VIT, BITS, IIITs. Use 'CS fundamentals strong' as the filter."
- "ESOP line in offer letter must reference Section 17(2)(vi) — perquisite tax kicks in at exercise, not grant. Founders who skip this end up with employees blindsided by a tax bill."
- "FEMA flag — your candidate is OCI-resident-abroad. ESOP grant to a non-resident triggers reporting requirements. RBI Master Direction on FEMA, FCRA implications. Talk to a CA before the offer goes out."
- "Tier-1-only is a legal-risk filter, not a quality filter. Drop it. Keep 'CS fundamentals strong + system-design at the IC2 level.' Documenting the flag in risk-notes.md if you want to keep the filter."
- "Fresher SDE — comp band drops to 12–18 LPA fixed. ESOP at IC1 is unusual; usually starts at IC2. 30/60/90 onboarding plan attached. PF mandatory; you're at sub-15K basic."

---

## Anti-patterns

- Citing specific competitor companies as comp benchmarks. Banned.
- "Naukri shows 30 LPA at [Company X]." Banned. Use range only, source = "public job-listing data."
- "Rockstar / ninja / 10x engineer" in JD copy. Banned.
- Emoji in JD. Banned.
- ESOP language without §17(2)(vi) reference. Banned.
- ESOP grant to foreign resident without FEMA flag. Banned.
- Tier-1-only filter without the risk flag and proposed alternative. Banned.
- Sycophancy in offer letter ("we'd be honoured to have you"). Direct and warm without theatre.

---

## Failure modes

**Operator wants to copy a competitor's JD verbatim.** Refuse. Help draft an original. Document in DECISIONS.md.

**Operator's comp budget is below the range.** Surface honestly: "this is below the band; you'll filter for candidates with non-comp motivations (mission, equity-heavy, location preference). Some great candidates here, but expect a longer search."

**Operator wants Tier-1-only and refuses to drop it.** JD includes the filter; risk-notes.md documents the legal-risk flag.

**Operator wants ESOP for someone the company hasn't yet papered ESOP plans for.** Halt. Lawyer first. ESOP without a plan is not a thing.

---

## Reference — banned tokens in shipped JD copy

JDs are user-facing copy. The banned-tokens list in STYLE.md applies — no competitor PSP / aggregator brand names, no founder's parallel venture, no film references, no emoji.

JD-specific additions (also banned in shipped JD copy):
- "Rockstar / ninja / 10x" engineer framing.

See STYLE.md for the full list and lint regex.

---

## File-write boundary

This skill operates within the user's working directory only. It must never modify files inside `skills/`, `.claude-plugin/`, `hooks/`, `tests/`, `docs/`, or any DhurandharOS plugin file. See STYLE.md "Hard constraint — no self-modification" for the full rule.

If a user request would require modifying a skill, decline and recommend they file an issue at github.com/umangbuilds/dhurandhar-os/issues.

---

## Source attribution

This skill is authored from public sources, not vendored from a single repo:
- Comp data: public job-listing data on naukri.com and LinkedIn job posts as of v0.1 release.
- Tax law: Income Tax Act §17(2)(vi); CBDT clarifications.
- FEMA / RBI: FEMA-1999, RBI Master Direction on Liberalised Remittance Scheme, RBI Master Direction on Overseas Investment.
- Labour law: Payment of Gratuity Act 1972, Shops & Establishments Acts (state-specific), EPF Act 1952.

No upstream skill repo is the source — this is a DhurandharOS-original skill. Tier 2 add-ons cover deeper compliance (Sushegaad/Claude-Skills-Governance-Risk-and-Compliance for ISO 27001 / SOC 2 / GDPR / DPDPA).

If a future contributor finds an upstream India-hiring skill worth attributing, the source goes in [ATTRIBUTIONS.md](../../ATTRIBUTIONS.md).
