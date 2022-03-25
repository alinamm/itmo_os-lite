#!/bin/bash

mkdir -p ~/test &&
{
echo "catalog test was created successfully" >> ~/report
touch ~/test/$(date +"%Y_%m_%d_%I_%M"); chmod u+x ~/test/$(date +"%Y_%m_%d_%I_%M")
}
ping -c 1 www.net_nikogo.ru &> /dev/null || echo $(date +"%y-%m-%d") $(date +"%T") " host is not avaliable" >> ~/report