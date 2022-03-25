#!/bin/bash

let n=1
sign="+"
tail -n 0 -f tmp |
while true
do
read line
case $line in 
"+")
sign="+"
;;
"*")
sign="*"
;;
"QUIT")
echo $n
echo "process handler stopped"
exit 0
;;
[0-9]*)
	case $sign in
	"+")
	n=$(($n + $line))
	;;
	"*")
	n=$(($n * $line))
	;;
	esac
;;
*)
echo "invalid input"
exit 1
;;
esac
done