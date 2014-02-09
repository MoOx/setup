#!/bin/zsh
export NODE_MODULES=/usr/local/lib/node_modules

# Faster npm for europeans
command -v npm > /dev/null && alias npme="npm --registry http://registry.npmjs.eu"
alias npmug="npm update -g --loglevel warn"
