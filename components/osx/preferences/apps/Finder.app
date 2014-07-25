#!/bin/zsh

# vertical list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# can figure how to use `defaults write` to handle this prefs
# getting error `Cannot nest composite types (arrays and dictionaries)`
# defaults write com.apple.finder "NSToolbar Configuration Browser" -dict-add "TB Item Identifiers" - array ...
plistbuddy com.apple.finder "Delete :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers"
plistbuddy com.apple.finder "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers array" && i=1
plistbuddy com.apple.finder "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers:$i string com.apple.finder.BACK" && ((i++))
plistbuddy com.apple.finder "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers:$i string com.apple.finder.PATH" && ((i++))
plistbuddy com.apple.finder "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers:$i string NSToolbarFlexibleSpaceItem" && ((i++))
plistbuddy com.apple.finder "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers:$i string com.apple.finder.SWCH" && ((i++))
plistbuddy com.apple.finder "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers:$i string NSToolbarSpaceItem" && ((i++))
plistbuddy com.apple.finder "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers:$i string com.apple.finder.NFLD" && ((i++))
plistbuddy com.apple.finder "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers:$i string NSToolbarSpaceItem" && ((i++))
plistbuddy com.apple.finder "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers:$i string com.apple.finder.SHAR" && ((i++))
plistbuddy com.apple.finder "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers:$i string NSToolbarFlexibleSpaceItem" && ((i++))
plistbuddy com.apple.finder "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers:$i string com.apple.finder.SRCH" && ((i++))
unset i

defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder AppleShowAllExtensions -bool true

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
# defaults write com.apple.finder "XtraFinder_XFShowAllFilesActionPlugin_Shortcut" -dict \
#   keyChars -string ">" \
#   keyCharsIgnoringModifiers -string ">" \
#   keyCode 50 \
#   modifierFlags 1179648 \
#   modifiers 768
