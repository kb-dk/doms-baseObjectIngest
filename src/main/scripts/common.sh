#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/setenv.sh


mkdir $BASEDIR/logs  >/dev/null 2>&1


function batchProcess(){
  local file=$1
  output=$($FEDORA_DIR/client/bin/fedora-modify.sh \
                      $SERVER $USER $PASS \
                      $file \
                      $BASEDIR/logs/$(basename $(dirname $file))-$(basename $file .xml).log \
                      http false 2>&1)
  echo "$output" | grep "0 modify directives failed." > /dev/null
  if [ $? -eq 0 ]; then
	rm $BASEDIR/logs/$(basename $(dirname $file))-$(basename $file .xml).log  
  else
	echo "Failed for $file"
  fi

}