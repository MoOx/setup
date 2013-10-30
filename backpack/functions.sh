#!/bin/zsh
for file in $DIR_DOTFILES/backpack/functions/*; do
  [ -r "$file" ] && [ -f "$file" ] && . "$file"
done
unset file
