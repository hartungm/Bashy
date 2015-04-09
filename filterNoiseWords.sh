#!/bin/bash
while read a b; do
    grep -q $a $@
    badString=$?
    if [ $badString = 1 ] ; then
        echo "$a $b"
    fi
done 
