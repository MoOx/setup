#!/bin/zsh

###
# Prey project
###
if [ ! -e "/usr/share/prey/prey.sh" ]
then
	echo_title "Installing Prey project tracker, we will need you Prey API_KEY"
	echo_info "Please login into your Prey account to get your API key & paste it (or just type enter to bypass the install):"
	open "https://panel.preyproject.com/profile"
	read API_KEY
	if [ "$API_KEY" != "" ]; then
		API_KEY="$API_KEY" brew cask install prey --force
	fi
fi
