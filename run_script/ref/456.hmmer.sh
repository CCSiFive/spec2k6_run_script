#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME nph3.hmm swiss41  > nph3.out 2> nph3.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --fixed 0 --mean 500 --num 500000 --sd 350 --seed 0 retro.hmm  > retro.out 2> retro.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

