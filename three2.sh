#!/bin/bash

length="$1"

if [ -z "$1length" ]; then
	echo "provide password length"
	exit 1
fi

password=$(openssl rand -base64 48 | tr -dc '[:alnum:]' | head -c "$length")
echo "generated password: $password"

