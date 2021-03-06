#!/bin/env bash

path=~/.config/zathura
if [ ! -d $path ]; then
    mkpath -p $path
fi

# delete invalid soft link
for file in $(find $path -type l)
do
    if [ ! -e $file ]
    then
        echo "rm $file"
        rm -f $file
    fi
done

softlink=${path}/zathurarc
curdir="$( cd "$( dirname "$0" )" && pwd )"


if [ ! -L $softlink ]; then
    cd $path
    ln -sb $curdir/zathurarc zathurarc
fi
