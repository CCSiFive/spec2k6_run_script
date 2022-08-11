#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME cccp.in -o cccp.s  > cccp.out 2> cccp.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
