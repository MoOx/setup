#!/bin/zsh

export OSX_INSTALL_APP="/Applications/Install OS X Mavericks.app"

##
# OS X aliases
##
alias flushdns="dscacheutil -flushcache"
alias changedns="sudo networksetup -setdnsservers \"$(networksetup -listnetworkserviceorder | awk -F'\\) ' '/\(1\)/ {print $2}')\" $@"
alias ss="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background &"

# Fuck crash
alias fuckosxfinder="killall Finder; if ls /Applications/XtraFinder.app 2&>1 > /dev/null; then; open /Applications/XtraFinder.app; fi"
alias fuckosxdock="killall Dock"
alias fuckosxmenubar="killall SystemUIServer NotificationCenter"
alias fuckosx="fuckosxfinder && fuckosxdock && fuckosxmenubar"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && fuckfinder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && fuckfinder"

# Hide/show all desktop icons (useful when presenting)
alias desktop="defaults write com.apple.finder CreateDesktop -bool"
alias hidedesktop="desktop false && fuckfinder"
alias showdesktop="desktop true && fuckfinder"

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
