#!/bin/bash
. ./check.sh

START_POINT=$(date +%s%N)
echo "Total number of folders (including all nested ones) = $(find $1 2>/dev/null -type d| wc -l)"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):
$(du -h $1 2>/dev/null | sort -hr | head -5 | awk 'BEGIN{i=1}{printf "%d - %s, %s\n", i, $2, $1; i++}')"
echo "Total number of files = $(find $1 2>/dev/null -type f | wc -l)"
echo "Configuration files (with the .conf extension) = $(find $1 2>/dev/null -type f -name "*.conf" | wc -l)"
echo "Text files = $(find $1 2>/dev/null -type f -name "*.txt" | wc -l)"
echo "Executable files = $(find $1 2>/dev/null -type f -executable | wc -l)"
echo "Log files (with the extension .log) = $(find $1 2>/dev/null -type f -name "*.log" | wc -l)"
echo "Archive files = $(find $1 2>/dev/null -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" | wc -l)"
echo "Symbolic links = $(find $1 2>/dev/null -type l | wc -l)"

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    for num in {1..10}
    do
        file_line=$(find $1 2>/dev/null -type f -exec du -h {} + | sort -rh | head -10 | sed "${num}q;d")
        if ! [[ -z $file_line ]]
        then
            echo -n "$num - "
            echo -n "$(echo $file_line | awk '{print $2}'), "
            echo -n "$(echo $file_line | awk '{print $1}'), "
            echo "$(echo $file_line | grep -m 1 -o -E "\.[^/.]+$" | awk -F . '{print $2}')"
        fi
    done
echo -en "\n"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    for num in {1..10}
    do
        file_line=$(find $1 2>/dev/null -type f -executable -exec du -h {} + | sort -rh | head -10 | sed "${num}q;d")
        if ! [[ -z $file_line ]]
        then
            echo -n "$num - "
            echo -n "$(echo $file_line | awk '{print $2}'), "
            echo -n "$(echo $file_line | awk '{print $1}'), "
            path=$(echo $file_line | awk '{print $2}')
            MD5=$(md5sum $path | awk '{print $1}')
            echo "$MD5"
        fi
    done
echo -en "\n"
END_POINT=$(date +%s%N)
DIFF=$(bc -l <<< "scale=1; ($END_POINT - $START_POINT)/1000000000");
echo "Script execution time (in seconds) = $DIFF";

