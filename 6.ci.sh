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

  git config --global user.email "actions@github.com"
  git config --global user.name "actions"


cd ~
git clone git@github.com:opendde/10018-opendde-aur-database.git


cd 10018-opendde-aur-database
ls -al 

./101.aur.all.list.gen.sh
#./8.aur.index.sh




cd aur-all/$GITHUB_REF_NAME

onekeyGetOnePkgCfg() {
    cd ~/10018-opendde-aur-database/
    file_content="$2"
    var_list=$(cat $file_content | sed -n '/^[a-zA-Z_][a-zA-Z0-9_]*=/p')
    save_link="./package/"$(echo $1 | cut -c1)"/"$(echo $1 | awk -F- '{print $1}')"/"$1"/var.sh"
    echo $var_list > $save_link
    function_list="$(echo "$file_content" | grep "()" | sed 's#() {##g' | grep -v "^#")"
    for ((i_func = 1; i_func <= $(echo "$function_list" | wc -l); i_func++)); do
        a_function=$(echo "$function_list" | awk 'NR=='"$i_func"'{print}')
        save_link="./package/"$(echo $1 | cut -c1)"/"$(echo $1 | awk -F- '{print $1}')"/"$1"/f_"$(echo $a_function)
        #echo $save_link
        echo "$(echo "$file_content" | sed -n '/'"$a_function"'()/,/^}/p')" >$save_link
    done
}

parse_pkgbuild()
{
    echo $1
    cd ~/aur
    git checkout $1
    content=$(cat PKGBUILD)
    onekeyGetOnePkgCfg $1 "$content"
    # Todo 解析文件 生成文件到package文件夹
}



for pkg in `ls`
do
    echo $pkg
    parse_pkgbuild $pkg
    cd aur-all/$GITHUB_REF_NAME
done

cd ~/10018-opendde-aur-database/
git add .
git commit -a -m "add"
git push origin HEAD




echo "ok"


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
