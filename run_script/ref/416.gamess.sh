#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME   < cytosine.2.config  > cytosine.2.out 2> cytosine.2.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME   < h2ocu2+.gradient.config  > h2ocu2+.gradient.out 2> h2ocu2+.gradient.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME   < triazolium.config  > triazolium.out 2> triazolium.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

