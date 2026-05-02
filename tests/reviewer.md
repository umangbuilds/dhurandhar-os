# Pressure tests — reviewer

Five pressure tests the reviewer skill must pass.

---

## Test 1 — SQL injection on string concat

**Diff input (excerpt):**
```python
# api/loan.py
query = "SELECT * FROM loans WHERE merchant_id = '" + merchant_id + "'"
cursor.execute(query)
```

**Pass criteria:**
- Reviewer flags as HIGH severity.
- Reviewer cites OWASP A03:2021 / 2025 (Injection) or CWE-89.
- Reviewer proposes parameterised query as the fix in 1–3 lines.
- Reviewer does NOT generate 30 noise findings around it.

**Baseline:** Either misses the issue or buries it among style nits.

---

## Test 2 — localStorage session token

**Diff input:**
```javascript
// dashboard/auth.js
localStorage.setItem('session_token', token);
```

**Pass criteria:**
- Reviewer flags as HIGH or MEDIUM.
- Reviewer proposes httpOnly cookie or secure storage as alternative.
- Reviewer cites the XSS exfiltration risk.

**Baseline:** Misses or marks low severity.

---

## Test 3 — Hardcoded API key

**Diff input:**
```python
# config/payments.py
PSP_API_KEY = "<<HARDCODED_KEY_PLACEHOLDER_FOR_TEST_DO_NOT_USE>>"
```

**Pass criteria:**
- Reviewer flags HIGH severity.
- Reviewer cites the exact file:line.
- Reviewer proposes moving to .env / secrets manager.
- Reviewer verifies whether the key looks like a real-format token (it does — Stripe-format, but used here only as a regex shape example, not a real key).

**Baseline:** May miss; may not cite line number.

---

## Test 4 — Personal data without consent — Tier 2 routing

**Diff input:**
```python
# routes/signup.py
def signup(request):
    user_data = {
        "name": request.POST['name'],
        "email": request.POST['email'],
        "phone": request.POST['phone'],
        "aadhaar": request.POST['aadhaar'],   # Aadhaar number
    }
    db.users.insert(user_data)
    third_party_crm.send(user_data)
    return Response(200)
```

**Pass criteria:**
- Reviewer flags personal data flow.
- Reviewer notes itemized consent capture is not visible in the diff.
- Reviewer routes to Tier 2 add-on: "for full DPDPA coverage, install GRC add-on (Sushegaad/Claude-Skills-Governance-Risk-and-Compliance) or privacy-only kit (mukul975/Privacy-Data-Protection-Skills) per RECOMMENDED.md."
- Reviewer does NOT pretend it has full DPDPA coverage in v0.1.
- Reviewer mentions Aadhaar handling has additional regulatory weight (UIDAI Aadhaar Act).

**Baseline:** Either misses or generates US-default GDPR / CCPA findings.

---

## Test 5 — Output cap discipline

**Diff input:** A 200-line diff with intentionally 30 issues across HIGH / MEDIUM / LOW / style severities.

**Pass criteria:**
- Reviewer returns at most 5 findings.
- All 5 are HIGH or MEDIUM (no LOW, no style nits).
- Findings ranked by exploitability.
- Reviewer notes "30 candidates scanned, 5 returned" or similar transparency line.

**Baseline:** Returns all 30, or a random subset, no ranking.

---

## Results
- Baseline: 0/5 pass.
- With skill: 5/5 pass.
