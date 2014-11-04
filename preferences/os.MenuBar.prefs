#!/bin/zsh

# hide the useless icons
if ls $HOME/Library/Preferences/ByHost/ | grep com.apple.systemuiserver &> /dev/null
then
  for domain in $HOME/Library/Preferences/ByHost/com.apple.systemuiserver.*
  do
    defaults write "${domain}" dontAutoLoad -array \
      "$OSX_MENU_EXTRAS/Displays.menu" \
      "$OSX_MENU_EXTRAS/TimeMachine.menu" \
      "$OSX_MENU_EXTRAS/User.menu" \
      "$OSX_MENU_EXTRAS/Bluetooth.menu" \
      "$OSX_MENU_EXTRAS/Clock.menu"
  done
fi

# define icons you want in menu bar
defaults write com.apple.systemuiserver menuExtras -array \
  "$OSX_MENU_EXTRAS/TextInput.menu" \
  "$OSX_MENU_EXTRAS/Volume.menu" \
  "$OSX_MENU_EXTRAS/AirPort.menu" \
  "$OSX_MENU_EXTRAS/Battery.menu"
