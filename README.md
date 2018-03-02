# Get started with scripts

> These scripts were made to help with building various Android ROMs and Recoveries. I use these on my build server/personal machine so
> they are tailored specifically to me but you are free to take these and modify them for your own needs.
> This repository contains some useful bash scripts for fully automated building ROMs or TWRP recovery
> for your device. These bash based scripts are easy to use and they just needs to be executed in terminal from the root folder
> of source you want to build from (a ROM or TWRP)

* Scripts in this repository
  * build-rom.sh - builds a ROM for one particular device
  * build-twrp.sh | twrp-all.sh - builds TWRP for one particular device
  * twrp-devices.sh - set of device configurations for building TWRP for all our devices
  
* Misc. scripts
  * megatools-installer.sh - installs MEGA for uploading builds
  * build-environment.sh - sets up the Linux Ubuntu 16.04 (or later) build environment

## Preparing scripts

Now we'll clone them and `cd` to them by running these commands:

```sh
git clone https://github.com/hejsekvojtech/build_scripts.git
cd build_scripts
```
And then just copy build and scripts folder to the root of a ROM or TWRP source you'll be building from.

## Starting scripts

Once your choose what you want to do! then just into the root of required source, execute it by:

```
./build
```

### Examples

```
./build and type help for help
```
```sh
bash build-environment.sh <github username> <your email>
```

## Options

* `--log` (saves a log file of the current build process) | `--nolog` (does the opposite)
* `--ccache` (enables CCache to speed up building) | `--noccache` (does the opposite)
* `<device name>` (tells the compiler which device we want to build for)
* `--clean` (performs a clean build) | `--noclean` (does the opposite)
* `<github username>` (your GitHub username)
* `<your email>` (E-mail you used for registering to GitHub)
