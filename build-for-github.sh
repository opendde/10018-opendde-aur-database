#!/usr/bin/env bash

source ./lib-build.dll.sh
rm -rf ./packages
./lib-change-branch.dll.sh --getbranch >pkglist.txt
aur_Mkdir-All-Pkg --start "0" --only-package-name-folder "aur-all"
#set -x
aut_get-All-Pkg-Cfg-Write-To-File --type git --start "0"