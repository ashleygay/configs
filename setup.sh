#!/bin/sh

#TODO add xinitrc in there
FILES=(vimrc bashrc muttrc dircolors xinitrc)

CURR_FILE=lol

for i in ${!FILES[@]}; do
	CURR_FILE=${FILES[i]}
	ln -i ./config_files/$CURR_FILE $HOME/.$CURR_FILE
done

