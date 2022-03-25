#!/bin/bash
ps -ax -o pid,command | awk '{ if ($2~/^\/sbin\// ) print $1 }' > res2