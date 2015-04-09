#!/bin/bash
touch $@
while read a; do
    grep -q "$a" $@
    duplicate=$?
    if [ $duplicate = 0 ] ; then
        echo $a >> $@
    fi
done
