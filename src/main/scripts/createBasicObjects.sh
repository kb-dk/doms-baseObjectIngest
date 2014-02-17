#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/common.sh
#
# Ingest initial objects
#
echo "Creating base doms objects"

for file in $(ls $BASEDIR/scripts/BasicDatamodel/*/create.xml); do
    batchProcess $file
    if [ $? -ne 0 ]; then
        echo "If the object is already there, this will report failures. Just ignore them"
        echo "If the object is not already there, these errors are important."
    fi
done

for file in $(ls $BASEDIR/scripts/BasicDatamodel/*/setContent.xml); do
    batchProcess $file
done
echo "Expect the ContentModel_File to report an error"


for file in $(ls $BASEDIR/scripts/BasicDatamodel/*/publish.xml); do
    batchProcess $file
done



echo "There should be no undeclared errors in this result. If there are, something has failed."
echo ""
echo ""



