#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME 166.in -o 166.s  > 166.out 2> 166.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME 200.in -o 200.s  > 200.out 2> 200.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME c-typeck.in -o c-typeck.s  > c-typeck.out 2> c-typeck.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME cp-decl.in -o cp-decl.s  > cp-decl.out 2> cp-decl.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME expr.in -o expr.s  > expr.out 2> expr.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME expr2.in -o expr2.s  > expr2.out 2> expr2.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME g23.in -o g23.s  > g23.out 2> g23.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME s04.in -o s04.s  > s04.out 2> s04.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME scilab.in -o scilab.s  > scilab.out 2> scilab.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

