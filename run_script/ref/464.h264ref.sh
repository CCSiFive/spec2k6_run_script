#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME -d foreman_ref_encoder_baseline.cfg  > foreman_ref_baseline_encodelog.out 2> foreman_ref_baseline_encodelog.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -d foreman_ref_encoder_main.cfg  > foreman_ref_main_encodelog.out 2> foreman_ref_main_encodelog.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -d sss_encoder_main.cfg  > sss_main_encodelog.out 2> sss_main_encodelog.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

