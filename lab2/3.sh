#!/bin/bash

ps -ax -o pid,ppid --sort=start | awk -v h=$$ '{if ($1 != h &&  $2 != h) print $1}' | tail -1