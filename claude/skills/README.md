# Skills

Where each skill comes from, so a new machine can get it back.

| Skill | Origin | How to update |
| --- | --- | --- |
| `grill-me` | <https://claudemarketplaces.com/skills/mattpocock/skills/grill-me> | re-download from the marketplace, or edit `SKILL.md` here |

Only skills that live in this repo are listed. Two other kinds exist and are
deliberately left out:

- `~/.claude/skills/synced/` is pulled from the Claude account. Nothing to
  version: it comes back on its own, like VS Code Settings Sync.
- Skills that arrive with a plugin. None is installed today
  (`~/.claude/plugins/installed_plugins.json` is empty). When that changes, the
  right shape is a declarative list here plus a `setup` step running
  `claude plugin install`, the same idea as the `Brewfile`.
