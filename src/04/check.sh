#!/bin/bash

if [[ $column1_background == $column1_font_color ]] && [[ $column1_background =~ [1-6] ]] || [[ $column2_background == $column2_font_color ]] && [[ $column2_background =~ [1-6] ]]; then
    echo "Error: The colors of background and value are match" >&2;
    exit 1;
fi

