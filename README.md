# setup

My macOS machine, versioned.

![kaboom](.kaboom.gif)

## New machine

```sh
xcode-select --install
git clone git@github.com:MoOx/setup.git ~/setup
cd ~/setup
./setup
```

macOS ships no git: `/usr/bin/git` is a stub that asks to install the developer
tools, and it shares its inode with `clang`, `make` and `swift`. The first line
gets that out of the way.

## Commands

```sh
./setup            # install what is missing, ask when there is a choice
./setup --check    # read-only, report what drifted
./setup --yes      # no questions, take the defaults
./setup <step>     # one step: brew, secrets, dev, home, claude, ssh, macos
./setup --help     # the list of steps
bin/unpushed       # git work that exists only on this machine
bin/unpushed --clean   # triage it: push, delete or keep
bin/apps           # apps Homebrew does not manage, and the casks that could
bin/apps --all     # every app, its source and its last use
```

To look a cask up in a browser: <https://formulae.brew.sh/cask/>

## Contents

| Path | What |
| --- | --- |
| `setup` | the entry point |
| `Brewfile` | packages, casks, App Store apps |
| `home/` | dotfiles, symlinked into `~` |
| `claude/` | Claude Code config, symlinked into `~/.claude` |
| `preferences/` | macOS and terminal preferences |
| `secrets.tsv` | secret names and where to get them |
| `allowed_signers` | SSH keys allowed to sign commits |
| `bin/` | small tools |

No secret is in this repo. They live in the login keychain.

## License

[MIT](LICENSE)
