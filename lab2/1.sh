#!/bin/bash 
a=`ps -u root ax -o pid,command --no-headers`
echo "$a" | wc -l > res1
echo "$a" | awk '{$1=$1 ":";print $0}' >> res1