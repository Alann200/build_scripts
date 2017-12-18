#!/bin/bash

#
# Copyright (C) 2017 Liquid Porting & Development & megous
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
echo [Login] >> ~/.megarc
echo Username = your@email >> ~/.megarc
echo Password = yourpassword >> ~/.megarc
nano ~/.megarc
cd ~
clear && clear scrollback
echo MEGA is now fully set-up on your Linux computer
