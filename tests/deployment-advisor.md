# Tests — Deployment Advisor

Six pressure tests for `deployment-advisor`. 5 of 6 must pass for release.

---

## Test 1 — Default non-regulated path

**User input:** "I'm building a SaaS tool for freelancer invoices. Where should I host it?"

**Expected behaviour:**
- Recommends Vercel (frontend) + Supabase (Mumbai or Singapore region) as the stack.
- Mentions free tier capacity.
- Does NOT mention any PSP or payment gateway (not asked).
- Does NOT recommend AWS for a non-regulated invoice SaaS day-1.
- Surfaces credits question non-blocking.
- Voice: direct, no hype.

**Pass criteria:**
- [ ] Vercel + Supabase recommended.
- [ ] No PSP brand names mentioned (not asked).
- [ ] Credits question present.
- [ ] AWS not recommended as primary.

---

## Test 2 — Fintech regulated path

**User input:** "I'm building a lending product for Tier 3 cities. EMIs, KYC, bureau pulls. What infra?"

**Expected behaviour:**
- Identifies regulated fintech correctly.
- Recommends Supabase for pre-revenue phase.
- States explicit migration triggers: first 10 paying users, RBI Sandbox, regulated partner, real KYC flows.
- Recommends AWS Mumbai (`ap-south-1`) for production.
- Surfaces credits question non-blocking.
- Does NOT recommend AWS from day-1 without noting pre-revenue Supabase phase.

**Pass criteria:**
- [ ] Regulated path identified.
- [ ] Supabase pre-revenue + AWS Mumbai production.
- [ ] At least 2 of 4 migration triggers named explicitly.
- [ ] Credits question present.

---

## Test 3 — Explicit PSP question

**User input:** "Which payment gateway should I use for my marketplace?"

**Expected behaviour:**
- Answers with the full PSP landscape: Razorpay, Cashfree, PhonePe Business, PayU, Stripe.
- Notes settlement timing differences (T+1 vs T+3).
- Points to RBI PA registry for verification.
- Notes UPI Collect deprecation (28 Feb 2026) if relevant to marketplace context.
- Does NOT refuse to answer or give a generic "consult a CA."

**Pass criteria:**
- [ ] At least 3 PSPs named with distinguishing notes.
- [ ] RBI PA registry mentioned.
- [ ] Settlement timing mentioned.
- [ ] No "I can't recommend PSPs" refusal.

---

## Test 4 — Ambiguous regulated check

**User input:** "I'm building a marketplace where sellers can receive money and buyers pay upfront."

**Expected behaviour:**
- Identifies money flow (payment aggregation) — potentially regulated activity.
- Asks at most ONE clarifying question to determine if this is a regulated PA activity or a standard checkout flow.
- Does NOT launch into a 10-question intake.
- After clarification, routes to Path A (if standard checkout) or Path B (if PA licensing required).

**Pass criteria:**
- [ ] Regulated ambiguity flagged.
- [ ] Maximum one clarifying question before routing.
- [ ] Does not refuse to proceed.

---

## Test 5 — User volunteers no credits

**User input:** "I'm building a lending product. No, we don't have any startup credits."

**Expected behaviour:**
- Acknowledges no credits.
- Continues with AWS Mumbai as default for Path B production.
- Mentions AWS Activate as self-service option ("activate.aws.com, takes a week") — not a blocker.
- Does not keep asking about credits.

**Pass criteria:**
- [ ] AWS Mumbai still recommended despite no credits.
- [ ] AWS Activate mentioned as accessible self-service option.
- [ ] Conversation moves forward after the no-credits note.

---

## Test 6 — User volunteers GCP credits

**User input:** "I have $100K in GCP credits from Google for Startups. Building a lending product."

**Expected behaviour:**
- Pivots recommendation to GCP Mumbai (`asia-south1`) instead of AWS Mumbai for Path B production.
- Notes GCP Mumbai region has good Indian data residency posture.
- Keeps the pre-revenue Supabase phase (GCP credits don't change pre-revenue advice).
- Names equivalent GCP services: Cloud Run or GKE, Cloud SQL (Postgres), GCS, Firebase Auth or Cloud Identity.

**Pass criteria:**
- [ ] GCP Mumbai recommended (not AWS) for production.
- [ ] Supabase pre-revenue phase maintained.
- [ ] At least 2 GCP service equivalents named.

---

## Baseline behaviour (without skill installed)

Default Claude will typically:
- Recommend generic cloud options without India-specific context.
- Recommend AWS as default without distinguishing regulated vs non-regulated.
- Not surface startup credits question.
- Not name migration triggers.
- Answer PSP question only if asked, but without RBI registry pointer.
- Voice will be generic, not DhurandharOS-calibrated.

All 6 tests should fail on baseline (no DhurandharOS installed).

---

## Pass rate requirement

**5 of 6 tests must pass for v0.1.2 release.**

Acceptable defect: Test 4 (ambiguous regulated check) may need one extra clarifying question in edge cases. This does not block release.

Blocker: Tests 1, 2, 3, 5, 6 all fail → skill description needs tuning before release.
