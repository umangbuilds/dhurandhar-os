# Sample JD output — SDE-2 lateral, Bengaluru fintech backend

This is a sample output from the `hiring-jd-writer` skill. It demonstrates comp band cited from public listing data (no specific competitor company names), the ESOP §17(2)(vi) tax note, the FEMA flag (when applicable), and the college-bias guardrail.

The intake answers used for this sample:
- Level: SDE-2 (IC2-IC3 boundary).
- Type: full-time employee.
- Location: Bengaluru, hybrid.
- College preference: no bias, CS fundamentals strong.
- ESOP: yes, 0.05% grant.
- FEMA-resident: candidate is Indian resident (no FEMA implications for this sample; alternate version with foreign-resident flag at the end).

---

## Job description

### Title
SDE-2, Fintech Backend, Bengaluru (Hybrid)

### Level
IC2 / IC3 — 3 to 6 years of experience.

### Location
Bengaluru, hybrid. 2 days in-office (Tuesday + Thursday), 3 days remote.

### What you'll do
- Design and ship payment-aggregator integrations end-to-end, from spec to settlement-reconciliation runbook.
- Own the disbursement webhook handler — idempotency, retry queue, signature verification, alerting on failure.
- Partner with product on PRD reviews; flag failure modes and money-flow gaps before specs lock.
- Take diff reviews seriously — adversarial pass before merge, not just style nits.
- Mentor IC1s on TDD discipline; reviewer pass before any merge to main.

### Must-haves
- 3+ years building production backend systems handling money flows.
- CS fundamentals strong; system-design at IC2 level (sketch a payment ledger schema and reconciliation strategy in a 45-minute interview).
- Proficiency in Python or Go; comfortable shipping SQL migrations safely (zero-downtime, reversible).
- Has shipped at least one webhook-driven integration with a third party in production. Knows what idempotency means and why it matters.
- Comfortable with on-call rotation for critical-path systems.

### Nice-to-haves
- Prior experience with payment aggregators in India (any specific PSP — we'll evaluate the depth, not the brand).
- Familiarity with Indian regulatory environment for fintech (RBI Digital Lending Guidelines, NPCI specifications). v0.2-stage operators ramping into this — fine.
- Open-source contributions to skill packages, CLI tools, or developer infrastructure.
- Experience with Claude Code, or willingness to adopt as the primary execution layer (the team uses it).

### What we offer

**Comp band:** 22–28 LPA fixed + 10% variable + 0.05% ESOP grant.

- **Fixed:** based on public job-listing data (naukri / LinkedIn job posts as of v0.1 release) for Bengaluru fintech SDE-2 lateral hires. Final offer based on candidate experience, system-design depth, and reference checks.
- **Variable:** 10% of fixed, tied to quarterly OKR completion. Reviewed twice yearly.
- **ESOP:** 0.05% of fully-diluted equity, vesting 4 years with 1-year cliff. Exercise price set per latest 409A valuation. **Perquisite tax under Section 17(2)(vi) of the Income Tax Act applies at exercise** — please consult a CA before exercising. We will share the latest 409A details with shortlisted candidates.

**Benefits:**
- Group health insurance (₹5L sum insured for self + spouse + 2 children).
- Annual leave: 12 casual + 12 sick + 12 earned per calendar year.
- Probation: 6 months from joining date.
- Provident Fund (EPFO) per statutory requirements.
- Hybrid setup; office is in Indiranagar, Bengaluru.

### Hiring loop
1. **Recruiter screen** — 30 min. Background, motivation, comp expectations.
2. **Tech screen** — 60 min. Live system-design discussion (e.g., design a settlement reconciliation system).
3. **Onsite (or virtual onsite)** — 4 rounds of 60 min:
   - Coding (problem-solving, no leetcode-grinding traps).
   - System design (deeper than tech screen).
   - Engineering values discussion (TDD, code review, on-call culture).
   - Hiring manager round (technical + role fit).
4. **Reference checks** — 2 references provided by candidate.
5. **Offer.**

We aim to close in 2 weeks from first conversation. We tell candidates yes or no within 48 hours of the final round.

### About the team
You'd join a 6-person engineering team — 4 SDEs, 1 SRE, 1 EM. We ship every week. We use TDD on every feature. We don't ship vibe-coded patches. The founder is non-technical and trusts engineering judgement.

### Compliance footer
- **PF / EPFO:** mandatory. Default: enrolled.
- **Shops & Establishments:** registered under Karnataka Shops & Establishments Act.
- **Gratuity:** statutory after 5 years per Payment of Gratuity Act 1972.
- **POSH:** Internal Complaints Committee constituted (mandatory at our headcount); annual training included in onboarding.

---

### Apply

Email: hiring@<company-domain> with resume + a 1-paragraph note on a system you shipped that you'd build differently today, and why.

We do not require a cover letter. We do not require Tier 1 college credentials. We require sharp thinking and the discipline to ship.

---

## Hiring JD Writer notes (these would NOT appear in the public JD)

- **College filter:** the operator initially asked for "Tier 1 only." Hiring JD Writer flagged this as a legal-risk filter and proposed "no bias, CS fundamentals strong" as the substantive alternative. Operator accepted. Documented in the project's `risk-notes.md`.
- **Comp band sourcing:** "public job-listing data on naukri / LinkedIn job posts as of v0.1 release." No specific competitor company named. Operator confirmed the band is within budget.
- **ESOP source:** 0.05% is mid-range for SDE-2 at this round size (Series A equivalent). 409A reference will be shared with shortlisted candidates.

---

## Alternate version — foreign-resident candidate (FEMA flag)

If the candidate is OCI / NRI / resident-abroad, the JD adds a footer note in the offer:

> **FEMA flag.** ESOP grant to a non-resident is subject to FEMA-1999 reporting requirements. Company will file the required ODI / Form ODA reports with the Authorised Dealer (bank) within 30 days of grant. Candidate is advised to consult a CA familiar with FEMA implications and Liberalised Remittance Scheme limits before exercising. Tax treatment in candidate's country of residence is candidate's responsibility.

The Hiring JD Writer never issues a foreign-resident ESOP offer template without this flag.

---

**Note on banned tokens:** this JD names no specific competitor company. References to "fintech backend" and "payment aggregator" are generic. Comp band sourced from "public job-listing data on naukri / LinkedIn." When the operator runs interviews, the specific PSP / aggregator a candidate has integrated with may come up — that's intel, not benchmark, and it doesn't change the comp band.
