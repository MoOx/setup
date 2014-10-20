#!/bin/zsh

# php
command -v brew > /dev/null && export PHP_PATH="$(brew --prefix php55)"
export PATH="$PHP_PATH/bin:$PATH"
alias phpini="e /usr/local/etc/php/5.5/php.ini"
