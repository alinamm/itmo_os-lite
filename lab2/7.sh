#!/bin/bash
echo -n "" > res7
echo -n "" > tmp
for h in `ps -ax -o pid --no-headers`
do
t=`awk '{ if ( $1 == "read_bytes:" ) print $2 }' /proc/$h/io 2>/dev/null`
echo -n "$h " >> tmp
echo "$t" >> tmp
done
sleep 5s
IFS=$'\n'
LINES=$(cat tmp)
for LINE in $LINES
do
s1=`echo $LINE | awk -F' ' '{print $1}'`
s2=`echo $LINE | awk -F' ' '{print $2}'`
t=`awk '{ if ( $1 == "read_bytes:" ) print $2 }' /proc/$s1/io 2>/dev/null`
echo -n "$s1"
delta=`echo "$t" "s2" | awk '{printf "%d", $1 - $2}'`
echo -n " : "
echo "$delta"
done | sort -n -k3 | tail -3