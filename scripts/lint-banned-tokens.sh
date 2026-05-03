#!/usr/bin/env bash
# Context-aware banned-token lint for DhurandharOS.
# Allowed contexts: STYLE.md, docs/voice-guide.md, DECISIONS.md, tests/ (PSP mentions in test inputs are not shipped copy)
# CONTRIBUTING.md is excluded from PSP/MoltPe/film checks because it documents the lint regexes themselves.

set -euo pipefail

ALLOWED_PSP="STYLE.md|docs/voice-guide.md|DECISIONS.md|CONTRIBUTING.md|tests/"
ALLOWED_MOLTPE="STYLE.md|docs/voice-guide.md|DECISIONS.md|CONTRIBUTING.md|tests/"
ALLOWED_FILM="STYLE.md|docs/voice-guide.md|DECISIONS.md|CONTRIBUTING.md"
# bhai/namaste: allowed in anti-pattern examples (SKILL.md), test criteria (tests/), meta-docs (DECISIONS.md, CONTRIBUTING.md)
ALLOWED_BHAI="STYLE.md|docs/voice-guide.md|tests/|DECISIONS.md|CONTRIBUTING.md|skills/soul-keeper/SKILL.md"
ALLOWED_NAMASTE="STYLE.md|docs/voice-guide.md|tests/|DECISIONS.md|CONTRIBUTING.md|skills/soul-keeper/SKILL.md"
# US slang: allowed in CONTRIBUTING.md (documenting the lint regex itself)
ALLOWED_SLANG="STYLE.md|docs/voice-guide.md|CONTRIBUTING.md"

FAIL=0

check() {
  local label="$1"
  local pattern="$2"
  local allowed="$3"

  local hits
  hits=$(grep -rniE "$pattern" --include="*.md" . 2>/dev/null \
    | grep -vE "^\./(${allowed})" \
    | grep -v "^\./\.tmp/" \
    || true)

  if [ -n "$hits" ]; then
    echo "FAIL [$label]:"
    echo "$hits"
    FAIL=1
  else
    echo "PASS [$label]"
  fi
}

check "competitor PSPs" \
  "razorpay|cashfree|phonepe|payu\b|paytm|razor pay|cash free|phone pe|pay-u|stripe india" \
  "$ALLOWED_PSP"

check "founder parallel venture (MoltPe)" \
  "MoltPe" \
  "$ALLOWED_MOLTPE"

check "film references (Ranveer Singh)" \
  "ranveer singh" \
  "$ALLOWED_FILM"

check "film references (Dhurandhar + film)" \
  "dhurandhar.{1,30}(film|movie|bollywood)" \
  "$ALLOWED_FILM"

check "voice anti-pattern (bhai)" \
  "bhai" \
  "$ALLOWED_BHAI"

check "voice anti-pattern (namaste)" \
  "namaste" \
  "$ALLOWED_NAMASTE"

check "voice anti-pattern (US slang: dude/y'all/guys)" \
  "\bdude\b|y'all|\bguys\b" \
  "$ALLOWED_SLANG"

if [ $FAIL -eq 0 ]; then
  echo ""
  echo "Lint: PASS — no banned tokens outside allowed contexts."
  exit 0
else
  echo ""
  echo "Lint: FAIL — banned token hits found. Fix before release."
  exit 1
fi
