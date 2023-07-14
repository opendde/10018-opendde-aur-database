#!/usr/bin/env bash

set -x
# set -Eeu


export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"

cd $CMD_PATH

cd ~/
git clone --depth=1 https://github.com/archlinux/aur.git
cd aur
git branch -a | sed 's#  remotes/origin/##g' | grep -v "main" > $CMD_PATH/7.aur.all.txt
cd $CMD_PATH
cat $CMD_PATH/7.aur.all.txt | wc -l > pkgs.count.txt

