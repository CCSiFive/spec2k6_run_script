#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME -I./lib diffmail.pl 2 550 15 24 23 100  > diffmail.2.550.15.24.23.100.out 2> diffmail.2.550.15.24.23.100.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -I./lib perfect.pl b 3  > perfect.b.3.out 2> perfect.b.3.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -I. -I./lib scrabbl.pl  < scrabbl.in  > scrabbl.out 2> scrabbl.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -I./lib splitmail.pl 535 13 25 24 1091  > splitmail.535.13.25.24.1091.out 2> splitmail.535.13.25.24.1091.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -I. -I./lib suns.pl  > suns.out 2> suns.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

