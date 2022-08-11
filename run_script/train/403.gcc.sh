#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME integrate.in -o integrate.s  > integrate.out 2> integrate.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
