#!/bin/zsh

if [[ "`command -v \"git\"`" != "/usr/local/bin/git" ]]
then
  echo_title_install "Git"
  brewinstall git
fi

if ! type hub > /dev/null
then
  echo_title_install "GitHub cli tools"
  brewinstall hub
fi

if ! type ghi > /dev/null
then
  echo_title_install "GitHub issues cli tools"
  brewinstall ghi
fi

brewcaskinstall "GitHub" $HOME/Applications
