#!/bin/bash

echo $$ > mod_tmp
term()
{
echo "stopped by TERM"
exit 0
}
quit()
{
echo "stopped by QUIT"
exit 0
}
kill()
{
echo "stopped by KILL"
exit 0
}
trap 'term' TERM
trap 'quit' QUIT
trap 'kill' KILL
while true
do
i=1
done