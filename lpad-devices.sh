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

# Variables
export TW_DEVICE_VERSION="0"
export BRANCH="android-5.1"
export LPAD_TWRP_LOG="lpad-twrp-$(date +%Y%m%d).log"

mkdir tmp

# Log generator
echo "" >> ${LPAD_TWRP_LOG}
echo " Build results for each device" >> ${LPAD_TWRP_LOG}
echo "*****************************************************" >> ${LPAD_TWRP_LOG}
echo "" >> ${LPAD_TWRP_LOG}
echo " Build date  : $(date +"%d/%m/%Y %H:%M:%S")" >> ${LPAD_TWRP_LOG}
echo " Compiled on : $(hostname)" >> ${LPAD_TWRP_LOG}
echo " Maintainer  : $(whoami)" >> ${LPAD_TWRP_LOG}
echo "" >> ${LPAD_TWRP_LOG}
echo "*****************************************************" >> ${LPAD_TWRP_LOG}
echo "" >> ${LPAD_TWRP_LOG}

# Acer Liquid Z500
export BRAND="acer"
export DEVICE="acer_Z500"
bash lpad-twrp.sh

# Lenovo A328
export BRAND="lenovo"
export DEVICE="A328"
bash lpad-twrp.sh

# Acer Liquid Z520
export BRAND="acer"
export DEVICE="acer_Z520"
bash lpad-twrp.sh

# Huawei Honor 3C Lite
export BRAND="huawei"
export DEVICE="holly"
bash lpad-twrp.sh

# Cherry Mobile Me Vibe
export BRAND="cherry"
export DEVICE="X170"
bash lpad-twrp.sh

# Lava Iris X8
export BRAND="lava"
export DEVICE="irisX8"
bash lpad-twrp.sh

# Lenovo A536
export BRAND="lenovo"
export DEVICE="A536"
bash lpad-twrp.sh

# Micromax Canvas Selfie Lens Q345
export BRAND="micromax"
export DEVICE="Q345"
bash lpad-twrp.sh

# Oppo Neo 7
export BRAND="oppo"
export DEVICE="A33w"
bash lpad-twrp.sh

# Prestigio MultiPhone 5504 Duo
export BRAND="prestigio"
export DEVICE="PSP5504DUO"
bash lpad-twrp.sh

# QMobile X70
export BRAND="qmobile"
export DEVICE="J220"
bash lpad-twrp.sh

# Symphony Xplorer V80
export BRAND="symphony"
export DEVICE="V80"
bash lpad-twrp.sh

# XOLO Omega 5.5
export BRAND="xolo"
export DEVICE="omega_5_5"
bash lpad-twrp.sh

# Intex Aqua Power HD
export BRAND="intex"
export DEVICE="Aqua_Power_HD"
bash lpad-twrp.sh

# HTC Desire 620G
export BRAND="htc"
export DEVICE="htc_a31mg_dug"
bash lpad-twrp.sh

# Xiaomi Redmi Note 3G
export BRAND="xiaomi"
export DEVICE="lcsh92_wet_jb9"
bash lpad-twrp.sh

# Lenovo S860
export BRAND="lenovo"
export DEVICE="S860"
bash lpad-twrp.sh

# Kingzone K1 Turbo
export BRAND="kingzone"
export DEVICE="K1_turbo"
bash lpad-twrp.sh

# LG G3 Stylus
export BRAND="lge"
export DEVICE="b2lss"
bash lpad-twrp.sh

# HTC Desire 816G
export BRAND="htc"
export DEVICE="htc_a5mgp_dug"
bash lpad-twrp.sh

# Xiaomi Redmi 1S TD
export BRAND="xiaomi"
export DEVICE="HM2014011"
bash lpad-twrp.sh

# Gionee M2
export BRAND="gionee"
export DEVICE="WBW5506"
bash lpad-twrp.sh

# Micromax Canvas Hue
export BRAND="micromax"
export DEVICE="AQ5000"
bash lpad-twrp.sh

# Doogee X5
export BRAND="doogee"
export DEVICE="X5"
bash lpad-twrp.sh

# Infinix Zero 2 X509
export BRAND="infinix"
export DEVICE="Infinix_X509"
bash lpad-twrp.sh

# Count all build errors from the "tmp" directory
cd tmp
export ERROR_COUNT=$(ls -A | wc -l)
cd ..
rm -rf tmp
echo "" >> ${LPAD_TWRP_LOG}
echo "Total error count during the build: ${ERROR_COUNT}" >> ${LPAD_TWRP_LOG}

if [ "$ERROR_COUNT" == "1"]
then
  echo ""
  echo "*******************************************************************************************************"
  echo " The compilation has ended with ${ERROR_COUNT} error, see the log (${LPAD_TWRP_LOG})"
  echo "*******************************************************************************************************"
  echo ""
else
  echo ""
  echo "*******************************************************************************************************"
  echo " The compilation has ended with ${ERROR_COUNT} errors, see the log (${LPAD_TWRP_LOG})"
  echo "*******************************************************************************************************"
  echo ""
fi

# Unsetting variables
unset TW_DEVICE_VERSION
unset VERSION
unset BRANCH
unset LPAD_TWRP_LOG
unset ERROR_COUNT
unset VERSION
unset DEVICE
unset BRAND
unset OUT_PATH
unset OUT_LOG
unset OUT_RECOVERY_IMAGE