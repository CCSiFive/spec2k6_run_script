#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME --fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 bombesin.hmm  > bombesin.out 2> bombesin.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
