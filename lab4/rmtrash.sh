#!/bin/bash

[ ! -f "$1" ] && exit
[ ! -d /root/.trash ] && mkdir /root/.trash
t=$(date +"%Y_%m_%d_%I_%M_%S")
ln "$1" /root/.trash/$t
echo "$PWD/$1:$t" >> /root/.trash.log

rm "$1"