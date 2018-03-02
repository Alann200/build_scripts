#!/bin/bash

#
# Copyright (c) 2017 - 2018 TeamWin Recovery | MediaTek
# https://github.com/twrp-mtk
#

# Don't touch this
DEVICE="$1"
LOG="$2"
CLEAN="$3"
ARG_COUNT="$#"

if [ $ARG_COUNT -lt "3" ]
then
  echo "Not enough arguments were specified, run the script again with proper arguments"
  exit 1
fi

export TW_DEVICE_VERSION="0"
export VERSION=$( grep "TW_MAIN_VERSION_STR" bootable/recovery/variables.h -m 1 | cut -d \" -f2 )-${TW_DEVICE_VERSION}
export OUT_LOG="twrp-${VERSION}-${DEVICE}.log"
export OUT_PATH="out/target/product/${DEVICE}"
export OUT_RECOVERY_IMAGE="twrp-${VERSION}-${DEVICE}.img"

# Clean build
if [ "$CLEAN" == "--clean" ]
then
  make clean
fi

# Setting the build environment
source build/envsetup.sh

# Setting the device
lunch omni_${DEVICE}-eng

# Building the TWRP
if [ "$LOG" == "--log" ]
then
  mka recoveryimage | tee -a ${OUT_LOG}
else
  mka recoveryimage
fi

# Checking if the build was successful
cd ${OUT_PATH}
if [ -f "recovery.img" ]
then
  mv recovery.img ${OUT_RECOVERY_IMAGE}
  cd ../../../..
  echo ""
  echo "******************************************************************************"
  echo ""
  echo " TeamWin Recovery ${VERSION} has been successfuly built for device ${DEVICE}!"
  echo ""
  echo " TeamWin Recovery version : ${VERSION}"
  echo " TeamWin Recovery image   : $OUT_PATH/${OUT_RECOVERY_IMAGE}"

  if [ "$LOG" == "--log" ]
  then
    echo " Build log                : ${OUT_LOG}"
  fi
  
  echo ""
  echo "******************************************************************************"
  echo ""
else
  rm ${OUT_LOG}
  make clean
  echo ""
  echo "********************************************************************************"
  echo " Something went wrong during the build process, try checking your device tree."
  echo " After that, run the script again and see if you messed up something new or not."
  echo "********************************************************************************"
  echo ""
fi

# Unsetting variables
unset TW_DEVICE_VERSION
unset DEVICE
unset VERSION
unset OUT_PATH
unset OUT_LOG
unset OUT_RECOVERY_IMAGE
unset LOG
unset CLEAN
unset ARG_COUNT
