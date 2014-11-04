#!/bin/zsh

if ! type mysql > /dev/null
then
  echo_title_install "MySQL"
  brewinstall mysql

  # I don't need mysql for a daily usage anymore
  #ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
  #launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
fi
