#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME --fixed 0 --mean 425 --num 85000 --sd 300 --seed 0 leng100.hmm  > leng100.out 2> leng100.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
