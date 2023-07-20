#!/usr/bin/env bash
for (( i = 48; i <= 57; i++ )); do
    characters+=($(printf \\$(printf '%03o' $i)))
done
for (( i = 97; i <= 122; i++ )); do
    characters+=($(printf \\$(printf '%03o' $i)))
done
for (( i = 0; i < ${#characters[@]}; i++ )); do
    echo "characters[$i] = ${characters[$i]}"
done
