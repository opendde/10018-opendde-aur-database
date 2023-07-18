#!/usr/bin/env bash

cp -fv known_hosts /root/.ssh/known_hosts
ssh-keygen -f "/root/.ssh/known_hosts" -R "github.com"
ssh-keyscan "github.com" >> /root/.ssh/known_hosts
cat /root/.ssh/known_hosts
git config --global user.email "actions@github.com"
git config --global user.name "github-actions"
cd ~
git clone git@github.com:opendde/10018-opendde-aur-database.git ./database

cd ./database
source ./lib-build.dll.sh
aur_Mkdir-All-Pkg --start "0"
aut_get-All-Pkg-Cfg-Write-To-File --type git --start "0"

git add .
git commit -a -m "add data"
git push origin HEAD
