#!/bin/bash

file="$1"

if [ -z "$file" ]; then
	echo "provide filename as argument"
	exit 1
fi

if [ ! -f "$file" ]; then
	echo "file not found"
	exit 1
fi

matrix=()
while IFS= read -r line; do
	row=($line)
	matrix+=("${row[@]}")
done < "$file"

rows=${#matrix[@]}
cols=${#matrix[0]}

transposed=()
for ((j=0; j<cols; j++)); do
	for ((i=0; i<rows; i++)); do
		transposed[$((j*rows+i))]="${matrix[$((i*cols+j))]}"
	done

done

for ((i=0; i<cols; i++)); do
	for ((j=0; j<rows; j++)); do
		index=$((i*rows+j))
		printf "%-4s" "${transposed[$index]}"
	done
	echo
done

