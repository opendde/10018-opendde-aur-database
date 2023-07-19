#!/bin/bash

while true; do
    case "${1}" in
        --content) file_content="${2}"; shift 2 ;;
        --file-path) file_path="${2}"; shift 2 ;;
        --) shift; break ;;
        *) break ;;
    esac
done

file_content="${file_content:-"`cat /dev/stdin`"}"
if [ -z "$file_content" ]; then
    file_content="$(cat $file_path)"
    if [ -z "$file_content" ]; then
        exit 1
    fi
fi
echo "$file_content" > .tmp_var_file.sh

source _tmp_var_file.sh
json='{}'
for ((i_add_json = 1; i_add_json <= $(echo "$file_content" | wc -l); i_add_json++)); do
    var_name="$(echo "$file_content" | cut -d '=' -f 1 | sed -n $i_add_json'p')"
    eval "var_content=\${$var_name[@]}" 2>/dev/null || eval "var_content=\${$var_name}" 2>/dev/null
    if  [[ "$(declare -p $var_name 2>/dev/null)" =~ "declare -a" ]]; then
        IFS=', ' read -r -a json_array <<< "$var_content"
        json_array_json=$(printf '%s\n' "${json_array[@]}" | jq -R . | jq -s .)
        json="$(echo "$json" | jq --arg key "$var_name" --argjson arr "$json_array_json" '. + { ($key): $arr }')"
    else
        json="$(echo "$json" | jq --arg key "$var_name" --arg value "$var_content" '. + {($key): $value}')"
    fi
done
echo "$json" 1>&1 2>&2
rm _tmp_var_file.sh