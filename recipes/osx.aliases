#!/bin/zsh

alias dockutil="$DOTFILES/submodules/dockutil/scripts/dockutil"

alias seeosxmenuextras="open $OSX_MENU_EXTRAS"

##
# OS X aliases
##
alias flushdns="dscacheutil -flushcache"
alias changedns="sudo networksetup -setdnsservers \"$(networksetup -listnetworkserviceorder | awk -F'\\) ' '/\(1\)/ {print $2}')\" $@"
alias ss="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background &"

alias killa="killall '${app}' > /dev/null 2>&1"

# FUCK YOU OSX (ps: I love you )
alias fuckosxprefs="killall -u $USER cfprefsd && sleep 1" # wait for restart
alias fuckosxfinder="killa Finder"
alias fuckosxdock="killa Dock"
alias fuckosx="fuckosxprefs && killa Dock Finder SystemUIServer NotificationCenter"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && fuckosxfinder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && fuckosxfinder"

# Hide/show all desktop icons (useful when presenting)
alias desktop="defaults write com.apple.finder CreateDesktop -bool"
alias hidedesktop="desktop false && fuckosxfinder"
alias showdesktop="desktop true && fuckosxfinder"

alias osx-bootableusb="sudo \"$OSX_INSTALL_APP/Contents/Resources/createinstallmedia\" --volume /Volumes/Untitled --applicationpath \"$OSX_INSTALL_APP\" --nointeraction"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
#complete -W "NSGlobalDomain" defaults

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"

alias ios="open /Applications/Xcode.app/Contents/Applications/iPhone\ Simulator.app"

alias startinternetsharing="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.InternetSharing.plist"
alias stopinternetsharing="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.InternetSharing.plist"

# get resolution of the diplay(s)
alias osx-resolutions="system_profiler SPDisplaysDataType | grep Resolution | tr -d ' '"
