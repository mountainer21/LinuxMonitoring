#!/bin/bash

if [[ -z $1 ]]; then
    echo "Error 1: You should pass the path" >&2;
    exit 1;
elif (( $# > 1 )); then
    echo "Error 2: You must pass only 1 param and no more" >&2;
    exit 2;
elif [[ ! $1 =~ /$ ]]; then
    echo "Error 3: The path should end with \"/\"" >&2;
    exit 3;
elif [ ! -d "$1" ]; then
    echo "Directory $1 does not exists" >&2;
    exit 4;
fi
