#!/usr/bin/env bash

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"

cd $CMD_PATH

env
set -x 

if [ ! -z $GITHUB_REF_NAME ];then
  echo "::group::Set github-actions bot"
  git config --global user.name "github-actions[bot]"
  git config --global user.email "actions@github.com"
  echo "::group::Set Key & Hosts"
  cp -fv known_hosts /root/.ssh/known_hosts
  ssh-keygen -f "/root/.ssh/known_hosts" -R "github.com"
  ssh-keyscan "github.com" >> /root/.ssh/known_hosts
  cat /root/.ssh/known_hosts
  echo "::group::Prepare Build"
fi

./init.sh

# 定义字符数组
characters=()
for (( i = 48; i <= 122; i++ )); do
    if (( i <= 57 )) || (( i >= 97 )); then
        characters+=($(printf \\$(printf '%03o' $i)))
    fi
done
# 定义每个批次中的线程数
threads_per_batch=10
# 计算总共的批次数
total_batches=$(( ( ${#characters[@]} + threads_per_batch - 1) / threads_per_batch ))
# 执行批次任务
for (( i = 0; i < total_batches; i++ )); do
    for (( j = i*threads_per_batch; j < (i+1)*threads_per_batch; j++ )); do
        if (( j < ${#characters[@]} )); then
            env THREAD_NUM=$j ./build-for-github.sh --start "${characters[j]}" &
        else
            break
        fi
    done
    # 等待当前批次中的所有任务完成
    wait
done

if [ ! -z $GITHUB_REF_NAME ];then
  echo "::group::Push To GitHub"
  git config --global --add safe.directory $CMD_PATH
  git add .
  git commit -a -m "add"
  git push origin HEAD
fi