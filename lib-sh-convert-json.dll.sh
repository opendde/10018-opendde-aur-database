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
echo "$file_content" > $PROCESS_NAME"_tmp_var_file.sh"
chmod +x $PROCESS_NAME"_tmp_var_file.sh"
source $PROCESS_NAME"_tmp_var_file.sh"
while IFS= read -r line; do
    # 判断是否包含等号
    if [[ "$line" == *"="* ]]; then
        # 提取等号左边的内容，并去除可能的空格
        var_name="${line%%=*}"
        # 添加到变量名列表中，用换行符分隔
        var_name_list+="$var_name"$'\n'
    fi
done <<< "$file_content"
json='{}'
for ((i_add_json = 1; i_add_json <= $(echo "$var_name_list" | wc -l); i_add_json++)); do
    var_name="$(echo "$var_name_list" | sed -n $i_add_json'p')"
    if [ -n "$var_name" ]; then
        eval "var_content=\${$var_name[@]}" 2>/dev/null || eval "var_content=\${$var_name}" 2>/dev/null
        if  [[ "$(declare -p $var_name 2>/dev/null)" =~ "declare -a" ]]; then
            IFS=', ' read -r -a json_array <<< "$var_content"
            json_array_json=$(printf '%s\n' "${json_array[@]}" | jq -R . | jq -s .)
            json="$(echo "$json" | jq --arg key "$var_name" --argjson arr "$json_array_json" '. + { ($key): $arr }')"
        else
            json="$(echo "$json" | jq --arg key "$var_name" --arg value "$var_content" '. + {($key): $value}')"
        fi
    fi
done
echo "$json" 1>&1 2>&2
rm _tmp_var_file.sh