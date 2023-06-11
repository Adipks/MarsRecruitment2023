#!/bin/bash

directory="$1"

if [ ! -d "$directory" ]; then 
	echo "Directory not found"
	exit 1
fi

current_date=$(date +"%Y-%m-%d_%H-%M-%S")

for file in "$directory"/*; do
	if [ -f "$file" ]; then
		echo -e "\nCurrent Date and Time: $current_date" >> "$file"
		echo "Date and time appended to: $file"
	fi
done	
