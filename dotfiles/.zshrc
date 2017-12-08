#!/usr/bin/env zsh

# Profiling zshrc speed
# http://www.rosipov.com/blog/profiling-slow-bashrc/
# PS4='+ $(date "+%s.%N")\011 '
# exec 3>&2 2>$HOME/Desktop/zshstart.$$.log
# set -x

# export PATH
# macOS 10.10+ doesn't execute /etc/launchd.conf
# and GUI app doesn't get /etc/paths
# in order to get the right PATH in Atom.app Terminal (atom-term2)
# here is my PATH, hardcoded
# https://github.com/webBoxio/atom-term2/issues/50
# export PATH=$(cat /etc/paths | xargs | tr " " :)
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

#$SETUP_PATH doesn't exist yet
source $HOME/setup/setupsh/index

# find $SETUP_PATH if not defined using symlink real dirname
#__FILENAME__=${0} # only for sourced file, .zshrc is not sourced
__FILENAME__=${ZDOTDIR-~}/.zshrc
if [[ -z "$SETUP_PATH" ]] then
  export SETUP_PATH=$(cd $(dirname $(readlink $__FILENAME__))/../../ && pwd)
fi

export DIR_SYNC=$HOME/Sync
export DIR_DEV=$DIR_SYNC/Development

# add personal bin in the path
export PATH=$PATH:./bin
export PATH=$PATH:./.bin
export PATH=$DIR_DEV/.bin:$PATH

export EDITOR="atom"
source $SETUP_PATH/submodules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(/usr/local/share/zsh-completions $fpath)

HISTFILE=~/.history
HISTSIZE=SAVEHIST=1000
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
#setopt PRINT_EXIT_VALUE

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

#export CC=llvm-gcc-4.2

ZSH_SITE_FUNCTION=/usr/local/share/zsh/site-functions
if [ ! -e  $ZSH_SITE_FUNCTION/prompt_pure_setup ]
then
  mkdir -p $ZSH_SITE_FUNCTION
  silent-rm $ZSH_SITE_FUNCTION/prompt_pure_setup
  ln -s "$SETUP_PATH/submodules/pure/pure.zsh" $ZSH_SITE_FUNCTION/prompt_pure_setup
fi
if [ ! -e  $ZSH_SITE_FUNCTION/async ]
then
  mkdir -p $ZSH_SITE_FUNCTION
  silent-rm $ZSH_SITE_FUNCTION/async
  ln -s "$SETUP_PATH/submodules/pure/async.zsh" $ZSH_SITE_FUNCTION/async
fi
fpath=("/usr/local/share/zsh/site-functions" $fpath)
#PURE_CMD_MAX_EXEC_TIME=2
autoload -U promptinit && promptinit
prompt pure
# add %F{red}%(?..[%?] )%f to include exit code [code]
PROMPT='%(?.%F{green}.%F{red}❯%F{green})❯%f '

export OS_ICONS_DIR=/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources

# also load aliases from projets
if [[ -d $DIR_DEV ]]
then
  for source in `find $DIR_DEV -d -maxdepth 4 -name \*.aliases  | perl -lne 'print tr:/::, " $_"' | sort -n | cut -d' ' -f2`
  do
    source $source
  done
fi

# disable ._ file
export COPYFILE_DISABLE=true


alias list-aliases="alias | sed 's/=.*//'"
alias list-functions="declare -f | grep '^[a-z].* () {' | sed 's/{$//'" # show non _prefixed functions
alias list="cat <(list-aliases) <(list-functions) | sort"
alias search="list | grep"

# Aliases

## macOS
alias macos-hidden-show="defaults write com.apple.finder AppleShowAllFiles -bool true && macos-refresh"
alias macos-hidden-hide="defaults write com.apple.finder AppleShowAllFiles -bool false && macos-refresh"
alias macos-desktop-show="defaults write com.apple.finder CreateDesktop -bool true && macos-refresh"
alias macos-desktop-hide="defaults write com.apple.finder CreateDesktop -bool false && macos-refresh"
# http://apple.stackexchange.com/a/181404/34887
alias macos-internetsharing-on="sudo networksetup -setnetworkserviceenabled 'Ethernet sharing via Wifi' on"
alias macos-internetsharing-off="sudo networksetup -setnetworkserviceenabled 'Ethernet sharing via Wifi' off"
alias macos-resolutions="system_profiler SPDisplaysDataType | grep Resolution | tr -d ' '"
alias macos-flushdns="dscacheutil -flushcache"
alias macos-flushram="purge"
export MACOS_INSTALL_APP="/Volumes/Downloads/Softwares/macOS/Install macOS Sierra Developer Beta.app"
export MACOS_INSTALL_VOLUME="/Volumes/USB_MAC"
alias macos-bootableusb="sudo \"$MACOS_INSTALL_APP/Contents/Resources/createinstallmedia\" --volume $MACOS_INSTALL_VOLUME --applicationpath \"$MACOS_INSTALL_APP\" --nointeraction"
alias macos-dsstore-delete="find . -type f -name '*.DS_Store' -ls -delete"

## NVM
export NVM_DIR="$HOME/.nvm"
export NVM_SH="$NVM_DIR/nvm.sh"
load_nvm () { [ -s "$NVM_SH" ] && . "$NVM_SH" }
# # https://github.com/creationix/nvm/issues/860
# declare -a NODE_GLOBALS=(`find $NVM_DIR/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
# NODE_GLOBALS+=("node")
# NODE_GLOBALS+=("nvm")
# for cmd in "${NODE_GLOBALS[@]}"; do
#   eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
# done
# The script above cause issue with some programs that are looking for
# node/nvm path using "which"
load_nvm

## NPM

alias n="npm"
alias ni="npm install"
alias nio="npm --cache-min 0 install"
alias nig="npm install -g"
alias nis="npm install -S"
alias nid="npm install -D"
alias ns="npm start --"
alias nt="npm test --"
alias nr="npm run"
alias np="nr release --"
alias npf="nr release -- --skip-cleanup"
function nv() {
  echo "Node $(node --version)"
  echo "npm  v$(npm --version)"
  echo "$(sw_vers)"
}

### allow local self signed https server
export NODE_TLS_REJECT_UNAUTHORIZED="0"

### to avoid npm install -g
export PATH=$PATH:./node_modules/.bin

## Yarn
export PATH="$PATH:`yarn global bin`"
# export PATH="$HOME/.yarn/bin:$PATH"
alias y="yarn"
alias yg="yarn global"
alias yga="yarn global add"
alias ya="yarn add"
alias yad="yarn add --dev"
alias yr="yarn remove"
alias ys="yarn start"
alias yt="yarn test"
alias yu="yarn upgrade"
alias yb="yarn build"

## Bundler
alias b="bundler"
alias bi="bundler install"
alias bu="bundler update"
alias be="bundler exec"

## Apache
export APACHE_VERSION=24
export APACHE_VERSION_DOT=2.4
export APACHE_CONF=/usr/local/etc/apache2/$APACHE_VERSION_DOT/httpd.conf
export APACHE_CONF_DEV_PATH=$DIR_DEV/.apache.conf
alias apacheconfigtest="apachectl configtest"
alias apachestart="sudo apachectl start"
alias apacherestart="dscacheutil -flushcache && apachectl configtest && sudo apachectl restart"

# php
export PHP_VERSION=56
export PHP_VERSION_DOT=5.6
export PHP_CONF=/usr/local/etc/php/$PHP_VERSION_DOT/php.ini
alias phpini="e $PHP_CONF"

## MySQL (from brew)
alias mysqlstart="mysql.server start"
alias mysqlstop="mysql.server stop"

## Git
alias git="hub"
alias g="git"
# need short alias with explicit pull for PURE
# https://github.com/sindresorhus/pure/issues/162
alias gg="git pull"
alias gp="git push"
alias gre="git rebase master"
alias grem="git rebase master"
alias gremi="git rebase master -i"

## Network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias elocalip="export LOCAL_IP=$(localip)"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias whois="whois -h whois-servers.net" # Enhanced WHOIS lookups

## Synergy.app
alias synergy="/Applications/Synergy.app/Contents/MacOS/synergy"
alias synergys="/Applications/Synergy.app/Contents/MacOS/synergys"
alias synergyc="/Applications/Synergy.app/Contents/MacOS/synergyc"
alias synergyshome="synergys -n iMoOx"
alias synergychome="synergyc -n MacMoOx iMoOx.local"

# ssh-copy-id
# usage: sshcopy user@server [-p {port}]
alias sshcopy="ssh-copy-id -i ~/.ssh/id_rsa.pub"

## LOCAL STUFF
if [[ -f ~/.zshrc.local ]]; then; source ~/.zshrc.local; fi

# custom aliases
alias gh="github ."
alias .e="setupsh-edit"
alias .o="setupsh-open"
alias wifi=macos-internetsharing-on
alias wifi-off=macos-internetsharing-off
alias echofliptable="echo '\n(╯°□°）╯︵ ┻━┻\n'"
alias fliptable="echo \"$USER/setup\"; echofliptable; setupsh-update; setupsh-run"

# added by travis gem
# [ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
alias travis-init="source $HOME/.travis/travis.sh"

# Docker
alias dockermachine="docker-machine start default; eval \"\$(docker-machine env default)\""

# see https://github.com/popomore/github-labels + MoOx/setup/dotfiles/github-issues-labels.json
alias github-labels="labels -c $HOME/.github-issues-labels.json"

# Profiling zshrc speed
# (see top of the file)
# set +x
# exec 2>&3 3>&-

## GPG
# set up gpg-agent automatically for every shell
# https://gist.github.com/yoshuawuyts/69f25b0384d41b46a126f9b42d1f9db2
if which gpg-agent &> /dev/null &&
then
  if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]
  then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
  else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
  fi
fi

# Show notification when long running command finishes
# and your terminal is not in focus
#
# http://frantic.im/notify-on-completion
function notify_cmd_result_when_terminal_not_focused {
  LAST_EXIT_CODE=$?
  CMD=$(fc -ln -1)
  # No point in waiting for the command to complete
  notify-if-hyper-is-in-the-background "$CMD" "$LAST_EXIT_CODE" &
}
export PS1='$(notify_cmd_result_when_terminal_not_focused)'$PS1

alias syncthing-conflicts-show="find ~/ -name \"*.sync-conflict-*\""
alias syncthing-conflicts-trash="find ~/ -name \"*.sync-conflict-*\" -exec trash {} +"

# Android Studio/Tools (react-native)
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
