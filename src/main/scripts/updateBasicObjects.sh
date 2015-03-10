#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..


source $SCRIPT_DIR/common.sh
#
# Ingest initial objects
#
echo "UPDATING base doms objects"

# No new objects since last release. If there are, add the new objects like this:
# batchProcess $BASEDIR/scripts/BasicDatamodel/ContentModel_Item/create.xml
# batchProcess $BASEDIR/scripts/BasicDatamodel/ContentModel_Item/setContent.xml
# batchProcess $BASEDIR/scripts/BasicDatamodel/ContentModel_Item/publish.xml

# No changed objects since last release. If there are, add the changed objects like this:
# batchProcess $BASEDIR/scripts/BasicDatamodel/ContentModel_Item/setContent.xml
# batchProcess $BASEDIR/scripts/BasicDatamodel/ContentModel_Item/publish.xml

echo "There should be no errors in this result. If there are, something has failed."
echo ""
echo ""


