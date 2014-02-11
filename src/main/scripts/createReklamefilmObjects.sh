#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..



source $SCRIPT_DIR/common.sh
#
# Ingest initial objects
#
echo "Creating base Reklamefilm objects"

DIR="$BASEDIR/scripts/ReklamefilmDatamodel"

create

source $SCRIPT_DIR/updateReklamefilmObjects.sh
