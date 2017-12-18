#!/bin/bash

#
# Copyright (C) 2017 Liquid Porting & Development
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Don't touch this
export VERSION=$( grep "TW_MAIN_VERSION_STR" bootable/recovery/variables.h -m 1 | cut -d \" -f2 )-${TW_DEVICE_VERSION}
export OUT_LOG="twrp-${VERSION}-${DEVICE}.log"
export OUT_PATH="out/target/product/${DEVICE}"
export OUT_RECOVERY_IMAGE="twrp-${VERSION}-${DEVICE}.img"

# Clonning the tree
git clone https://github.com/liquidporting/android_device_${BRAND}_${DEVICE}.git -b ${BRANCH} device/${BRAND}/${DEVICE}

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
  echo "$(date +%Y%m%d-%H%M)-${OUT_RECOVERY_IMAGE}-SUCCESSFUL" >> ${LPAD_TWRP_LOG}
  if [ -f "ftp-afh.sh" ]
  then
    bash ftp-afh.sh
  else
    megarm /Root/LPAD/TWRP/${OUT_RECOVERY_IMAGE}
    megarm /Root/LPAD/TWRP/${OUT_LOG}
    megaput --no-progress --path /Root/LPAD/TWRP ${OUT_PATH}/${OUT_RECOVERY_IMAGE}
    megaput --no-progress --path /Root/LPAD/TWRP ${OUT_LOG}
  fi
  rm ${OUT_LOG}
  make clean
  cd device
  rm -rf ${BRAND}
  cd ..
else
  echo "$(date +%Y%m%d-%H%M)-${OUT_RECOVERY_IMAGE}-FAILED" >> ${LPAD_TWRP_LOG}
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
