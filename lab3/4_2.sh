#!/bin/bash

pid=`pgrep -o scrfor4`
pidthree=`pgrep -n scrfor4`
sudo cpulimit --pid $pid --limit 10 >/dev/null &
kill $pidthree