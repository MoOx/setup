#!/bin/zsh

export APACHE_CONF="/etc/apache2/httpd.conf"
export APACHE_CONF_DEV_PATH="$DIR_DEV/_.conf/apache/"
alias apacheconf="e $APACHE_CONF"
alias apachedevconf="e $APACHE_CONF_DEV_PATH"
alias apacheconfigtest="apachectl configtest"
alias apachestart="sudo apachectl start"
alias apacherestart="flushdns && sudo apachectl restart"

alias apacheaddconf="e $APACHE_CONF_DEV_PATH/local.conf /etc/hosts"

# nginx
# alias nginx="sudo nginx"
# alias nginxreload="nginx -s reload"
# alias nr="nginxreload"

# php
command -v brew > /dev/null && export PHP_PATH="$(brew --prefix php55)"
export PATH="$PHP_PATH/bin:$PATH"
alias phpini="e /usr/local/etc/php/5.5/php.ini"

# MySQL (from brew)
alias mysqlstart="mysql.server start"
alias mysqlstop="mysql.server stop"

# PostegreSQL (from brew)
# alias pgsqlstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
# alias pgsqlstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
