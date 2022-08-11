#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME input.program 5  > input.program.out 2> input.program.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME dryer.jpg 2  > dryer.jpg.out 2> dryer.jpg.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
