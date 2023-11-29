#!/bin/bash

if (( $# > 4 )); then
    echo "Error: You must pass only 4 params and no more" >&2;
    exit 1;
elif [[ ! $# -eq '4' ]]; then
    echo "Error: All 4 params must be passed" >&2;
    exit 1;
elif [[ $1 == $2 ]] || [[ $3 == $4 ]]; then
    echo "Error: The colors of background and value are match" >&2;
    exit 1;
fi

for param in $@; do
    if [[ ! $param =~ ^[0-9]+$ ]]; then
        echo "Error: The param must be a number" >&2;
        exit 1;
    elif (( $param < 1 )) | (( $param > 6 )); then
        echo "Error: The param must be in 1..6 integer range";
        exit 1;
    fi
done