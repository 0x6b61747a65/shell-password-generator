#! /bin/bash

set -eu
# "unofficial strict mode" in bash
# -e - exit script if one of line fails to execute
# -u - exit on undefined variable

echo "+================================================+"
echo "| Create password of a given strength and length |"
echo "+================================================+"

echo "Enter password length: "
read PASSWORD_LENGTH

ALL_LETTERS_CHARSET=[:alpha:]
ALPHA_NUMERIC_CHARSET=[:alnum:]
ALNUM_PLUS_OWASP_CHARSET="A-Za-z0-9\!\"\#\$\&\'\(\)\*\+\,\-\.\/\:\\\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~"

select PASSWORD_QUALITY in "All letters" Alphanumeric "Alphanumeric+OWASP special characters"
do
        case $PASSWORD_QUALITY in
                "All letters")
                        echo $(head /dev/urandom | tr -dc $ONLY_LETTERS_CHARSET | head -c$PASSWORD_LENGTH )
                        break
                        ;;
                Alphanumeric)
                        echo $(head /dev/urandom | tr -dc $ALPHA_NUMERIC_CHARSET | head -c$PASSWORD_LENGTH )
                        break
                        ;;
                "Alphanumeric+OWASP special characters")
                        echo $(head /dev/urandom | tr -dc $ALNUM_PLUS_OWASP_CHARSET | head -c$PASSWORD_LENGTH )
                        break
                        ;;
        esac
done