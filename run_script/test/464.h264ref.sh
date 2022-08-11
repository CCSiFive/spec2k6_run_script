#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME -d foreman_test_encoder_baseline.cfg  > foreman_test_baseline_encodelog.out 2> foreman_test_baseline_encodelog.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
