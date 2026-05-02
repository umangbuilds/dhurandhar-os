# Lessons

Append-only log of operator learnings. Captured by the soul-keeper skill on user phrases like "lesson learned," "next time," "remember this for later."

Format: `LESSON: [what went wrong] → [what to do instead] — [ISO date]`

Skills must:
- Append, never overwrite.
- Use ISO 8601 dates (`2026-05-02`).
- One lesson per line where possible.
- Group quarterly into a digest if the file exceeds 200 lines.

---

## Examples (placeholder format reference — replace as real lessons accumulate)

LESSON: assumed instant settlement in payment flow, learned PSPs default T+1 → always check settlement timing before locking spec — 2026-05-02

LESSON: hired SDE-2 with Tier-1-only filter, missed three strong candidates from VIT and IIITs → use "CS fundamentals strong" as filter, drop college-tier filter on must-haves — 2026-05-02

LESSON: skipped TDD for "small" feature, regression hit production three days later → no exceptions for small features, the small ones are where regressions hide — 2026-05-02

---

## Operator entries

<!-- soul-keeper appends below this line -->
