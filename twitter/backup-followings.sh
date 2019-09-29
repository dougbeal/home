#!/bin/bash
now=$(date -u +"%Y-%m-%d")
t=t
fol="followings.${now}.t"
list="f-${now}-backup"
if [[ ! -e $fol ]]; then
   $t followings > $fol
fi
$t list create --private $list
cat $fol | xargs $t list add $list
$t friends > "friends.${now}.t"

