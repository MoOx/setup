#!/bin/zsh

# Apache configuration
if ! cat $APACHE_CONF | grep $APACHE_CONF_DEV_PATH > /dev/null
then
  if ls $APACHE_CONF_DEV_PATH &> /dev/null
  then
    echo_title "Configuring OS X Apache"
    echo "\nInclude $APACHE_CONF_DEV_PATH/*.conf" | sudo tee -a $APACHE_CONF
    apacheconfigtest
    apacherestart
  fi
fi
