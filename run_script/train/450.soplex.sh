#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME -s1 -e -m5000 pds-20.mps  > pds-20.mps.out 2> pds-20.mps.stderr
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -m1200 train.mps  > train.out 2> train.stderr
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

