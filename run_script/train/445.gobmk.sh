#!/bin/bash

EXENAME=$1
[[ "$#" != "1" ]] && echo -e "$0 BINARY" && exit -1

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < arb.tst  > arb.out 2> arb.err
echo "`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < arend.tst  > arend.out 2> arend.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < arion.tst  > arion.out 2> arion.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < atari_atari.tst  > atari_atari.out 2> atari_atari.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < blunder.tst  > blunder.out 2> blunder.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < buzco.tst  > buzco.out 2> buzco.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < nicklas2.tst  > nicklas2.out 2> nicklas2.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

/usr/bin/time -p -o time.log $EXENAME --quiet --mode gtp  < nicklas4.tst  > nicklas4.out 2> nicklas4.err
echo ",`cat time.log |grep -e "user [0-9]"|sed "s/user //g"`" >> time.txt

