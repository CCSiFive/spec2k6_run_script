#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

time -p -o time.log $EXENAME -I./lib checkspam.pl 2500 5 25 11 150 1 1 1 1  > checkspam.2500.5.25.11.150.1.1.1.1.out 2> checkspam.2500.5.25.11.150.1.1.1.1.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

time -p -o time.log $EXENAME -I./lib diffmail.pl 4 800 10 17 19 300  > diffmail.4.800.10.17.19.300.out 2> diffmail.4.800.10.17.19.300.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

time -p -o time.log $EXENAME -I./lib splitmail.pl 1600 12 26 16 4500  > splitmail.1600.12.26.16.4500.out 2> splitmail.1600.12.26.16.4500.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

