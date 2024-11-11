#!/bin/bash
set -ex
failure(){
    echo "failed at line $1 : $2"

}

trap ' "$LINENO" "$BASH_COMMAND" ' Err
echo "hello world"
echoo "hello world failure"
echo "hello aftr failure"