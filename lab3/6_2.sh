#!/bin/bash

echo $$ > tmp2
n=1
sign="+"
usr1()
{
sign="+"
}
usr2()
{
sign="*"
}
sigterm()
{
echo "stopped by signal"
exit 0
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'sigterm' SIGTERM
while true
do
case "$sign" in
+)
n=$(($n + 2))
;;
[*])
n=$(($n * 2))
;;
esac
sleep 1
echo "$n"
done