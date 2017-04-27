#!/bin/bash
now=$(date -u +"%Y-%m-%dT%H:%MZ")
t followings > "followings.${now}.t"
t list members Select > "Select.${now}.t"
