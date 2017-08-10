#!/bin/sh

FILES=(vimrc bashrc muttrc dircolors xinitrc bash_profile)

CURR_FILE=lol

for i in ${!FILES[@]}; do
	CURR_FILE=${FILES[i]}
	ln -i ./config_files/$CURR_FILE $HOME/.$CURR_FILE
done

