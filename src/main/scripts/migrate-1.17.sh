#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/common.sh
#
# Data model updates in 1.17
#
echo "Migrating to version 1.17"

$SCRIPT_DIR/createDPAObjects.sh
