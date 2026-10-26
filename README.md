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
./setup <step>...  # only those steps, e.g. ./setup home claude
./setup --help     # the list of steps
bin/unpushed       # git work that exists only on this machine
bin/unpushed --clean   # triage it: push, delete or keep
bin/apps           # apps Homebrew does not manage, and the casks that could
bin/apps --all     # every app, its source and its last use
bin/ssh-keys       # local keys, and what GitHub authorises
bin/ssh-keys --probe   # also try the old keys against every known host
bin/backup copy    # fonts, Claude history and .env to iCloud Drive
bin/backup paste   # pull them back, never overwriting a local file
bin/backup list    # what the encrypted .env archive holds
bin/prefs              # re-save the versioned app preferences
bin/prefs --all        # write every domain here to read, .gitignore keeps four
bin/prefs --check      # name the versioned ones that changed
bin/dev-snapshot       # record the ~/dev repos and their remotes
bin/dev-snapshot --restore   # clone them back
```

To look a cask up in a browser: <https://formulae.brew.sh/cask/>

## Contents

| Path | What |
| --- | --- |
| `setup` | the entry point |
| `Brewfile` | packages, casks, App Store apps |
| `home/` | dotfiles, each file symlinked into `~`, nested paths included |
| `claude/` | Claude Code config, symlinked into `~/.claude` |
| `macos.sh` | macOS settings, one line per decision |
| `preferences/` | app preferences, the ones .gitignore keeps, re-imported on a new machine |
| `apps-manual.md` | apps with no cask, and where to download them |
| `secrets.tsv` | secret names and where to get them |
| `backup.pub` | public key the iCloud archive is encrypted to |
| `hooks/` | this repo own git hooks |
| `launchd/` | the weekly agent, and the app that posts its notification |
| `bin/` | small tools |

No secret is in this repo. They live in the login keychain.

## License

[MIT](LICENSE)
