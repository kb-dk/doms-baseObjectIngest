#!/bin/bash


SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/common.sh
#
# Data model updates in 1.16
#
echo "Migrating to version 1.16"

psql domsUpdateTracker -c "delete from memberships where viewangle = 'SummaVisible' and objectpid in (select distinct entrypid from records where viewangle='SummaAuthority');"

echo "There should be no undeclared errors in this result. If there are, something has failed."
echo ""
echo ""
