# setup

> My macOS machine, versioned. One command does everything.

![kaboom](.kaboom.gif)

The goal is to rebuild a working dev machine fast, whether for a new one or because the current
one was stolen or destroyed, without relying on manual copies and without the setup going stale
again.

## New machine

```sh
git clone git@github.com:MoOx/setup.git ~/setup
cd ~/setup
./setup
```

That is the whole procedure. There is no "first run" section to keep up to date: anything that
would belong in one is a missing step in `setup`, so the step gets written instead of described.

`setup` is idempotent. It installs what is missing, asks only where there is a real choice, and
does nothing when there is nothing to do.

## Day to day

```sh
./setup --check   # read-only, says what drifted, exits non-zero
./setup           # deal with it
./setup --help    # the list of steps, generated from the script
./setup <step>    # just one, e.g. ./setup brew
```

`./setup --check` also runs on its own once a week and notifies only when something drifted:
packages installed by hand and never written down, missing secrets, a repo with no remote,
config that stopped pointing at this repo.

## What is in here

| Path | What |
| --- | --- |
| `setup` | the single entry point, and the documentation |
| `bin/unpushed` | lists git work that exists only on this machine |
| `claude/` | Claude Code config, symlinked into `~/.claude` |
| `secrets.tsv` | the registry of secrets: names and where to get them, never values |
| `preferences/` | macOS and terminal preferences |

## What is not in here

**No secret, ever.** Secrets live in the login keychain, and `secrets.tsv` only records their
names, where to create them, and whether they can be recreated at all. `./setup secrets` fills
what is missing and rotates on demand.

Conversation history, `~/dev` and anything else that exists in a single copy are backup material,
not version control material. A dotfiles repo is the wrong tool for them.

## License

[MIT](LICENSE)
