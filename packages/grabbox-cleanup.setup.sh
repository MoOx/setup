#!/bin/zsh

if [ ! -e $HOME/Library/LaunchAgents/grabbox-cleanup.plist ]
then
  ln -s $DOTFILES/packages/grabbox-cleanup/launchd/grabbox-cleanup.plist $HOME/Library/LaunchAgents
  launchctl load $HOME/Library/LaunchAgents/grabbox-cleanup.plist
fi
