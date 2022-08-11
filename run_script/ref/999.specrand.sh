#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME 1255432124 234923  > rand.234923.out 2> rand.234923.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
