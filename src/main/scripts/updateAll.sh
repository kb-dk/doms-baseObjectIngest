#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))

$SCRIPT_DIR/updateBasicObjects.sh
$SCRIPT_DIR/updateRadioTVObjects.sh
$SCRIPT_DIR/updateReklamefilmObjects.sh
