#!/usr/bin/env bash

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"

cd $CMD_PATH

source ./lib-build.dll.sh

rm -rf ./packages
rm -rf ./aur-all

./lib-change-branch.dll.sh --getbranch > pkglist.txt

./8.aur.index.sh

for index in `ls aur-all`
do
     echo $index
     aur_Mkdir-All-Pkg --start "${index}" --only-package-name-folder "aur-all"
    #set -x
    aut_get-All-Pkg-Cfg-Write-To-File --type git --start "${index}"
done
