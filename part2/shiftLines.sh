#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}
[ "$#" -eq 1 ] || die "1 argument required, $# provided"
[ -f $@ ] || die "File does not exist"
while read l; do
    count=`wc -w <<< "$l"`
    for i in `seq 1 $count`; do
        last=`expr "$l" : '.* \(.*\)'`
        rest=`expr "$l" : '\(.*\) .*'`
        l="$last $rest"
        echo $l
    done
done <$@
