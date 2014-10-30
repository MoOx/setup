#!/bin/zsh

brewinstall zsh-completions
brewinstall terminal-notifier

#brewcaskinstall "iTerm" "iterm2" $HOME/Applications

source $DOTFILES/packages/_cli/preferences/Terminal
#source $DOTFILES/packages/_cli/preferences/iTerm2

# safer than rm
npmig trash
