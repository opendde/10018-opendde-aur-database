#!/bin/bash
# AUR-Database Ctl-Git
#prepare
if [ -d "../aur" ]; then
    cd ../aur
else
    git clone https://github.com/archlinux/aur ../aur -b main
    if [ $? = 0 ]; then
        cd ../aur
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
