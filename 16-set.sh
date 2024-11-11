#!/bin/bash
set -e
failure(){
    echo "failed at line $1 : $2"

}

trap ' "$LINENO" "$BASH_COMMAND" ' ERR
echo "hello world"
echoo "hello world failure"
echo "hello aftr failure"