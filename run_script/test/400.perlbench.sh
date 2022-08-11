#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME -I. -I./lib attrs.pl  > attrs.out 2> attrs.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -I. -I./lib gv.pl  > gv.out 2> gv.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -I. -I./lib makerand.pl  > makerand.out 2> makerand.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -I. -I./lib pack.pl  > pack.out 2> pack.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -I. -I./lib redef.pl  > redef.out 2> redef.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -I. -I./lib ref.pl  > ref.out 2> ref.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -I. -I./lib regmesg.pl  > regmesg.out 2> regmesg.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME -I. -I./lib test.pl  > test.out 2> test.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt