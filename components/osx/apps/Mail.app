#!/bin/zsh

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

# Display emails in threaded mode, sorted by date (oldest at the top)
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

defaults write com.apple.mail "NSToolbar Configuration MainWindow" -dict \
	"TB Default Item Identifiers" '("checkNewMail:","showComposeWindow:",NSToolbarSpaceItem,NSToolbarFlexibleSpaceItem,"delete_junk","reply_replyAll_forward",FlaggedStatus,NSToolbarFlexibleSpaceItem,Search)' \
	"TB Display Mode" 2 \
	"TB Icon Size Mode" 1 \
	"TB Is Shown" 1 \
	"TB Item Identifiers" '("deleteMessages:",NSToolbarFlexibleSpaceItem,NSToolbarSpaceItem,"orderFrontColorPanel:",NSToolbarFlexibleSpaceItem,"showComposeWindow:","checkNewMail:",NSToolbarSpaceItem,"reply_replyAll_forward","moveMessagesFromToolbar:",NSToolbarSpaceItem,"addSenderToContacts:","showAllHeaders:",NSToolbarFlexibleSpaceItem,Search)' \
	"TB Size Mode" 1
