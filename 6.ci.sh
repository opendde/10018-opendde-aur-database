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

cd ~
git clone git@github.com:opendde/10018-opendde-aur-database.git


cd 10018-opendde-aur-database
ls -al 

./101.aur.all.list.gen.sh
./8.aur.index.sh

git add .
git commit -a -m "add"
git push origin HEAD



cd aur-all/$GITHUB_REF_NAME

parse_pkgbuild()
{
    echo $1
    cd ~/aur
    git checkout $1
    cat PKGBUILD
    # Todo 解析文件 生成文件到package文件夹
}


for pkg in `ls`
do
    echo $pkg
    parse_pkgbuild $pkg
    cd aur-all/$GITHUB_REF_NAME
done








# buildaur(){
#     rm -rf /var/cache/pacman/pkg/
#     sudo -u runner git clone --depth=1 -b $1 "https://github.com/archlinux/aur.git" "tmp_${1}"
#     cd "tmp_${1}"
#     sudo -u runner makepkg --log --nocolor -s --nosign --noconfirm -f > ${1}.$GITHUB_RUN_NUMBER.log.tx
#     cd ..
#     rm -rf "tmp_${1}"
#     rm -rf /var/cache/pacman/pkg/
# }

# cd aur-all/$GITHUB_REF_NAME

# for pkg in `ls`
# do
#     echo $pkg
# done
