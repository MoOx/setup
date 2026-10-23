#!/bin/sh
# Double-clickable setup, for the Dock and for the notification click.
# Ends in a shell so the window stays up and the prompt lands in the repo.
cd "$(dirname "$0")/.." || exit 1
./setup
exec "${SHELL:-/bin/zsh}" -l
