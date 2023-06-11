#!/bin/bash
curr="$1"
mo_dir="${curr}/Mod"
mkdir -p "$mo_dir"

find "$curr" -type f -name "*.txt" -exec sh -c '
cp "$1" "$2/$(basename "$1" .txt).bak"
' sh {} "$mo_dir" \;
