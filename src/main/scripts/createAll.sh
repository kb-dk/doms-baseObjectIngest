#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))

$SCRIPT_DIR/createBasicObjects.sh
$SCRIPT_DIR/createRadioTVObjects.sh
$SCRIPT_DIR/createReklamefilmObjects.sh
$SCRIPT_DIR/createNewspaperObjects.sh