#!/bin/zsh

setup osx
setup git

setup node
setup _cli
setup ssh

setup synergy

setup slate

setup atom

setup sync
#setup cloud
#setup cloudup
setup grabbox
setup grabbox-cleanup

setup browsers

setup logitech

setup osx-enhancements

if [ "$FIRSTRUN" = "true" ]; then fuckosx; fi;

setup chat
setup multimedia

setup download

# not needed by default anymore
#setup dnsmasq
#setup apache
#setup php
#setup mysql

setup dyndns
setup prey

setup dock

if [ "$FIRSTRUN" = "true" ]; then fuckosx; fi;

# lazyload misc & big stuff
setup misc
