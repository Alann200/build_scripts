#!/bin/bash

#
# Copyright (c) 2017 - 2018 TeamWin Recovery | MediaTek
# https://github.com/twrp-mtk
#

# Don't touch this
export VERSION=$( grep "TW_MAIN_VERSION_STR" bootable/recovery/variables.h -m 1 | cut -d \" -f2 )-${TW_DEVICE_VERSION}
export OUT_LOG="twrp-${VERSION}-${DEVICE}.log"
export OUT_PATH="out/target/product/${DEVICE}"
export OUT_RECOVERY_IMAGE="twrp-${VERSION}-${DEVICE}.img"

# Clonning the tree
git clone https://github.com/twrp-mtk/android_device_${BRAND}_${DEVICE}.git -b ${BRANCH} device/${BRAND}/${DEVICE}

# Setting the build environment
source build/envsetup.sh

# Setting the device
lunch omni_${DEVICE}-eng

# Building the TWRP
mka recoveryimage | tee -a ${OUT_LOG}

# Checking if the build was successful
cd ${OUT_PATH}
if [ -f "recovery.img" ]
then
  mv recovery.img ${OUT_RECOVERY_IMAGE}
  cd ../../../..
  echo "$(date +%Y%m%d-%H%M)-${OUT_RECOVERY_IMAGE}-SUCCESSFUL" >> ${BUILD_TWRP_LOG}
  if [ -f "ftp-afh.sh" ]
  then
    bash ftp-afh.sh
  else
    mv ${OUT_PATH}/${OUT_RECOVERY_IMAGE} $(pwd)/Compiled
  fi
  rm ${OUT_LOG}
  make clean
  cd device
  rm -rf ${BRAND}
  cd ..
else
  echo "$(date +%Y%m%d-%H%M)-${OUT_RECOVERY_IMAGE}-FAILED" >> ${BUILD_TWRP_LOG}
  echo "FAILED" > tmp/tmp-${OUT_RECOVERY_IMAGE}
  rm ${OUT_LOG}
  make clean
  cd device
  rm -rf ${BRAND}
  cd ..
  echo ""
  echo "********************************************************************************"
  echo " Something went wrong during the build process, try checking your device tree."
  echo " After that, run the script again and see if you messed up something new or not."
  echo "********************************************************************************"
  echo ""
fi
