#!/bin/bash

echo "" > tmp
while true
do
read line
echo "$line" >> tmp
if [[ "$line" == "QUIT" ]]
then
echo "process stopped"
exit 0
fi
if [[ ! "$line" =~ [0-9]+ && "$line" != "+" && "$line" != "*" ]]
then
echo "invalid input"
exit 1
fi
done