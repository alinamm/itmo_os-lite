#!/bin/bash

ps -eaho user | sort -u | wc -l

for i in `ps -eaho user | sort -u`
do
ps -U $i | wc -l
done