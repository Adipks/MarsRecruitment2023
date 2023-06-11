#!/bin/bash

read -p "enter the number of rows on workspace:" rows
read -p "enter the numer of columns on workspace:" cols

declare -A workspace

create_workspace() {

	for ((i=0; i<rows; i++)); do
		for ((j=0; j<cols; j++)); do
			workspace[$i,$j]=1
		done
	done
	display_workspace

}

insert_obstacle() {
	local row=$1
	local col=$2
	workspace["$row,$col"]=0

}

movement() {
	local current_row=$1
	local current_col=$2
	read -p "enter row :" new_row
	read -p "enter column :" new_col

	workspace[$current_row,$current_col]=1
	if [ "${workspace["$new_row,$new_col"]}" -ne 0 ]; then

		workspace["$new_row,$new_col"]=8
		a=$new_row
		b=$new_col
	fi	


	display_workspace

}



display_workspace() {
	for ((i=0; i<rows; i++)); do
		for ((j=0; j<cols; j++)); do
			echo -n "${workspace[$i,$j]} "
		done
		echo
	done 
	echo

}




create_workspace

insert_obstacle 2 2

display_workspace

insert_obstacle 1 3

display_workspace

echo "moving the robot"

movement 0 0


