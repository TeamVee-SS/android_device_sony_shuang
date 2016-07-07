#!/bin/bash
DEVICE=falconss
VENDOR=sony
BASE=../../../vendor/${VENDOR}/${DEVICE}/proprietary

for FILE in `grep -v ^# ../${DEVICE}/proprietary-files.txt | grep -v ^$ | sort`
do
  # Split the file from the destination (format is "file[:destination]")
  OLDIFS=${IFS} IFS=":" PARSING_ARRAY=(${FILE}) IFS=${OLDIFS}
  FILE=${PARSING_ARRAY[0]}
  DEST=${PARSING_ARRAY[1]}
  if [[ "${FILE}" =~ ^-.* ]]; then
    FILE=`echo ${FILE} | sed s/^-//`
  fi
  if [ -z "${DEST}" ]; then
    DEST=${FILE}
  fi
  DIR=`dirname ${DEST}`
  if [ ! -d ${BASE}/${DIR} ]; then
    mkdir -p ${BASE}/${DIR}
  fi

  cp ../system/${FILE} ${BASE}/${DEST}
  if [ "$?" != "0" ]; then
    adb pull /system/${FILE} ${BASE}/${DEST}
  fi
  if [ "$?" != "0" ]; then
    adb pull /system/${DEST} ${BASE}/${DEST}
  fi
done

. setup-makefiles.sh
