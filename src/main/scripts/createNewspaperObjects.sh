#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/common.sh
#
# Ingest initial objects
#
echo "Creating Newspaper doms objects"


DIR="$BASEDIR/scripts/NewspaperDatamodel/"

create

source $SCRIPT_DIR/updateNewspaperObjects.sh

