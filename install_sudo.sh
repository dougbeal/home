#!/bin/bash
source_directory="""$(dirname "${BASH_SOURCE[0]}")""" 
this="""$( cd "${source_directory}" && pwd -P )"""
source "$this/sh/common.sh"

if (( $(id -u) )); then
    echo "run with sudo"
else
    cp -fv etc/paths /etc/paths
fi
