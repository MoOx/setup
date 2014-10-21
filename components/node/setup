#!/bin/zsh

if ! type node > /dev/null
then
  echo_title_install "Node.js"
  brewinstall node
fi

# https://github.com/npm/npm/issues/6521
#echo_title_installupdate "NPM global packages"
#npmug

# release tool
npmig mversion

# package helpers
npmig npm-check
npmig updatehammer
