#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}
[ "$#" -eq 1 ] || die "1 argument required, $# provided"
[ -f $@ ] || die "File does not exist"
while read a b; do
    grep -q $a $@
    badString=$?
    if [ $badString = 1 ] ; then
        echo "$a $b"
    fi
done 
