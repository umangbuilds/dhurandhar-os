# DhurandharOS v0.1.3 — Marketplace Source Format Fix

**Released:** 2026-05-04
**Theme:** v0.1.2 install said "success" but only half-installed. v0.1.3 actually installs.

---

## The bug v0.1.3 fixes

A live install of v0.1.2 reported success but the on-disk plugin was missing every skill. `installed_plugins.json` registered `dhurandhar-os@dhurandhar-os v0.1.2`, the marketplace clone at `~/.claude/plugins/marketplaces/dhurandhar-os/` was complete — but the plugin install at `~/.claude/plugins/cache/dhurandhar-os/dhurandhar-os/0.1.2/` had `skills/`, `tests/`, `docs/`, `examples/`, `scripts/`, `lessons.md`, `mission.md` all physically deleted from the working tree (still present in the git tree per `git ls-tree HEAD`, just stripped from disk). Plus a stray nested `dhurandhar-os/0.1.2/` directory containing a recursive duplicate of the same broken state.

Root cause: `marketplace.json` used an unverified source format:

```json
"source": {
  "source": "github",
  "repo": "umangbuilds/dhurandhar-os"
}
```

No working reference marketplace (obra/superpowers-marketplace, anthropics/claude-plugins-official) uses `"source": "github"` with a `repo` field. The format appears to trigger a subdirectory-extraction code path in Claude Code that doesn't match our single-repo layout.

---

## The fix

`.claude-plugin/marketplace.json` source field now matches obra/superpowers-marketplace's verified pattern:

```json
"source": {
  "source": "url",
  "url": "https://github.com/umangbuilds/dhurandhar-os.git"
}
```

That's the entire functional change. Versions bumped to `0.1.3` everywhere.

---

## Upgrade path

Existing v0.1.2 installs are broken — the cache has half a plugin. Clean re-install required.

Inside Claude Code:

```
/plugin uninstall dhurandhar-os@dhurandhar-os
/plugin marketplace remove dhurandhar-os
```

Then on disk (terminal):

```
$ rm -rf ~/.claude/plugins/cache/dhurandhar-os
$ rm -rf ~/.claude/plugins/marketplaces/dhurandhar-os
```

Then re-add:

```
$ claude plugin marketplace add umangbuilds/dhurandhar-os
```

Inside Claude Code:

```
/plugin install dhurandhar-os@dhurandhar-os
/plugin list
```

Should show `dhurandhar-os v0.1.3` Enabled. Verify `~/.claude/plugins/cache/dhurandhar-os/dhurandhar-os/0.1.3/skills/` exists with eight skill directories.

---

## Known limitations

- No new skills, no new features. This is a pure install-format fix.
- If the `source: "url"` pattern still hits the same single-repo ambiguity, the next step is splitting marketplace and plugin into two repos (matches obra exactly).

---

## Closing

v0.1.0 didn't install. v0.1.1 fixed five bugs but kept the wrong source format. v0.1.2 added features on top of the broken install. v0.1.3 is the first version that should actually install end-to-end.

Day 2 of 90.
