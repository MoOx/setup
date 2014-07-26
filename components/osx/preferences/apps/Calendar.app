#!/bin/zsh

# day start 9:00, end at 18:00
defaults write com.apple.iCal "first minute of work hours" $((9 * 60))
defaults write com.apple.iCal "last minute of work hours" $((18 * 60))

defaults write com.apple.iCal "first minute of day time range" 0
defaults write com.apple.iCal "last minute of day time range" $((24 * 60))

defaults write com.apple.iCal "n days of week" 7

defaults write com.apple.iCal "number of hours displayed" 18

defaults write com.apple.iCal lastViewsTimeZone "Europe/Paris"
defaults write com.apple.iCal "TimeZone support enabled" -bool true
