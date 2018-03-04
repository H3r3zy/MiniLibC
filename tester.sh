#!/bin/bash
make re
if [ ! -e .test.main.c ]
   then 
       curl https://raw.githubusercontent.com/H3r3zy/MiniLibC/master/main.c > .test.main.c
fi
gcc .test.main.c

LD_PRELOAD=`pwd`/libasm.so ./a.out > .test.me
./a.out > .test.assert

diff .test.me .test.assert
ret=$?
if [ $ret == 0 ]
then
    echo -e "\033[32m OK\033[00m";
else
    echo -e "\033[31m KO\033[00m";
fi

rm ./.test.assert
rm ./.test.me
rm a.out

exit $ret
