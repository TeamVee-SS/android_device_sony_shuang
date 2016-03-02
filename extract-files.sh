#!/bin/bash

#set -e

TEMP="$1"

rm -rf ../../../vendor/sony/falconss/proprietary/*

for FILE in `egrep -v '(^#|^$)' proprietary-files.txt`; do
  OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
  FILE=`echo ${PARSING_ARRAY[0]} | sed -e "s/^-//g"`
  DEST=${PARSING_ARRAY[1]}
  if [ -z $DEST ]
  then
    DEST=$FILE
  fi
  DIR=`dirname $FILE`
  if [ ! -d ../../../vendor/sony/falconss/proprietary/$DIR ]; then
    mkdir -p ../../../vendor/sony/falconss/proprietary/$DIR
  fi
  # Use a local system folder to get files
  cp ../system/$FILE ../../../vendor/sony/falconss/proprietary/$FILE
  # if file does not exist try OEM target
  if [ "$?" != "0" ]
  then
    adb pull /system/$FILE ../../../vendor/sony/falconss/proprietary/$DEST
  fi
done

. setup-makefiles.sh
