#!/bin/bash
for h in `ps -ax -o pid --no-headers`
do
ppid=`awk '{ if ( $1 == "PPid:" ) print $2 }' /proc/$h/status 2>/dev/null`
sum=`awk '{ if ( $1 == "se.sum_exec_runtime" ) print $3 }' /proc/$h/sched 2>/dev/null`
nr=`awk '{ if ( $1 == "nr_switches" ) print $3 }' /proc/$h/sched 2>/dev/null`
if [[ $nr != "" ]]
then
echo -n "$h " >> tmp
echo -n "$ppid " >> tmp
art=`echo $sum $nr | awk '{printf "%f", $1 / $2}'`
echo "$art" >> tmp
fi
done
cat tmp | sort -n -k2 | awk '{ printf "ProcessID=" $1 " : " "Parent-ProcessID=" $2 " : " "Average_Runninng_Time="  $3 "\n" }' > res4
rm tmp