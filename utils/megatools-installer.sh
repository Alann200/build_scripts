#!/bin/bash

#
# Copyright (c) 2017 - 2018 TeamWin Recovery | MediaTek
# https://github.com/twrp-mtk
#

cd ~
sudo apt-get update
sudo apt-get install -y libtool libglib2.0-dev gobject-introspection libgmp3-dev nettle-dev asciidoc glib-networking openssl libcurl4-openssl-dev libssl-dev
wget http://megatools.megous.com/builds/megatools-1.9.98.tar.gz
zcat megatools-1.9.98.tar.gz > megatools-1.9.98.tar
tar -xf megatools-1.9.98.tar
rm megatools-1.9.98.tar.gz
rm megatools-1.9.98.tar
mv megatools-1.9.98 MEGA
cd MEGA
./configure
make
sudo make install
touch ~/.megarc
read -p "Do you have Mega account already?: (Yes or No)" Input
if [ "$Input" = Yes ]
then
echo [Login] >> ~/.megarc
read -p "Enter Your Email: " EMAIL
echo Username = $EMAIL >> ~/.megarc
read -p "Enter Your Password: " Password
echo Password = $Password >> ~/.megarc
cd ~
clear && clear scrollback
echo MEGA is now fully set-up on your Linux computer
fi

if [ "$Input" = No ]
then
echo Make an Mega Account! Link: https://mega.nz/register
fi
