#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME SPEC-benchmark-test.ini  > SPEC-benchmark-test.stdout 2> SPEC-benchmark-test.stderr
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
