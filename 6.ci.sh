#!/usr/bin/env bash

set -x
# set -Eeu


export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"

cd $CMD_PATH
env
pwd
whoami
df -h
free -m
cp -fv known_hosts /root/.ssh/known_hosts
ssh-keygen -f "/root/.ssh/known_hosts" -R "github.com"
ssh-keyscan "github.com" >> /root/.ssh/known_hosts
cat /root/.ssh/known_hosts

rsync -avP ./ ~/9329/ > /dev/null




chown -R runner:runner ~/9329/
cd ~/9329/
ls -al 

git remote add origin git@github.com:opendde/10018-opendde-aur-database.git

git remote set-url origin git@github.com:opendde/10018-opendde-aur-database.git

./101.aur.all.list.gen.sh
./8.aur.index.sh



git add .
git commit -a -m "add"
git push origin HEAD

buildaur(){
    rm -rf /var/cache/pacman/pkg/
    sudo -u runner git clone --depth=1 -b $1 "https://github.com/archlinux/aur.git" "tmp_${1}"
    cd "tmp_${1}"
    sudo -u runner makepkg --log --nocolor -s --nosign --noconfirm -f > ${1}.$GITHUB_RUN_NUMBER.log.tx
    cd ..
    rm -rf "tmp_${1}"
    rm -rf /var/cache/pacman/pkg/
}

cd aur-all/$GITHUB_REF_NAME

# for pkg in `ls`
# do
#     buildaur $pkg
# done
