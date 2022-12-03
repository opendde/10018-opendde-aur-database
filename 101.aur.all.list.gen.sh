#!/usr/bin/env bash

set -x
# set -Eeu


export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"

cd $CMD_PATH

cd ~/
git clone https://github.com/archlinux/aur.git
cd aur
git branch -a | sed 's#  remotes/origin/##g' | grep -v "main" > $CMD_PATH/pkglist.txt
cat $CMD_PATH/pkglist.txt | wc -l
