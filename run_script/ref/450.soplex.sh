#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME -s1 -e -m45000 pds-50.mps  > pds-50.mps.out 2> pds-50.mps.stderr
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -m3500 ref.mps  > ref.out 2> ref.stderr
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

