#!/bin/zsh

brewcaskinstall LimeChat $HOME/Applications
openifnot LimeChat "$HOME/Applications/LimeChat.app"

LIMECHAT_THEME="$LIMECHAT_THEMES/LimeChat-theme-Monokai-Soda"
if [ ! -e "$LIMECHAT_THEME.css" ]
then
  echo_title_install "LimeChat theme"
  git clone https://github.com/MoOx/LimeChat-theme-Monokai-Soda.git $LIMECHAT_THEME
  ln -s $LIMECHAT_THEME/LimeChat-theme-Monokai-Soda.* $LIMECHAT_THEMES
else
  echo_title_update "LimeChat theme"
  git -C $LIMECHAT_THEME pull
fi

brewcaskinstall Skype

# the simple 2 lines above was enough for Slask
# until they name the .app with the version in the dmg
# like "Slack 0.44.2.app"...
#brewcaskinstall Slack
# so here is the way to fix it
brewcaskinstall "/opt/homebrew-cask/Caskroom/slack/" slack
