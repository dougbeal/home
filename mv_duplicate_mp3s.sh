#!/bin/bash
itunes_library="/Volumes/Aperture 2014/live/iTunes/iTunes Music"
dupes_destination="/Volumes/Aperture 2014/iTunes-dupes"
cd "${itunes_library}" && gfind . -type f -regex '.* [0-9]\.mp3' -print0 | dupes_destination="${dupes_destination}" gxargs -0 bash -c 'while [[ $# > 0 ]]; do file="$1"; d=$(dirname "$file"); d="${dupes_destination}/$d"; mkdir -p "$d"; mv "$file" "$d"; shift; done' 
