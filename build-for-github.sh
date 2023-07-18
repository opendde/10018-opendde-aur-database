#!/usr/bin/env bash

source ./lib-build.dll.sh
./lib-change-branch.dll.sh --getbranch >pkglist.txt
aur_Mkdir-All-Pkg --start "0"
#set -x
aut_get-All-Pkg-Cfg-Write-To-File --type git --start "0"