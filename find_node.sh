#!/bin/bash

# set -e
# set -x

find_node()
{
    echo "checking file: "$2
    local num=1
    cat $2 | while read line; do
                pt="^#include.*dts[i]?"
                if [[ $line =~ $pt ]]; then
                    file=$(awk '/[<"].*[>"]$/{print $2}' <<< $line)
                    file=$(sed -ne  's/[<">]//gp' <<< $file)

                    find_node $1 $(find  $(dirname $2) -name $file)
                    :
                else
                    pattern="$1\s*\{"
                    pattern2="$1:"
                    if [[ $line =~ $pattern ]] || [[ $line =~ $pattern2 ]]; then
                        echo -e "\e[01;31mfound at line \e[01;33m"$num"\e[0m in "$2
                        return 0
                    fi

                fi
                ((num++))
            done
        
}

path=$(realpath $2)
find_node $1 $(realpath $2)