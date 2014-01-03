#!/bin/bash
this=$( cd $(dirname ${BASH_SOURCE[0]}); pwd -P )
source "$this/sh/common.sh"

if (( $(id -u) )); then
    echo "run with sudo"
else
    cp -fv etc/paths /etc/paths
fi
