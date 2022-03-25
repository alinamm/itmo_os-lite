#!/bin/bash
echo -n "" > res5
a=""
k=0
IFS=$'\n'
y=0
n=0
LINES=$(cat res4)
for LINE in $LINES
do
s1=`echo $LINE | awk -F' ' '{print $3}'`
s2=`echo $LINE | awk -F' ' '{print $5}'`
if [[ "$a" == "$s1" || "$a" == "" ]]
then
n=$(($n + 1))
x=`echo $s2 | awk -F'=' '{print $2}'`
k=`echo "$k" "$x" | awk '{printf "%f", $1 + $2}'`
else
k=`echo $k $n | awk '{printf "%f", $1 / $2}'`
y=`echo $a | awk -F'=' '{print $2}'`
echo "Average_Running_Children_of_ParentID=" $y " is " $k >> res5
k=`echo $s2 | awk -F'=' '{print $2}'`
n=1
fi 
echo "$LINE" >> res5
a=$s1
done
y=`echo $a | awk -F'=' '{print $2}'`
echo "Average_Running_Children_of_ParentID=" $y " is " $k >> res5