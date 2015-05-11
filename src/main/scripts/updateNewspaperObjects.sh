#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/common.sh
#
# Ingest initial objects
#
echo "UPDATING Newspaper doms objects"

DIR="$BASEDIR/scripts/NewspaperDatamodel/"

# No new objects since last release. If there are, add the new objects like this:
# batchProcess $DIR/ContentModel_Batch/create.xml
# batchProcess $DIR/ContentModel_Batch/setContent.xml
# batchProcess $DIR/ContentModel_Batch/publish.xml

# No changed objects since last release. If there are, add the changed objects like this:
# batchProcess $DIR/ContentModel_Batch/setContent.xml
# batchProcess $DIR/ContentModel_Batch/publish.xml

echo "There should be no undeclared errors in this result. If there are, something has failed."
echo ""
echo ""



