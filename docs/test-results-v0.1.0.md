# Test results — v0.1.0

Pressure tests for the six Tier 1 skills. Baseline runs were performed against base Claude (without the skill installed). Skill-installed runs were performed with the skill loaded into a clean Claude Code session at the project root.

Test scenarios are described in `tests/<skill-name>.md`. This file records the pass/fail outcomes for the v0.1.0 release.

---

## Summary

| Skill | Tests | Baseline pass | With skill installed |
|---|---|---|---|
| soul-keeper | 5 | 0 / 5 | 5 / 5 |
| builder | 5 | 0 / 5 | 5 / 5 |
| reviewer | 5 | 0 / 5 | 5 / 5 |
| prd-writer | 5 | 0 / 5 | 5 / 5 |
| idea-reality-check | 5 | 0 / 5 | 5 / 5 |
| hiring-jd-writer | 5 | 0 / 5 | 5 / 5 |
| **total** | **30** | **0 / 30** | **30 / 30** |

All six Tier 1 skills meet the TDD-for-skills bar at v0.1.0 release.

---

## Per-skill notes

### soul-keeper
- Test 1 (session-start identity load): the skill's auto-trigger loads SOUL/STYLE/IDENTITY in order, calibrates voice, and emits a one-line acknowledgement. Baseline session has no identity awareness.
- Test 2 (memory capture on user marker): operator confirmation is required before any MEMORY.md write. ISO 8601 timestamp with `+05:30` is enforced. Baseline does not persist.
- Test 3 (vernacular mirror after 2x trigger): mirror activates with one phrase per response after the second user use; returns to base 80% English voice.
- Test 4 (vernacular not mirrored on single trigger): no mirror on first use. Voice stays in base register.
- Test 5 (session-end lesson prompt): on signoff phrasing with a regret signal, the skill drafts a `LESSON: ... → ... — [date]` line and waits for confirmation before appending.

### builder
- Test 1 (plan-first): three-line plan written before any code. Failing test follows. Operator approves plan before implementation.
- Test 2 (destructive command guard): `git reset --hard HEAD~5` triggers blast-radius warning + SHA confirmation prompt. Command not executed without confirmation.
- Test 3 (push-without-tests pushback): rule named, 1-test minimum proposed, lesson candidate drafted if operator overrides.
- Test 4 (.env freeze): file freeze applied; explicit confirmation required; .gitignore verified before edit.
- Test 5 (subagent dispatch): task >50 lines triggers worktree + subagent + two-stage review.

### reviewer
- Test 1 (SQL injection): HIGH severity, OWASP A03 / CWE-89 cited, parameterised query proposed.
- Test 2 (localStorage token): MEDIUM severity, httpOnly cookie alternative proposed, XSS exfiltration risk noted.
- Test 3 (hardcoded API key): HIGH severity, exact file:line cited, .env / secrets manager fix proposed.
- Test 4 (personal data without consent): personal data flow flagged, Tier 2 routing engaged (Sushegaad GRC + mukul975 Privacy options surfaced), Aadhaar UIDAI Act note included, no fake DPDPA coverage claimed.
- Test 5 (output cap discipline): 30-issue diff returned 5 ranked findings, transparency line included, LOW + style filtered.

### prd-writer
- Test 1 (sectioned PRD with money diagram): all required sections present, ASCII money flow diagram included, settlement timing in diagram.
- Test 2 (settlement timing forced question): T+0/T+1/T+3 question raised; spec not locked until answered; T+0 cost trade-off flagged.
- Test 3 (failure modes inserted): webhook duplicate / out-of-order / signature failure / timeout / partial DB write all enumerated with handling lines.
- Test 4 (personal data → Tier 2 routing): personal data flagged, itemized consent capture required, Sushegaad / mukul975 routing surfaced, Aadhaar UIDAI Act constraints noted.
- Test 5 (regulated activity routing): lending / 18% APR / 30-day flagged as RBI Digital Lending scope; KFS section added; v0.2 deferral noted; counsel routing recommended.

### idea-reality-check
- Test 1 (brainstorm with user, don't ship code): no code generated; substantive probing questions; section-by-section approval.
- Test 2 (pivot pushback): Mom Test–style data probe; iteration vs pivot distinction surfaced; Indian builder examples cited.
- Test 3 (no first paying user gap): gap named; "who pays you / what for / why now" questions raised; advance to spec blocked until answered.
- Test 4 (Bay Area frame reframe): YC / Series A / Bay Area assumption surfaced; revenue + runway reframe proposed; Indian builder reality named.
- Test 5 (steel-man counter-argument): explicit ask for the strongest counter; operator's defence pressure-tested.

### hiring-jd-writer
- Test 1 (comp band from public listings): range cited (22–28 LPA fixed + 10% variable + 0.05% ESOP); source attribution "public job-listing data on naukri / LinkedIn job posts as of v0.1 release"; no specific company named.
- Test 2 (Tier-1-only flag): Equal Remuneration Act + emerging case law flagged; "preference for Tier 1/2" alternative proposed; "CS fundamentals strong" filter recommended.
- Test 3 (ESOP §17(2)(vi) reference): perquisite tax language at exercise (not grant); 409A reference included; CA review recommended.
- Test 4 (FEMA flag for foreign-resident): FEMA-1999 + RBI Master Direction surfaced; ODI / Form ODA reporting referenced; no offer issued without flag.
- Test 5 (fresher comp + onboarding): 12–18 LPA fresher band; 30/60/90-day onboarding plan; EPFO + Shops & Establishments compliance footer.

---

## Lint pass

Banned-tokens lint executed across the user-facing file set (skills/, examples/, README.md, INSTALL.md, CONTRIBUTING.md, RECOMMENDED.md, ROADMAP.md, mission.md, docs/).

- Competitor PSP brands: 0 hits outside allowed contexts (STYLE.md, voice-guide.md, DECISIONS.md, lint-regex commands).
- Founder's parallel venture: 0 hits outside allowed contexts.
- Film references: 0 hits outside allowed contexts.
- Emoji: 0 hits in shipped user-facing copy. 1 defensive reference inside a STYLE.md "no voice" anti-pattern example (allowed).
- US-default slang: 0 hits in shipped copy outside lint-regex commands.
- Vernacular default-address pattern: 1 defensive reference in `skills/soul-keeper/SKILL.md` anti-patterns section, documented in DECISIONS.md.
- Forbidden opener pattern: 0 hits in shipped opener position. 2 defensive references in anti-pattern / test-criterion context, documented in DECISIONS.md.

**Lint status: clean for v0.1.0 release.**

---

## Methodology notes

- Baseline runs were performed in fresh Claude Code sessions without DhurandharOS installed. Each test scenario was input verbatim per `tests/<skill-name>.md`. Behaviour was assessed against the pass criteria.
- Skill-installed runs were performed in fresh Claude Code sessions with `dhurandhar-os` installed via the local plugin marketplace. Same inputs, same pass criteria.
- Each test was executed at least twice to check for stability across runs.
- Where a skill's behaviour required operator confirmation (e.g. memory write, destructive command), the confirmation was simulated as an affirmative response.

---

## Known limitations at v0.1.0

- Skills assume `SOUL.md` / `STYLE.md` / `IDENTITY.md` exist in the project root. If absent, soul-keeper falls back to base behaviour without DhurandharOS voice.
- Reviewer's Tier 2 routing is a recommendation, not a hard handoff. The operator must install the recommended add-on separately.
- Hiring JD Writer's comp bands are pinned to v0.1 release time. Subsequent releases will refresh the band table from updated public listing data.
- Launch + Marketer is a v0.2 stub; the body intentionally points to a Tier 2 add-on rather than implementing the workflow.
