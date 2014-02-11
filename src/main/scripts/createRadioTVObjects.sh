#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..



source $SCRIPT_DIR/common.sh
#
# Ingest initial objects
#
echo "Creating base Radio TV objects"

DIR="$BASEDIR/scripts/RadioTVDatamodel"

create

source $SCRIPT_DIR/updateRadioTVObjects.sh
