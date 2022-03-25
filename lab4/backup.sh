#!/bin/bash

date=`date +"%Y-%m-%d"`
late=$(date -d "$(date) - 7 days" +"%Y-%m-%d")
filename="Backup-$date"
cd /home/user
i=0
dirdate="$(ls | grep -E "^Backup-" | sort -n | tail -1 | cut -d "-" -f 2,3,4)"
if [[ $dirdate =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] && date -d "$dirdate" >/dev/null
then
dirname="Backup-$dirdate"
if [[ $dirdate > $late ]]
then
i=1
fi
else 
i=1
fi
one=1
if [[ ! "$i" -eq "$one" ]]
then
mkdir "/home/user/$filename"
echo "$filename " "$date " >> "/home/user/backup-report" 
FILES="/home/user/source/*"
IFS=$'\n'
for f in $FILES
do
echo "$f " >> "/home/user/backup-report"
cp "$f" "/home/user/$filename"
done

else
echo "$filename " "$date " >> "/home/user/backup-report"
FILES="/home/user/source/*"
IFS=$'\n'
for f1 in $FILES
do
name=`echo "$f1" | awk -F'/' '{print $NF}'`
if [[ ! -f "/home/user/$dirname/$name" ]]
then
name=`echo "$f1" | awk -F'/' '{print $NF}'`
cp "$f1" "/home/user/$dirname"
echo "$f1" >> "/home/user/backup-report"
else
size1=`wc -c "$f1" | awk '{print $1}'`
name=`echo "$f1" | awk -F'/' '{print $NF}'`
size2=`wc -c "/home/user/$dirname/$name" | awk '{print $1}'`
if [[ ! $size1 -eq $size2 ]]
then
echo "$f1 " "$f1.$date" >> "/home/user/backup-report"
mv "/home/user/$dirname/$name" "/home/user/$dirname/$name.$date"
cp "/home/user/$dirname/$name.$date" "/root/lab4/tmp/$name.$date"
cp "$f1" "/home/user/$dirname/$name"
fi
fi
done
fi