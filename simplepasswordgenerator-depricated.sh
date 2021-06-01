#! /bin/bash

set -eu
# setting "strict mode" in bash
# -e - exit script if one of line fails to execute
# -u - exit on undefined variable

echo "========================================="
echo "Generates pseudo random password for user"
echo "========================================="

echo "Enter password length: "
read PASS_LENGTH

echo $(openssl rand -base64 $PASS_LENGTH)