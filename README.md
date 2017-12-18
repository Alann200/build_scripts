# Get started with scripts

> These scripts were made to help with building various Android ROMs and Recoveries. I use these on my build server/personal machine so
> they are tailored specifically to me but you are free to take these and modify them for your own needs.
> This repository contains some useful bash scripts for fully automated building ROMs or TWRP recovery
> for your device. These bash based scripts are easy to use and they just needs to be executed in terminal from the root folder
> of source you want to build from (a ROM or TWRP)

* Scripts in this repository
  * lpad-twrp.sh - builds TWRP for all Liquid Porting & Development devices using android-5.1 branch
  * build-rom.sh - builds a ROM for one particular device
  * build-twrp.sh | lpad-twrp.sh - builds TWRP for one particular device
  * lpad-devices.sh - set of device configurations for building TWRP for all LPAD devices
  
* Misc. scripts
  * megatools-installer.sh - installs MEGA for uploading builds

## Preparing scripts

Now we'll clone them and `cd` to them by running these commands:

```sh
git clone https://github.com/hejsekvojtech/build_scripts.git
cd build_scripts
```
And then just copy any script you want to the root of a ROM or TWRP source you'll be building from.

## Starting scripts

Once your choosen and configured script is placed into the root of required source, execute it by:

```sh
bash <script name>.sh <option>
```

### Examples

```sh
bash build-rom.sh <device name> --log --clean --ccache
```

```sh
bash build-twrp.sh <device name> --log --clean
```

## Options

* `--log` (saves a log file of the current build process) | `--nolog` (does the opposite)
* `--ccache` (enables CCache to speed up building) | `--noccache` (does the opposite)
* `<device name>` (tells the compiler which device we want to build for)
* `--clean` (performs a clean build) | `--noclean` (does the opposite)