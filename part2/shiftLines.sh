#!/bin/bash
while read l; do
    count=`wc -w <<< "$l"`
    for i in `seq 1 $count`; do
        last=`expr "$l" : '.* \(.*\)'`
        rest=`expr "$l" : '\(.*\) .*'`
        l="$last $rest"
        echo $l
    done
done <$@
