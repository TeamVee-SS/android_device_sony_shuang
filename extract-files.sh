#!/bin/bash
DEVICE=falconss
VENDOR=sony
BASE=../../../vendor/${VENDOR}/${DEVICE}/proprietary

rm -rf ${BASE}/*

if [ -d ../system ]; then
  SRC="../"
fi

if [ "$#" == "0" ]; then
  if [ -d ../system ]; then
    SRC=".."
  else
    SRC="adb"
  fi
else
  if [ "$#" == "1" ]; then
    SRC="$1"
  else
    echo "$0: bad number of arguments"
    echo ""
    echo "usage: $0 [PATH_TO_EXPANDED_ROM]"
    echo ""
    echo "If PATH_TO_EXPANDED_ROM is not specified, blobs"
    echo "will be extracted from the device using adb pull."
    exit 1
  fi
fi

for FILE in $(grep -v ^# ../${DEVICE}/proprietary-files.txt | grep -v ^$ | sort)
do
  # Split the file from the destination (format is "file[:destination]")
  OLDIFS=${IFS} IFS=":" PARSING_ARRAY=(${FILE}) IFS=${OLDIFS}
  FILE=${PARSING_ARRAY[0]}
  DEST=${PARSING_ARRAY[1]}
  if [[ "${FILE}" =~ ^-.* ]]; then
    FILE=$(echo ${FILE} | sed s/^-//)
  fi
  if [ -z "${DEST}" ]; then
    DEST=${FILE}
  fi
  DIR=$(dirname ${DEST})

  if [ ! -d ${BASE}/${DIR} ]; then
    mkdir -p ${BASE}/${DIR}
  fi
  if [ "${SRC}" == "adb" ]; then
    adb pull /system/${FILE} ${BASE}/${DEST}
    if [ "$?" != "0" ]; then
      adb pull /system/${DEST} ${BASE}/${DEST}
    fi
  else
    cp ${SRC}/system/${FILE} ${BASE}/${DEST}
    if [ "$?" != "0" ]; then
      cp ${SRC}/system/${DEST} ${BASE}/${DEST}
      if [ "$?" != "0" ]; then
        cp ${SRC}/${FILE} ${BASE}/${DEST}
        if [ "$?" != "0" ]; then
          cp ${SRC}/${DEST} ${BASE}/${DEST}
        fi
      fi
    fi
  fi
done

. ../${DEVICE}/setup-makefiles.sh
