#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f $BASH_SOURCE[0]))
BASEDIR=$SCRIPT_DIR/..

source $SCRIPT_DIR/setenv.sh


mkdir $BASEDIR/logs  >/dev/null 2>&1


function batchProcess(){
  local file=$1
  output=$("$FEDORA_DIR/client/bin/fedora-modify.sh" \
                      "$SERVER" "$USER" "$PASS" \
                      "$file" \
                      "$BASEDIR/logs/$(basename $(dirname $file))-$(basename $file .xml).log" \
                      http false 2>&1)
  echo "$output" | grep "0 modify directives failed." > /dev/null
  returnvalue=$?
  if [ $returnvalue -eq 0 ]; then
	#rm $BASEDIR/logs/$(basename $(dirname $file))-$(basename $file .xml).log
	return 0
  else
    #echo "$output"
	echo "Failed for $file"
	return $returnvalue
  fi

}

function waitBackground(){
    local FAIL=0
    for job in $(jobs -p); do
        wait $job || let "FAIL+=1"
    done
    #echo $FAIL
}

function create(){
    echo "If the objects are already there, this will report failures. Just ignore them"
    echo "If the objects are not already there, these errors are important."
    for file in $(ls $DIR/*/create.xml); do
        batchProcess $file &
    done
    waitBackground
}

function setContent(){
    for file in $(ls $DIR/*/setContent.xml); do
        batchProcess $file &
    done
    waitBackground
}

function publish(){
    for file in $(ls $DIR/*/publish.xml); do
        batchProcess $file &
    done
    waitBackground
}