#!/bin/bash
now=$(date -u +"%Y-%m-%d")
t=t
fol="followings.${now}.t"
list="$1"
listfile="${list}.${now}.t"

if [[ ! -e $fol ]]; then
   $t followings > $fol
fi

$t list information $list > /dev/null
if [ "$?" -ne 0 ]; then
    echo "list ${list} doesn't exist"
    exit 1
fi
if [[ ! -e $listfile ]]; then
    $t list members $list > $listfile
fi
diff $fol $listfile > "diff.f.${list}.t"

