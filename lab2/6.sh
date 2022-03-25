#!/bin/bash
max=0
pid=0
for h in `ps -ax -o pid --no-headers`
do
size=`awk '{print $1}' /proc/$h/statm 2>/dev/null`
if [[ $size -gt $max ]]
then 
max=$size
pid=$h
fi
done
echo $pid
res=`top -n1 -bo +%MEM | sed 1,7d | head -1 | awk '{print $1}'`
echo $res