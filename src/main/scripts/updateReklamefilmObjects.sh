#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/common.sh
#
# Ingest initial objects
#
echo "UPDATING Reklamefilm doms objects"

# No new objects since last release. If there are, add the new objects like this:
# batchProcess $BASEDIR/scripts/ReklamefilmDatamodel/ContentModel_Reklamefilm/create.xml
# batchProcess $BASEDIR/scripts/ReklamefilmDatamodel/ContentModel_Reklamefilm/setContent.xml
# batchProcess $BASEDIR/scripts/ReklamefilmDatamodel/ContentModel_Reklamefilm/publish.xml

# No changed objects since last release. If there are, add the changed objects like this:
# batchProcess $BASEDIR/scripts/ReklamefilmDatamodel/ContentModel_Reklamefilm/setContent.xml
# batchProcess $BASEDIR/scripts/ReklamefilmDatamodel/ContentModel_Reklamefilm/publish.xml

echo "There should be no errors in this result. If there are, something has failed."
echo ""
echo ""


