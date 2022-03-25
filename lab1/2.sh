#!/bin/bash

C=""
while true
do
read A
if [[ $A == q ]]
then break
fi
C=$C$A
done
echo $C