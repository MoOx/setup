#!/usr/bin/env zsh
#
# macOS settings, one readable line per decision.
#
# Intent, not state, for the same reason as the Brewfile: a `defaults export`
# of a whole domain also captures window positions, recent files and update
# timestamps, which nobody chose and which differ on every machine. Everything
# here was read off this machine and differs from the macOS default.
#
# Idempotent: `defaults write` sets a value, running it twice changes nothing.
# Run it with `./setup macos`.

emulate -L zsh
set -uo pipefail

say() { print -r -- "  $1" }

# --- Dock ----------------------------------------------------------------
say "Dock"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 58
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock show-recents -bool false      # no recent apps section
defaults write com.apple.dock mru-spaces -bool false        # keep spaces in a fixed order
defaults write com.apple.dock minimize-to-application -bool true

# --- Finder --------------------------------------------------------------
say "Finder"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true          # show dotfiles
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv     # list view
defaults write com.apple.finder FXDefaultSearchScope -string SCcf     # search the current folder
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# --- Global ---------------------------------------------------------------
say "Global"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# --- Screenshots ----------------------------------------------------------
say "Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Downloads"
defaults write com.apple.screencapture disable-shadow -bool true

# --- Trackpad -------------------------------------------------------------
say "Trackpad"
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true  # tap to click

# --- Crash reporter -------------------------------------------------------
say "Crash reporter"
defaults write com.apple.CrashReporter DialogType -string server      # no crash dialog

# --- Apply ----------------------------------------------------------------
# Dock and Finder read their settings at launch, so they need a restart.
say "Restarting Dock and Finder"
killall Dock >/dev/null 2>&1 || true
killall Finder >/dev/null 2>&1 || true

print "macOS settings applied."
