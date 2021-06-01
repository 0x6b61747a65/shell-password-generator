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

ALL_LETTERS_CHARSET=[:alpha:]
#ALPHA_NUMERIC_CHARSET=[:alnum:]
#ALNUM_PLUS_OWASP_CHARSET="A-Za-z0-9\!\"\#\$\&\'\(\)\*\+\,\-\.\/\:\\\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~"

echo $(head /dev/urandom | tr -dc $ALL_LETTERS_CHARSET | head -c$PASSWORD_LENGTH )