#!/bin/bash
# Only use this command to use
# source lib-build.dll.sh

# 如果遇到函数开头为while true; do
# 那是接收函数参数的地方
# 我们极度不建议使用 $1 和 $2 贯穿整个函数 应仅在接收函数的地方看见

# --start = TextStart (Tips: if you only want get start text = 0, then can write 0)
#                     (提示：这地方不写不处理，写了就只处理某个字符开头的文本)
aur_Mkdir-All-Pkg() {
    while true; do
        case "${1}" in
            --start) textstart="${2}"; shift 2 ;;
            --) shift; break ;;
            *) break ;;
        esac
    done
    if [ ! -f pkglist.txt ]; then
        ./lib-change-branch.dll.sh --getbranch >pkglist.txt
    fi
    pkg_list="$(cat pkglist.txt)"
    if [ -n "$textstart" ]; then
        pkg_list="$(echo "$pkg_list" | grep "^$textstart")"
    fi
    for ((i_mkdir = 1; i_mkdir <= $(echo "$pkg_list" | wc -l); i_mkdir++)); do
        pkgname=$(echo "$pkg_list" | awk 'NR=='"$i_mkdir"'{print}')
        dir_path="./package/"$(echo $pkgname | cut -c1)"/"$(echo $pkgname | awk -F- '{print $1}')"/"$pkgname
        if [ ! -d "$dir_path" ]; then
            mkdir -p $dir_path
            echo "Y:" $dir_path
        fi
        
    done
}

# --type = Type (Web/Git)
# --name = PackageName
aur_get-Single-Pkg-Cfg-Content(){
    while true; do
        case "${1}" in
            --type) type="${2}"; shift 2 ;;
            --name) package_name="${2}"; shift 2 ;;
            --) shift; break ;;
            *) break ;;
        esac
    done
    case "$type" in
        "git")
            ./lib-change-branch.dll.sh --setbranch $package_name
            cat ../aur/PKGBUILD 1>&1 2>&2
        ;;
        "web")
            wget -qO- "https://github.com/archlinux/aur/raw/$package_name/PKGBUILD" 1>&1 2>&2
        ;;
    esac
}

# /dev/stdin = File Content
# --name = PackageName
aur_split-Pkg-Cfg-Write-To-File(){
    while true; do
        case "${1}" in
            --name) package_name="${2}"; shift 2 ;;
            --) shift; break ;;
            *) break ;;
        esac
    done
    #file_content="$(cat /dev/stdin | sed 's/#.*$//' | tr -s '\n' )"
    file_content="$(cat /dev/stdin)" #通过文件隧道存放变量
    dir_path="./package/"$(echo $package_name | cut -c1)"/"$package_name #文件存储路径
    var_list="$(echo "$file_content" | sed -n '/^[a-zA-Z_][a-zA-Z0-9_]*=/p')" #先取出与变量有关的内容
    var_list="$(echo "$file_content" | grep -v '^#')" #然后去除开头的注释
    echo "$var_list" > $dir_path"/var.sh" #最后输出
    echo "$var_list" | ./lib-sh-convert-json.dll.sh | jq . > $dir_path"/var.json" #直接转换成JSON
    
    file_content="$(cat /dev/stdin | sed 's/#.*$//' | tr -s '\n' )" #重新获取并去除所有关于注释的（可能会误杀到一些东西）
    function_list="$(echo "$file_content" | grep "()" | sed 's#() {##g' | grep -v "^#")" #获取与func有关的内容
    for ((i_func = 1; i_func <= $(echo "$function_list" | wc -l); i_func++)); do 
        a_function=$(echo "$function_list" | awk 'NR=='"$i_func"'{print}') #取出一个func
        echo "$(echo "$file_content" | sed -n '/'"$a_function"'()/,/^}/p')" >$dir_path"/f_"$(echo $a_function).sh #最后输出到文件 以 f_xxx.sh 为格式
    done
}

# --type  = Type (Web/Git)
# --start = TextStart (Tips: if you only want get start text = 0, then can write 0)
#                （提示：这地方不写不处理，写了就只处理某个字符开头的文本）
aut_get-All-Pkg-Cfg-Write-To-File(){
    while true; do
        case "${1}" in
            --type) type="${2}"; shift 2 ;;
            --start) textstart="${2}"; shift 2 ;;
            --) shift; break ;;
            *) break ;;
        esac
    done
    pkg_list="$(cat pkglist.txt)"
    if [ $textstart ]; then
        pkg_list=$(echo "$pkg_list" | grep "^$textstart")
    fi
    for ((i_ga = 1; i_ga <= $(echo "$pkg_list" | wc -l); i_ga++)); do
        pkg_name=$(echo "$pkg_list" | awk 'NR=='"$i_ga"'{print}')
        aur_get-Single-Pkg-Cfg-Content --type "$type" --name "$pkg_name" | aur_split-Pkg-Cfg-Write-To-File --name "$pkg_name"
    done
}

# /dev/stdin = Input File Content (输入文本内容)
# --content = 与 /dev/stdin 用法一致 一等优先级别
# --file-path = 文件路径 二等优先级别
aur_sh-convert-to-json() {
    while true; do
        case "${1}" in
            --content) file_content="${2}"; shift 2 ;;
            --file-path) file_path="${2}"; shift 2 ;;
            --) shift; break ;;
            *) break ;;
        esac
    done
    
}

#即将废弃的方法
onekeyGetOnePkgCfg_deprecated() {
    cd ~/10018-opendde-aur-database/
    file_content=$(echo "$2"| sed 's/#.*$//' | tr -s '\n' )
    mkdir -p "./package/"$(echo $1 | cut -c1)"/"$(echo $1 | awk -F- '{print $1}')"/"$1
    var_list="$(echo $file_content | sed -n '/^[a-zA-Z_][a-zA-Z0-9_]*=/p')"
    save_link="./package/"$(echo $1 | cut -c1)"/"$(echo $1 | awk -F- '{print $1}')"/"$1"/var.sh"
    echo "$var_list" > $save_link
    function_list="$(echo "$file_content" | grep "()" | sed 's#() {##g' | grep -v "^#")"
    for ((i_func = 1; i_func <= $(echo "$function_list" | wc -l); i_func++)); do
        a_function=$(echo "$function_list" | awk 'NR=='"$i_func"'{print}')
        save_link="./package/"$(echo $1 | cut -c1)"/"$(echo $1 | awk -F- '{print $1}')"/"$1"/f_"$(echo $a_function)
        #echo $save_link
        echo "$(echo "$file_content" | sed -n '/'"$a_function"'()/,/^}/p')" >$save_link
    done
}