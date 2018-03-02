#!/bin/bash

#
# Copyright (c) 2017 - 2018 TeamWin Recovery | MediaTek
# https://github.com/twrp-mtk
#

# Variables
export TW_DEVICE_VERSION="0"
export BRANCH="android-5.1"
export BUILD_TWRP_LOG="build-twrp-$(date +%Y%m%d).log"

mkdir tmp
mkdir Compiled

# Log generator
echo "" >> ${BUILD_TWRP_LOG}
echo " Build results for each device" >> ${BUILD_TWRP_LOG}
echo "*****************************************************" >> ${BUILD_TWRP_LOG}
echo "" >> ${BUILD_TWRP_LOG}
echo " Build date  : $(date +"%d/%m/%Y %H:%M:%S")" >> ${BUILD_TWRP_LOG}
echo " Compiled on : $(hostname)" >> ${BUILD_TWRP_LOG}
echo " Maintainer  : $(whoami)" >> ${BUILD_TWRP_LOG}
echo "" >> ${BUILD_TWRP_LOG}
echo "*****************************************************" >> ${BUILD_TWRP_LOG}
echo "" >> ${BUILD_TWRP_LOG}

# Acer Liquid Z500
export BRAND="acer"
export DEVICE="acer_Z500"
bash twrp-all.sh

# Lenovo A328
export BRAND="lenovo"
export DEVICE="A328"
bash twrp-all.sh

# Acer Liquid Z520
export BRAND="acer"
export DEVICE="acer_Z520"
bash twrp-all.sh

# Huawei Honor 3C Lite
export BRAND="huawei"
export DEVICE="holly"
bash twrp-all.sh

# Cherry Mobile Me Vibe
export BRAND="cherry"
export DEVICE="X170"
bash twrp-all.sh

# Lava Iris X8
export BRAND="lava"
export DEVICE="irisX8"
bash twrp-all.sh

# Lenovo A536
export BRAND="lenovo"
export DEVICE="A536"
bash twrp-all.sh

# Micromax Canvas Selfie Lens Q345
export BRAND="micromax"
export DEVICE="Q345"
bash twrp-all.sh

# Oppo Neo 7
export BRAND="oppo"
export DEVICE="A33w"
bash twrp-all.sh

# Prestigio MultiPhone 5504 Duo
export BRAND="prestigio"
export DEVICE="PSP5504DUO"
bash twrp-all.sh

# QMobile X70
export BRAND="qmobile"
export DEVICE="J220"
bash twrp-all.sh

# Symphony Xplorer V80
export BRAND="symphony"
export DEVICE="V80"
bash twrp-all.sh

# XOLO Omega 5.5
export BRAND="xolo"
export DEVICE="omega_5_5"
bash twrp-all.sh

# Intex Aqua Power HD
export BRAND="intex"
export DEVICE="Aqua_Power_HD"
bash twrp-all.sh

# HTC Desire 620G
export BRAND="htc"
export DEVICE="htc_a31mg_dug"
bash twrp-all.sh

# Xiaomi Redmi Note 3G
export BRAND="xiaomi"
export DEVICE="lcsh92_wet_jb9"
bash twrp-all.sh

# Lenovo S860
export BRAND="lenovo"
export DEVICE="S860"
bash twrp-all.sh

# Kingzone K1 Turbo
export BRAND="kingzone"
export DEVICE="K1_turbo"
bash twrp-all.sh

# LG G3 Stylus
export BRAND="lge"
export DEVICE="b2lss"
bash twrp-all.sh

# HTC Desire 816G
export BRAND="htc"
export DEVICE="htc_a5mgp_dug"
bash twrp-all.sh

# Xiaomi Redmi 1S TD
export BRAND="xiaomi"
export DEVICE="HM2014011"
bash twrp-all.sh

# Gionee M2
export BRAND="gionee"
export DEVICE="WBW5506"
bash twrp-all.sh

# Micromax Canvas Hue
export BRAND="micromax"
export DEVICE="AQ5000"
bash twrp-all.sh

# Doogee X5
export BRAND="doogee"
export DEVICE="X5"
bash twrp-all.sh

# Infinix Zero 2 X509
export BRAND="infinix"
export DEVICE="Infinix_X509"
bash twrp-all.sh

# Acer One 7
export BRAND="acer"
export DEVICE="elink8321_tb_m"
bash twrp-all.sh

# Count all build errors from the "tmp" directory
cd tmp
export ERROR_COUNT=$(ls -A | wc -l)
cd ..
rm -rf tmp
echo "" >> ${BUILD_TWRP_LOG}
echo "Total error count during the build: ${ERROR_COUNT}" >> ${BUILD_TWRP_LOG}

if [ "$ERROR_COUNT" == "1"]
then
  echo ""
  echo "*******************************************************************************************************"
  echo " The compilation has ended with ${ERROR_COUNT} error, see the log (${BUILD_TWRP_LOG})"
  echo "*******************************************************************************************************"
  echo ""
else
  echo ""
  echo "*******************************************************************************************************"
  echo " The compilation has ended with ${ERROR_COUNT} errors, see the log (${BUILD_TWRP_LOG})"
  echo "*******************************************************************************************************"
  echo ""
fi

# Unsetting variables
unset TW_DEVICE_VERSION
unset VERSION
unset BRANCH
unset BUILD_TWRP_LOG
unset ERROR_COUNT
unset VERSION
unset DEVICE
unset BRAND
unset OUT_PATH
unset OUT_LOG
unset OUT_RECOVERY_IMAGE
