#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < capture.tst  > capture.out 2> capture.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < connect.tst  > connect.out 2> connect.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < connect_rot.tst  > connect_rot.out 2> connect_rot.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < connection.tst  > connection.out 2> connection.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < connection_rot.tst  > connection_rot.out 2> connection_rot.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < cutstone.tst  > cutstone.out 2> cutstone.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < dniwog.tst  > dniwog.out 2> dniwog.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

