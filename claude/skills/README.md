# Skills

Where each skill comes from, so a new machine can get it back.

| Skill | Origin | How to update |
| --- | --- | --- |
| `grill-me` | <https://claudemarketplaces.com/skills/mattpocock/skills/grill-me> | copy the file again from `mattpocock/skills`, or edit `SKILL.md` here |

`grill-me` is kept as a copy on purpose. Its repo, `mattpocock/skills`, is a real
Claude Code marketplace, so it could be installed instead and then auto-update:

```sh
claude plugin marketplace add mattpocock/skills
claude plugin install mattpocock-skills@mattpocock
claude plugin update mattpocock-skills
```

The catch is that the unit of installation is the **plugin, not the skill**: that
one bundles whole categories, `deprecated` and `in-progress` among them. For one
157-byte skill that defines an interview style, a pinned copy is the quieter
choice. Switch to the plugin the day more of those skills are wanted.

Only skills that live in this repo are listed. Two other kinds exist and are
deliberately left out:

- `~/.claude/skills/synced/` is pulled from the Claude account. Nothing to
  version: it comes back on its own, like VS Code Settings Sync.
- Skills that arrive with a plugin. None is installed today
  (`~/.claude/plugins/installed_plugins.json` is empty). When that changes, the
  right shape is a declarative list here plus a `setup` step running
  `claude plugin install`, the same idea as the `Brewfile`.
