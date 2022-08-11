#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME 3000 reference.dat 0 0 100_100_130_ldc.of  > lbm.out 2> lbm.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
