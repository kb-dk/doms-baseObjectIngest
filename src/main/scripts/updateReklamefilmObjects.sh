#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/common.sh
#
# Ingest initial objects
#
echo "UPDATING base doms objects"

DIR="$BASEDIR/scripts/ReklamefilmDatamodel"

setContent
publish

echo "There should be no errors in this result. If there are, something has failed."
echo ""
echo ""


