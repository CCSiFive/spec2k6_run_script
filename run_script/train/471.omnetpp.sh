#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME omnetpp.ini  > omnetpp.log 2> omnetpp.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt
