# UI Skill Research — v0.1.9

Sources fetched and analysed before writing skills/ui-designer/SKILL.md.

---

## 1. Anthropic — frontend-design (MIT)
Repo: `anthropics/claude-code` → `plugins/frontend-design/skills/frontend-design/SKILL.md`

**Best at:** Banning generic defaults with precision. "Commit to bold aesthetic direction before writing a line of code." Explicit banned-fonts list (Inter, Roboto, Arial, Space Grotesk). CSS custom-property pattern for design tokens. Anti-AI-slop rule (no purple gradients on white, no predictable 3-col layouts). Tagline: "Bold maximalism and refined minimalism both work — the key is intentionality, not intensity."

**Weak at:** No product-category awareness. No India-market context. No concrete palettes or font recommendations — says "use characterful fonts" without naming them.

**Stealing verbatim:** banned-fonts list, CSS variables approach, "bold direction before coding" mandate, purple-gradient ban.

**License:** MIT, Anthropic.

---

## 2. LibreUIUX — design-mastery (MIT)
Repo: `HermeticOrmus/LibreUIUX-Claude-Code`

**Best at:** Scale. 70+ plugins, 74 specialised skills. Comprehensive WCAG/ARIA accessibility coverage. Suggest WCAG 2.1 AA as minimum bar (4.5:1 contrast for normal text, 3:1 for large text, 44×44px touch targets).

**Weak at:** Couldn't access SKILL.md directly — repo structure too large to browse via HTTP. The "Define→Build→Review→Refine" loop referenced in docs is a useful conceptual frame but we can't copy verbatim without seeing the source.

**Stealing:** Accessibility floor (WCAG 2.1 AA contrast ratios, 44×44px touch targets). These are concrete, actionable, and non-US-specific.

**License:** MIT, HermeticOrmus.

---

## 3. gstack — design-shotgun + design-consultation (MIT)
Repo: `garrytan/gstack`

**Best at:** Two killer features.

*design-shotgun:* Generates 2–3 variant concepts with hard anti-convergence rule — variants must differ in font personality, palette temperature, layout rhythm. Not color swaps. Saves feedback.json / approved.json to persist taste. Comparison-board pattern (HTTP server for visual comparison).

*design-consultation:* DESIGN.md as project source of truth. Splits recommendations into "safe choices" (category baseline) and "deliberate risks" (where this product gets its own identity). Taste profile with decaying confidence scores.

**Weak at:** Requires external binaries (`design binary`, `browse binary`) — too tooling-dependent for a standalone skill. Saves to `~/.gstack/` not project directory — breaks our working-directory convention.

**Stealing:** design-shotgun anti-convergence rule, taste-memory pattern (save to `.design-system.md` in project), DESIGN.md as source-of-truth concept, "safe vs deliberate-risk" split.

**License:** MIT, Garry Tan.

---

## 4. taste-skill — Leonxlnx (MIT)
Repo: `Leonxlnx/taste-skill`

**Best at:** Three config variables (DESIGN_VARIANCE: 8, MOTION_INTENSITY: 6, VISUAL_DENSITY: 4) as a single-line calibration mechanism. Recommends Geist/Satoshi as Inter replacements. Bans pure black, neon glows, and purple accents explicitly. Framer Motion spring physics (`stiffness: 100, damping: 20`) for reference-quality animations.

**Weak at:** React/Next.js-specific throughout. Assumes Framer Motion availability. Not framework-agnostic.

**Stealing:** Three-variable calibration concept (we'll simplify to product category instead), Geist/Satoshi as concrete font alternatives, purple-accent ban reinforcement.

**License:** MIT, Leonxlnx.

---

## 5. ui-ux-pro-max — NextLevelBuilder (MIT)
Repo: `nextlevelbuilder/ui-ux-pro-max-skill`

**Best at:** Scale of curated data — 67 UI styles, 161 color palettes, 57 font pairings, industry-specific rules. Auto-activation pattern (triggers on "Build a landing page" without slash command). `design-system/MASTER.md` + `design-system/pages/[page].md` hierarchical persistence. Real font-pairing examples with mood labels.

**Weak at:** Too large to embed — requires npm CLI install, CSV databases, Python search scripts. The skill is a wrapper over a database, not a standalone directive.

**Stealing:** Auto-activation trigger structure, industry-aligned palette concept, font pairings with mood labels, MASTER.md persistence hierarchy.

**License:** MIT, NextLevelBuilder.

---

## 6. interface-design — Dammyjay93 (MIT)
Repo: `Dammyjay93/interface-design`

**Best at:** "Decisions compound" philosophy. "A spacing value chosen once becomes a pattern. A depth strategy becomes an identity." Auto-loads `.interface-design/system.md` on session start. "A coherent system with imperfect values beats a scattered interface with correct ones." Memory-driven iteration — seeing previous decisions enables intentional evolution.

**Weak at:** Couldn't access system.md directly (file path 404). Light on concrete design rules — heavy on philosophy.

**Stealing:** "Decisions compound" quote (verbatim attribution), `.design-system.md` persistence pattern, cross-session load on first visual request.

**License:** MIT, Dammyjay93.

---

## Summary — what we're building

| Source | One thing we're stealing |
|---|---|
| Anthropic frontend-design | Banned fonts + CSS variables + "bold direction first" |
| LibreUIUX | WCAG 2.1 AA floor (4.5:1 contrast, 44×44px touch) |
| gstack | Design-shotgun anti-convergence + `.design-system.md` persistence |
| taste-skill | Concrete font alternatives (Geist, Satoshi, Fraunces) |
| ui-ux-pro-max | Industry-aligned palettes + font pairings with mood labels |
| interface-design | "Decisions compound" — load `.design-system.md` on every build |

**DhurandharOS additions (none of the above have these):**
- Product-first categorisation (consumer/SaaS/fintech/creative/dev-tools)
- India-market rules (mobile-first, ₹ pricing, UPI context, Devanagari fallback)
- Anti-AI-slop gate (5-point checklist, YC-test, AI-tell check)
- Ready-to-use hex palettes (5 named palettes, no "use warm tones" vagueness)
- Specific font pairings (5 tested pairings, not "pick a good font")
