#!/bin/bash

IFS=$'\n'
lines="$(cat ~/.trash.log)"
for line in $lines
do
l="$line"
link=`echo "$l" | awk -F':' '{print $1}'`
hardlink=`echo "$l" | awk -F':' '{print $2}'` 
filename=`echo "$link" | awk -F'/' '{print $NF}'`
len=`echo -n "$filename" | awk '{print length}'`
len=$(($len + 1))
way=${link::-$len}
if [[ "$filename" == "$1" ]]
then
echo "$link" "yes or no"
read ans
if [[ "$ans" == "yes" ]]
then
if [ -d "$way" ]; then
while [ -f "$link" ]
do
echo "please change filename"
read newname
filename="$newname"
done
ln "/root/.trash/$hardlink" "$link" 
rm "/root/.trash/$hardlink"

else
#if [[ "$ans" == "no" ]]
#then
while [ -f "/root/$filename" ]
do
echo "please change filename"
read newname
filename="$newname"
done
echo "directory no longer exist"
ln "/root/.trash/$hardlink" "/root/$filename"
rm "/root/.trash/$hardlink"
#fi
fi
fi
fi
done