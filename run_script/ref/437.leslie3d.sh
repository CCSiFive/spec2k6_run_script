#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME   < leslie3d.in  > leslie3d.stdout 2> leslie3d.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
