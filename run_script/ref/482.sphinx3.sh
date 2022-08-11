#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME ctlfile . args.an4  > an4.log 2> an4.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
