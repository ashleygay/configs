#!/bin/bash

search_dir=`find ./config_files/ -maxdepth 1`

arr=(./config_files/.*)

for ((i=0; i<${#arr[@]}; i++)); do
    mod="$HOME/${arr[$i]#*/*/}"
    echo $mod
    ln -s ${arr[$i]} ~/$mod
done
