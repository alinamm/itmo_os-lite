#!/bin/bash

cd /home/user
dir="$(ls | grep -E "^Backup-" | sort -n | tail -1 | cut -d "-" -f 2,3,4)"
dir="Backup-"$dir
IFS=$'\n'
FILES="/home/user/$dir/*"
for f in $FILES
do
i=0
IFS=$'\n'
FILES2="/root/lab4/tmp/*"
for f2 in $FILES2
do
name=`echo "$f2" | awk -F'/' '{print $NF}'`
if [[ -f "/root/lab4/tmp/$name" ]]
then
i=1
fi
done
if [[ $i -eq 0 ]]
then
cp -R "$f" /home/user/restore
fi
done