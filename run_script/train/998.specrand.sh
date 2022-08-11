#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME 1 3  > rand.3.out 2> rand.3.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
