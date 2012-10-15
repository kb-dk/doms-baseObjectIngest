#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))

BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/setenv.sh


mkdir $BASEDIR/logs  >/dev/null 2>&1

#
# Ingest initial objects
#
echo "UPDATING base doms objects"

for file in $(ls $BASEDIR/scripts/BasicDatamodel/*/setContent.xml); do
    sh $FEDORA_DIR/client/bin/fedora-modify.sh \
                    $SERVER $USER $PASS \
                    $file \
                    $BASEDIR/logs/$(basename $(dirname $file)).log \
                    http false
done



echo "There should be no errors in this result. If there are, something has failed."
echo ""
echo ""


