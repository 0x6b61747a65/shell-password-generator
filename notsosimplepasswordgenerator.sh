#! /bin/bash

set -eu
# "unofficial strict mode" in bash
# -e - exit script if one of line fails to execute
# -u - exit on undefined variable

echo "========================================="
echo "Generates random password for user"
echo "========================================="

echo "Enter password length: "
read PASSWORD_LENGTH

echo $(head /dev/urandom | tr -dc A-Za-z0-9 | head -c$PASSWORD_LENGTH )