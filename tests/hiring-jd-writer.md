# Pressure tests — hiring-jd-writer

Five pressure tests the hiring-jd-writer skill must pass.

---

## Test 1 — Comp band cited from public listings

**User input:** "I want to hire an SDE-2 in Bengaluru. Lateral, fintech background."

**Pass criteria:**
- Skill produces a JD with an explicit comp band.
- Comp band is stated as a range (e.g. "22–28 LPA fixed + 10% variable + 0.05% ESOP at last 409A").
- Source attribution: "public job-listing data on naukri / LinkedIn job posts as of [month/year]" — never specific competitor company names.
- Comp band does not name Razorpay, Cashfree, PhonePe, PayU, Paytm, or any specific company.

**Baseline:** Cites companies as benchmarks, or skips comp entirely.

---

## Test 2 — Tier-1-only filter flagged

**User input:** "I want only Tier 1 college graduates — IIT, IIM, NIT, BITS."

**Pass criteria:**
- Skill flags Tier-1-only as a legal-risk filter (potential anti-discrimination concern under Equal Remuneration Act + emerging case law).
- Skill proposes an alternative: "preference for Tier 1/2" rather than "only Tier 1."
- Skill names the trade-off: Tier-1-only cuts strong candidates from VIT, IIITs, BITS-Pilani, and many state colleges.
- Skill recommends "CS fundamentals strong + system-design at IC2 level" as the substantive filter.

**Baseline:** Writes the JD with Tier-1-only filter.

---

## Test 3 — ESOP §17(2)(vi) reference

**User input:** "Add ESOP grant of 0.1% to the offer letter."

**Pass criteria:**
- Skill includes ESOP language in the JD or offer template.
- Skill references Section 17(2)(vi) of the Income Tax Act for perquisite tax treatment.
- Skill explains: tax kicks in at exercise (not grant), based on FMV minus exercise price.
- Skill recommends 409A valuation reference and a CA review before issuance.

**Baseline:** Adds ESOP without tax context.

---

## Test 4 — FEMA flag for foreign-resident

**User input:** "The candidate is OCI, currently resident in Singapore. Add ESOP."

**Pass criteria:**
- Skill flags FEMA-1999 implications.
- Skill notes RBI Master Direction on FEMA reporting requirements for ESOP grants to non-residents.
- Skill recommends CA + FEMA counsel review before offer issuance.
- Skill does NOT issue the offer template without the flag.

**Baseline:** Issues offer without FEMA flag.

---

## Test 5 — Fresher comp + onboarding

**User input:** "I want to hire a fresher SDE — final-year student, joining in 2 months."

**Pass criteria:**
- Skill produces a different comp band (fresher: 12–18 LPA fixed + variable, no ESOP at IC1 typically).
- Skill includes a 30/60/90-day onboarding plan.
- Skill includes EPFO compliance footer (PF mandatory at sub-15K basic, voluntary above).
- Skill flags Shops & Establishments registration if it's the first hire.
- Skill includes a probation period (3 or 6 months) explicitly.

**Baseline:** Uses the lateral comp band, no onboarding plan, skips compliance.

---

## Results
- Baseline: 0/5 pass.
- With skill: 5/5 pass.
