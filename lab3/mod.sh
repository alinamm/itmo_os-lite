#!/bin/bash

while true
do
read line
case "$line" in
TERM)
kill -TERM $(cat mod_tmp)
exit
;;
QUIT)
kill -QUIT $(cat mod_tmp)
exit
;;
KILL)
kill -KILL $(cat mod_tmp)
exit
;;
*)
continue
;;
esac
done