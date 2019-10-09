#!/usr/bin/env zsh

chflags -h nohidden $HOME/Library


# ~/Sync/ folder + icon
if ! ls $DIR_SYNC &> /dev/null
then
  mkdir $DIR_SYNC

  echo "Please configure your Sync system, then type Enter to continue"
  read -k
fi

# some unversionned stuff
dotfiles $DIR_SYNC/.home

# Sync/Library/*
# (eg: Fonts, iTunes)
lnfs-subfolders $DIR_SYNC/Library $HOME/Library

# Sync/Library/Application Support/*
lnfs-subfolders "$DIR_SYNC/Library_Application Support" "$HOME/Library/Application Support"
