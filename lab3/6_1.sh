#!/bin/bash

while true
do
read line 
case "$line" in 
TERM)
kill -SIGTERM $(cat tmp2)
exit
;;
+)
kill -USR1 $(cat tmp2)
;;
[*])
kill -USR2 $(cat tmp2)
;;
*)
continue
;;
esac 
done