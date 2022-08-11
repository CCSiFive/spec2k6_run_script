#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME SPEC-benchmark-ref.ini  > SPEC-benchmark-ref.stdout 2> SPEC-benchmark-ref.stderr
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
