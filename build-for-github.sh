#!/usr/bin/env bash
source ./lib-build.dll.sh

if [ -n "$THREAD_NUM" ]; then
    THREAD_NAME="-"$THREAD_NUM
fi

while true; do
    case "${1}" in
        --start) start_text="${2}"; shift 2 ;;
        --) shift; break ;;
        *) break ;;
    esac
done

cp -R ../aur ../aur$THREAD_NAME
aur_Mkdir-All-Pkg --start "${start_text}" # --only-package-name-folder "aur-all"
#set -x
aut_get-All-Pkg-Cfg-Write-To-File --type git --start "${start_text}"