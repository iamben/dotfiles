#!/bin/sh
repo="`pwd | awk -F/ '{ print $NF }'`"

if [ -z "$1" ]; then
    echo "Usage: Link.sh <action>"
    echo "action: (c)reate/(r)emove"
    echo "Repo = $repo"
    exit
fi

for link in `cat links`; do
    if [ "$1" = "c" ]; then
	echo "Linking $link ..."
	ln -s ~/$repo/$link ~/$link
    elif [ "$1" = "r" ]; then
	echo "Removing $link ..."
	unlink ~/$link
    else
	exit
    fi
done
