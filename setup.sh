#!/bin/sh

#TODO add xinitrc in there
FILES=(vimrc bashrc muttrc)

CURR_FILE=lol

for i in ${!FILES[@]}; do
	CURR_FILE=${FILES[i]}
	echo ./config_files/$CURR_FILE
	echo $HOME/.$CURR_FILE
#	ln -is ./configs_files/$CURR_FILE $HOME/.$CURR_FILE
done

