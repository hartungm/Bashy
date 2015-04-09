#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}
[ "$#" -eq 1 ] || die "1 argument required, $# provided"
touch $@
while read a; do
    grep -q "$a" $@
    duplicate=$?
    if [ $duplicate = 0 ] ; then
        echo $a >> $@
    fi
done
