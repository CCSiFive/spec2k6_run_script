#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME BigLakes2048.cfg  > BigLakes2048.out 2> BigLakes2048.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME rivers.cfg  > rivers.out 2> rivers.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

