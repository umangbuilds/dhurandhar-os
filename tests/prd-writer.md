# Pressure tests — prd-writer

Five pressure tests the prd-writer skill must pass.

---

## Test 1 — Sectioned PRD with money diagram

**User input:** "Let's spec out the merchant disbursement flow. T+1 settlement, ₹50K cap per transaction, two-stage approval."

**Pass criteria:**
- PRD has named sections: Goal, Non-goals, User journey, Acceptance criteria, Failure modes, Money flow diagram, Reconciliation ownership, Test plan.
- Money flow diagram is present (text-based ASCII or step-by-step).
- Settlement timing (T+1) is captured in the diagram, not just narrated.

**Baseline:** Generates a flat description, no diagram, no failure modes.

---

## Test 2 — Settlement timing forced question

**User input:** "Spec a payment endpoint that takes user money and credits the merchant."

**Pass criteria:**
- Skill asks the settlement timing question explicitly: T+0 / T+1 / T+3?
- Skill does not lock the spec until the operator answers.
- If the operator says "T+0 / instant," skill flags the cost trade-off (PSPs typically charge for instant settlement).

**Baseline:** Assumes a default settlement and writes the spec.

---

## Test 3 — Failure modes inserted

**User input:** "Spec the webhook handler for payment status updates."

**Pass criteria:**
- PRD includes a Failure modes section with at least: webhook duplicate delivery (idempotency), webhook out-of-order, webhook signature failure, webhook timeout, webhook delivery to wrong endpoint, partial database write.
- Each failure mode has an explicit handling line.

**Baseline:** Spec is happy-path only.

---

## Test 4 — Personal data → Tier 2 routing

**User input:** "Spec the user signup flow. Collect name, email, phone, Aadhaar."

**Pass criteria:**
- PRD flags personal data collection.
- PRD notes itemized consent capture as a required section.
- PRD routes to Tier 2 DPDPA add-on (Sushegaad GRC or mukul975 Privacy) for full compliance coverage.
- PRD does NOT pretend it has full DPDPA expertise in v0.1 core.
- Aadhaar collection notes UIDAI Aadhaar Act constraints (masking, no raw storage without specific authorisation).

**Baseline:** Skips compliance, or generates US-default GDPR/CCPA findings.

---

## Test 5 — Regulated activity routing

**User input:** "Spec a feature that lets users borrow from us at 18% APR for 30 days."

**Pass criteria:**
- PRD flags this as regulated lending activity.
- PRD references RBI Digital Lending Guidelines 2022 + 2023 amendments.
- PRD notes that v0.2 will ship a core RBI Digital Lending skill; for now, route to a CA / compliance counsel and acknowledge the gap.
- PRD includes the Key Fact Statement (KFS) as a deliverable section.

**Baseline:** Writes the lending spec without compliance routing.

---

## Results
- Baseline: 0/5 pass.
- With skill: 5/5 pass.
