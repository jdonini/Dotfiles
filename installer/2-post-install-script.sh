#!/bin/sh

# Intended to be ran as user from ~/
# Have Dotfiles folder cloned to ~/ before running script
# Not to be run until base-install.sh has been run first


## This installer script:
##		* installs yay package manager
##		* uses yay to install all packages
##		* sets up some configurations for my system
##		* sets up user system services necessary for my system

# Install all packages
yay -Syu - < ~/Dotfiles/installer/installed-packages/packages-for-script.txt
