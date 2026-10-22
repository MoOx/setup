#!/usr/bin/env zsh

# hide "Last login" message, because why not
clear

# https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e
export GPG_TTY=$(tty)

export LANG="en_US.UTF-8"

# Want to do some profiling on zshrc speed ?
# https://kev.inburke.com/kevin/profiling-zsh-startup-time/
# https://github.com/raboof/zshprof

__FILENAME__=${ZDOTDIR-~}/.zshrc

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# set by pretzo
unsetopt CORRECT
unsetopt SHARE_HISTORY

# Save a secret in the keychain, prompted (never in a file, in the history, nor in ps):
#   secret-set SENTRY_AUTH_TOKEN
secret-set() {
  local value escaped
  IFS= read -rs "value?Value for $1: " || return 1
  print
  [ -n "$value" ] || { print -u2 "empty, nothing saved"; return 1 }
  escaped=${value//\\/\\\\}
  escaped=${escaped//\"/\\\"}
  printf 'add-generic-password -a "%s" -s "%s" -U -w "%s"\n' "$USER" "$1" "$escaped" | security -i
  print "$1: ${#value} characters saved"
}

for key in \
  APPLE_TEAM_ID \
  FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD \
  GITHUB_TOKEN \
  GITLAB_API_PRIVATE_TOKEN \
  JIRA_TOKEN \
  MATCH_PASSWORD \
  SECRETS_PASSPHRASE \
  SENTRY_AUTH_TOKEN
do
  export $key=$(security find-generic-password -a "$USER" -s "$key" -w 2>/dev/null)
done
# some git stuff require different names
export GITHUB_ACCESS_TOKEN=$GITHUB_TOKEN
export HOMEBREW_GITHUB_API_TOKEN=$GITHUB_TOKEN
export GITLAB_API_ENDPOINT="https://gitlab.com/api/v4"
export SENTRY_ORG=moox

export DIR_DEV=$HOME/dev

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# export PATH="$PATH:/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin"
export EDITOR="code"
alias e="$EDITOR ."

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
#export CC=llvm-gcc-4.2

# Aliases

alias dev="cd $HOME/dev"
alias icloud="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs"
alias xcodedefault="sudo xcode-select --switch /Applications/Xcode.app"

alias ytmp3="youtube-dl -x --audio-format \"mp3\""
alias dlmp3="yt-dlp --cookies-from-browser safari -x --audio-format mp3 --no-mtime --embed-thumbnail --add-metadata -o \"%(title)s.%(ext)s\""

## Git
if [[  "$(command -v hub)" != ""  ]] then
  alias git="hub"
fi
alias g="git"
# need short alias with explicit pull for PURE
# https://github.com/sindresorhus/pure/issues/162
alias gg="git pull"
alias gp="git push"

# custom aliases
alias gth="github ."
alias .o="open"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

## Node via fnm
eval "$(fnm env --use-on-cd --shell zsh)"
# Add node to PATH for use in npm scripts and other binaries
export PATH="$(dirname "$(readlink -f "$(command -v node)")"):$PATH"

alias ko="killall"

## NPM

alias n="npm"
alias ni="npm install"
alias nig="npm install -g"
alias nis="npm install -S"
alias nid="npm install -D"
alias ns="npm start --"
alias nt="npm test --"
alias nit="npm install && npm test --"
alias nrp="npm run prepare"
alias nr="npm run"

# Pré-remplit la section Unreleased du CHANGELOG via git-cliff (PR + auteur), copié dans le presse-papier
changelog() {
  local repo
  repo=$(git remote get-url origin 2>/dev/null | sed -E 's#^.*github\.com[:/]+##; s#\.git$##')
  if [[ -n "$repo" ]]; then
    git cliff --unreleased --github-repo "$repo" | pbcopy
  else
    git cliff --unreleased | pbcopy
  fi
  echo "📋 Unreleased in clipboard"
}
alias np="npm login && npm run release"

alias npf="npm run release -- --skip-cleanup"
alias nd="npm run dev --"
alias nb="npm run build --"
alias nsb="npm run storybook --"

### to avoid npm install -g
export PATH=$PATH:./node_modules/.bin

## React Native
alias rn="react-native"
alias rni="react-native run-ios"
alias rna="react-native run-android"

# ## Ruby / Bundler

# ### M1 fixups https://github.com/rbenv/ruby-build/issues/1691#issuecomment-815820916
# ### this was made for Ruby 2.6.3, 2.7.x didn't require this stuff
# OPENSSL_VERSION=1.1
# export PATH="/opt/homebrew/opt/openssl@$OPENSSL_VERSION/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/openssl@$OPENSSL_VERSION/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/openssl@$OPENSSL_VERSION/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@$OPENSSL_VERSION/lib/pkgconfig"
# #export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@$OPENSSL_VERSION)"
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@$OPENSSL_VERSION) --with-readline-dir=$(brew --prefix readline)"

eval "$(rbenv init - zsh)"

alias b="bundler"
alias bi="bundler install"
alias bu="bundler update"
alias be="bundler exec"
export GEM_HOME=$HOME/.gem
export PATH=$PATH:$HOME/.gem/bin

# Fastlane
alias f="bundler exec fastlane"

# Android Studio/Tools (react-native)
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
# https://stackoverflow.com/a/70678929/988941
function adblist { adb devices -l | tail -n +2 | sed -r 's/[ ]+.*//g' }
function adbreverse { echo $1; adb -s $1 reverse tcp:8081 tcp:8081 }
function adbr { for d in `adblist`; do; adbreverse $d; done; }

# PIP
alias pip=pip3
alias python=python3

alias dl="yt-dlp \
  --cookies-from-browser=safari \
  --embed-thumbnail \
  --add-metadata \
  --embed-metadata \
  --no-write-comments \
  -f \"bestaudio[ext=m4a]\" \
  --output \"%(title)s.%(ext)s\" \
  "

# Beets music tagger - config centralisée
export BEETSDIR="$HOME/Music/Music/beets"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Re-attributes to you the commits an assistant authored, and drops its trailers.
#
# A commit is rewritten when its author is an @anthropic.com address, or when its
# message carries a Claude trailer. Anything else is left strictly untouched,
# author included, so a branch mixing your commits and the assistant's is safe.
#
#   unclaude            # everything above the upstream branch
#   unclaude 5          # the last 5 commits
#   unclaude <ref>      # everything above <ref>
#
# History is rewritten, so the branch needs a force-push afterwards:
#   git push --force-with-lease
unclaude() {
  emulate -L zsh
  local base
  if [[ "$1" == <-> ]]; then
    base="HEAD~$1"
  elif [[ -n "$1" ]]; then
    base="$1"
  else
    base="$(git rev-parse --abbrev-ref --symbolic-full-name '@{upstream}' 2>/dev/null)" || {
      print -u2 "unclaude: no upstream branch, pass a commit count or a ref"
      return 1
    }
  fi

  local pattern='^(Co-[Aa]uthored-[Bb]y:[[:space:]]*Claude|Co-[Aa]uthored-[Bb]y:.*@anthropic\.com|Claude-Session:|(🤖 )?Generated with \[Claude Code\])'

  # git rebase --exec refuses newlines, so the command is one line built in pieces.
  local cmd
  cmd="git log -1 --format=%ae | grep -qiE '@anthropic\.com\$' || git log -1 --format=%B | grep -qE '$pattern' || exit 0; "
  cmd+="msg=\$(mktemp) || exit 1; "
  cmd+="git log -1 --format=%B | grep -vE '$pattern' > \"\$msg\"; "
  cmd+="[ -s \"\$msg\" ] || { rm -f \"\$msg\"; exit 1; }; "
  cmd+="git commit --amend --quiet --reset-author --date=\"\$(git log -1 --format=%aI)\" --cleanup=whitespace -F \"\$msg\"; "
  cmd+="s=\$?; rm -f \"\$msg\"; exit \$s"

  GIT_EDITOR=true git rebase "$base" --exec "$cmd"
}

# https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"
