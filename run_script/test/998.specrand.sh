#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME 324342 24239  > rand.24239.out 2> rand.24239.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
