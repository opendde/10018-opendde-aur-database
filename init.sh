#!/usr/bin/env bash

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"

cd $CMD_PATH

rm -rf ./packages
rm -rf ./aur-all

./lib-change-branch.dll.sh --getbranch > pkglist.txt

./8.aur.index.sh

mkdir ../output