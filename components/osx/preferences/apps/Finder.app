#!/bin/zsh

defaults write com.apple.finder ShowTabView -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
# More about path here https://github.com/mathiasbynens/dotfiles/pull/285#issuecomment-31608378
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

# Allow QuickLook text selection
defaults write com.apple.finder QLEnableTextSelection -bool true

chflags hidden $HOME/"Automatically Add to iTunes.localized" &> /dev/null
chflags nohidden $HOME/Library


# XtraFinder options
defaults write com.apple.finder "XtraFinder_XFAutoArrangeByNamePlugin" 1
defaults write com.apple.finder "XtraFinder_XFBackspaceToGoBackPlugin" 1
defaults write com.apple.finder "XtraFinder_XFCopyPathMenuPlugin" 1
defaults write com.apple.finder "XtraFinder_XFCopyPathMenuPlugin_Default" 0
defaults write com.apple.finder "XtraFinder_XFCutAndPastePlugin" 1
defaults write com.apple.finder "XtraFinder_XFFoldersOnTopPlugin" 1
defaults write com.apple.finder "XtraFinder_XFHideDotFilesOnDesktopPlugin" 1
defaults write com.apple.finder "XtraFinder_XFMakeSymbolicLinkActionPlugin" 1
defaults write com.apple.finder "XtraFinder_XFNewFileActionPlugin" 1
defaults write com.apple.finder "XtraFinder_XFShowAllFilesActionPlugin" 1
defaults write com.apple.finder "XtraFinder_XFShowAllFilesActionPlugin_Shortcut" -dict \
  keyChars -string ">" \
  keyCharsIgnoringModifiers -string ">" \
  keyCode 50 \
  modifierFlags 1179648 \
  modifiers 768
