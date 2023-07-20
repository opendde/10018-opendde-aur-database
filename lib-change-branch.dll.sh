#!/bin/bash
# env
# THREAD_NAME=线程名称 从build-for-github 获取

# AUR-Database Ctrl-Git
# prepare

if [ -d "../aur"$THREAD_NAME ]; then
    cd "../aur"$THREAD_NAME
else
    git clone -b main  https://github.com/archlinux/aur ../aur$THREAD_NAME 
    if [ $? = 0 ]; then
        cd ../aur$THREAD_NAME
    else
        exit 1
    fi
fi
#function
getBranch() {
    git branch -a | sed 's#  remotes/origin/##g' | grep -v "main" 1>&1 2>&2
}
setBranch() {
    git checkout $1 1>&1 2>&2
}
#function var
case "$1" in
"--getbranch")
    getBranch
    ;;
"--setbranch")
    if [ $2 ]; then
        setBranch $2
    else
        echo "错误"
        exit 1
    fi
    ;;
esac
