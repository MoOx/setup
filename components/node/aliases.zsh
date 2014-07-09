#!/bin/zsh

# npme: faster npm for europeans
command -v npm > /dev/null && alias npme="npm --registry http://registry.npmjs.eu"

# global npm update
alias npmug="npm update -g --loglevel warn"
alias npmi="npm install"
alias npmr="npm run --silent"
alias npms="npmstart" # npmstart function
