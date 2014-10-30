#!/bin/zsh

brewcaskinstall "FirefoxNightly" "firefox-nightly" "$HOME/Applications"
openifnot "FirefoxNightly" "$HOME/Applications/FirefoxNightly.app"

brewcaskinstall "FirefoxAurora" "firefox-aurora" "$HOME/Applications"

brewcaskinstall "Firefox"

brewcaskinstall "Google Chrome"

brewcaskinstall "Opera"

brewcaskinstall "Utilities/Adobe Flash Player Install Manager" "flash"
brewcaskinstall "/Library/Internet Plug-Ins/googletalkbrowserplugin.plugin" "google-hangouts"
