#!/bin/sh
# Double-clickable setup, for the Dock and for the notification click.
#
# Terminal runs a .command file in a window of its own, with a real terminal on
# stdin, so the questions setup asks still work. Opening a Terminal through
# `open` rather than through `tell application "Terminal"` is also what keeps
# Setup.app from needing an Automation permission.
cd "$(dirname "$0")/.." || exit 1
exec ./setup
