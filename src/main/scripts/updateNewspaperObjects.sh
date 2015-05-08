#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/common.sh
#
# Ingest initial objects
#
echo "UPDATING Newspaper doms objects"

DIR="$BASEDIR/scripts/NewspaperDatamodel/"

for file in $(ls $DIR/*/setContent.xml); do
    batchProcess $file
done


for file in $(ls $DIR/*/publish.xml); do
    batchProcess $file
done



echo "There should be no undeclared errors in this result. If there are, something has failed."
echo ""
echo ""



