#!/bin/zsh

if ! type ddclient > /dev/null
then
  echo_title_install "a Dynamic DNS client"
  brewinstall ddclient
fi

# ddclient human configuration & auto start
if [ ! -e /Library/LaunchDaemons/homebrew.mxcl.ddclient.plist ]
then
  sudo cp $DOTFILES/packages/ddclient.conf /usr/local/etc/ddclient
  e -w /usr/local/etc/ddclient/ddclient.conf

  sudo cp -fv /usr/local/opt/ddclient/*.plist /Library/LaunchDaemons
  sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.ddclient.plist
fi
