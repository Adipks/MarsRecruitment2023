#!/bin/bash

length="$1"

if [ -z "$length" ]; then
	echo "please provide password length"
	exit 1
fi

password=$(tr -dc '[:alnum]' < /dev/urandom | head -c "$length")
echo "generated password: $password"

