#!/usr/bin/env bash

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"

cd $CMD_PATH

rm -rf ./packages
rm -rf ./aur-all

./lib-change-branch.dll.sh --getbranch > pkglist.txt

<<<<<<< HEAD
#./8.aur.index.sh
=======
./8.aur.index.sh
>>>>>>> 7ed8f7ec4ceb287ab68ddc9e19a2c851c870ca28

mkdir ../output