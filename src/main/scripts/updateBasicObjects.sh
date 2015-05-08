#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..


source $SCRIPT_DIR/common.sh
#
# Ingest initial objects
#
echo "UPDATING base doms objects"

for file in $(ls $BASEDIR/scripts/BasicDatamodel/*/setContent.xml); do
    batchProcess $file
done

for file in $(ls $BASEDIR/scripts/BasicDatamodel/*/publish.xml); do
    batchProcess $file
done



echo "There should be no errors in this result. If there are, something has failed."
echo ""
echo ""


