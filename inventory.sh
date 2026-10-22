#!/usr/bin/env bash
# Machine inventory. Never reads any secret value.
set -uo pipefail
out="${1:-inventory}"
mkdir -p "$out"

# Directories never worth walking: huge, synced to iCloud, or regenerable.
# ~/Library holds the iCloud Drive mount, where find stalls forever.
prune=(
  -name node_modules -o
  -name Library -o
  -name .Trash -o
  -name .cache -o
  -name .npm -o
  -name .pnpm-store -o
  -name .gradle -o
  -name .rustup -o
  -name .cargo -o
  -name Applications -o
  -name vendor -o
  -name .venv -o
  -name venv
)

# Homebrew 7 removed --describe (descriptions are now the default output).
command -v brew >/dev/null && brew bundle dump --force --file="$out/Brewfile"
command -v mas  >/dev/null && mas list > "$out/mas.txt"
ls /Applications ~/Applications 2>/dev/null > "$out/apps.txt"

command -v npm  >/dev/null && npm ls -g --depth=0 > "$out/npm-global.txt" 2>/dev/null
command -v pnpm >/dev/null && pnpm ls -g > "$out/pnpm-global.txt" 2>/dev/null
command -v code >/dev/null && code --list-extensions > "$out/vscode-extensions.txt" 2>/dev/null
ls -la ~/.local/bin ~/bin 2>/dev/null > "$out/user-bins.txt"

ls -la ~ > "$out/home.txt"
ls -la ~/.config 2>/dev/null > "$out/config.txt"
ls -la ~/.ssh 2>/dev/null | grep -v ' id_' > "$out/ssh-files.txt"
ls ~/Library/Fonts 2>/dev/null > "$out/fonts.txt"
ls -la ~/Library/LaunchAgents 2>/dev/null > "$out/launchagents.txt"
crontab -l > "$out/crontab.txt" 2>/dev/null

defaults domains | tr ',' '\n' | sed 's/^ //' > "$out/defaults-domains.txt"

# Login keychain entry names only (no values)
security dump-keychain ~/Library/Keychains/login.keychain-db 2>/dev/null \
  | grep -E '"svce"|"acct"' | sort -u > "$out/keychain-login-names.txt"

# Repos holding unsaved work (changes, stashes or unpushed commits)
timeout 600 find ~ -maxdepth 5 \( "${prune[@]}" \) -prune -o -name .git -type d -print 2>/dev/null \
  | while read -r g; do
      d=$(dirname "$g")
      s=$(git -C "$d" status --porcelain 2>/dev/null | head -1)
      u=$(git -C "$d" log --branches --not --remotes --oneline 2>/dev/null | head -1)
      st=$(git -C "$d" stash list 2>/dev/null | head -1)
      [ -n "$s$u$st" ] && echo "$d"
    done > "$out/dirty-repos.txt"

# Paths of .env files (never their contents)
timeout 600 find ~ -maxdepth 6 \( "${prune[@]}" \) -prune -o -name '.env*' -print 2>/dev/null \
  > "$out/env-files.txt"

echo "Inventory written to $out/"
