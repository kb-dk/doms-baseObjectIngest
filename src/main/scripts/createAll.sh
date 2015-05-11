#!/bin/bash

if [ ! "$1" == "-q" ]; then
    echo "This script should only ever be run on fresh installs of DOMS."
    echo "(You can skip this prompt with the option -q)"
    echo -n "Type \"y\" to continue> "
    read cont
    if [ ! "$cont" == "y" ]; then
        echo "Exiting..."
        exit 1
    fi
fi

SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))

$SCRIPT_DIR/createBasicObjects.sh
$SCRIPT_DIR/createRadioTVObjects.sh
$SCRIPT_DIR/createReklamefilmObjects.sh
$SCRIPT_DIR/createNewspaperObjects.sh