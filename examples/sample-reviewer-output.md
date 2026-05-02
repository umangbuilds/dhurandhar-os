# Sample Reviewer output — diff review with 5 ranked findings

This is a sample output from the `reviewer` skill for a hypothetical 200-line diff that included intentional issues across HIGH / MEDIUM / LOW severities. The Reviewer returns at most 5 findings, all HIGH or MEDIUM, ranked by exploitability, with one personal-data flag routing to a Tier 2 DPDPA add-on.

The diff under review touched: `api/loan.py` (loan disbursement endpoint), `routes/signup.py` (user signup with KYC fields), `dashboard/auth.js` (session handling), `config/payments.py` (aggregator config), and `tests/test_loan.py` (test scaffolding).

---

## Findings

```
[HIGH] [api/loan.py:142] SQL injection via string concatenation in disbursement query
  Exploit path: Attacker crafts merchant_id parameter to escape the quote and append `; DROP TABLE loans;--` or exfiltration payload. Endpoint accepts merchant_id from request body without sanitisation.
  Fix: Use parameterised query — `cursor.execute("SELECT * FROM loans WHERE merchant_id = %s", (merchant_id,))`. Three lines.
  Standard linkage: OWASP A03:2025 (Injection); CWE-89.
  Add-on: N/A — covered by core reviewer.

[HIGH] [config/payments.py:8] Hardcoded API key (production format)
  Exploit path: Source repo is on GitHub; key would be exposed at first push. Even if private repo, key in code violates least-privilege rotation.
  Fix: Move to environment variable or secrets manager. Reference: `os.environ["AGGREGATOR_API_KEY"]`. Verify .env is in .gitignore (it is, confirmed).
  Standard linkage: OWASP A02:2025 (Cryptographic Failures); CWE-798 (Use of Hard-coded Credentials).
  Add-on: N/A.

[HIGH] [routes/signup.py:34-41] Personal data collection without itemized consent capture — DPDPA routing
  Exploit path: Not an exploit per se. Compliance risk. Signup collects name, email, phone, and Aadhaar number; routes to internal DB and a third-party CRM. No itemized consent capture visible in the diff. DPDPA breach risk + Aadhaar handling has additional UIDAI Aadhaar Act constraints (masking rules, no raw storage without specific authorisation).
  Fix: Add itemized consent flow: separate consent for (a) account creation, (b) marketing communication, (c) third-party CRM sharing. Mask Aadhaar to last 4 digits in storage; raw Aadhaar requires specific UIDAI authorisation.
  Standard linkage: DPDPA 2023 + Rules 2024+; UIDAI Aadhaar Act 2016.
  Add-on: For full DPDPA coverage, install `Sushegaad/Claude-Skills-Governance-Risk-and-Compliance` (primary) or `mukul975/Privacy-Data-Protection-Skills` (privacy-only deep dive) per RECOMMENDED.md. v0.1 of DhurandharOS does not ship a core DPDPA skill; v0.2 will.

[MEDIUM] [dashboard/auth.js:34] Session token stored in localStorage
  Exploit path: localStorage is accessible to any JavaScript on the same origin. XSS payload (e.g., from a vulnerable dashboard widget or user-uploaded SVG) reads the token and exfiltrates it. Token theft → session takeover.
  Fix: Use httpOnly + Secure + SameSite=Strict cookie set by the backend. Frontend never directly handles the token. If you need cross-tab session sync, use a postMessage listener on a hidden iframe under your domain.
  Standard linkage: OWASP A07:2025 (Identification and Authentication Failures); CWE-922 (Insecure Storage of Sensitive Information).
  Add-on: N/A.

[MEDIUM] [api/loan.py:178] Missing rate limit on disbursement endpoint
  Exploit path: Authenticated user could trigger many disbursement attempts in rapid succession. Combined with race condition in `tests/test_loan.py:91` (which tests for sequential calls only, not concurrent), a duplicate-disbursement scenario is plausible.
  Fix: Add rate limit at the endpoint level (e.g., 5 disbursement attempts per merchant per minute). Add a database-level constraint preventing duplicate `(merchant_id, idempotency_key)` rows. Update the test in test_loan.py to cover concurrent calls.
  Standard linkage: OWASP A04:2025 (Insecure Design); ASVS V13.1.4 (rate limit on sensitive endpoints).
  Add-on: N/A.
```

**30 candidates scanned, 5 returned (18 filtered as false-positive on framework auto-escaping or test-file context, 7 filtered as low-severity defence-in-depth).**

---

## Notes from the reviewer

- The personal data flow at `routes/signup.py` is the most under-addressed item in the diff. Tier 2 routing is honest — DhurandharOS v0.1 does not pretend to ship full DPDPA coverage. Install the GRC add-on or the privacy-only kit before this code goes to production.
- The hardcoded API key matches a vendor-prefix format (`sk_*` / `pk_*` / similar). Treat any such pattern in committed source as a credential leak whether or not the value is genuinely live.
- The SQL injection at `api/loan.py:142` is the highest-priority fix. Three lines, parameterise, ship.
- Slop scanner flagged 4 candidates (variables named `temp`, `result`, `data` in production code; one function doing fetch + transform + side effect). None severe enough to merit one of the 5 finding slots; surfaced separately if the operator wants the slop pass.

---

**Note on banned tokens:** this Reviewer output names no specific payment aggregator company in the fix recommendations. The phrasing is generic ("the aggregator," "secrets manager"). When the operator implements the fix, the specific aggregator's pattern is documented in DECISIONS.md, not in shipped review output.
