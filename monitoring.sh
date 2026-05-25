#!/bin/bash

arch=$(uname -a)
printf "#Architecture: $arch\n"

cpu=$(lscpu | grep Socket | awk '{print $2}')
printf "#CPU physical: $cpu\n"

vcpu=$(nproc)
printf "#vCPU: $vcpu\n"

mem1=$(free --mega | grep Mem | awk '{print $3}')
mem2=$(free --mega | grep Mem | awk '{print $2}')
mem3=$(free --mega | grep Mem | awk '{printf ("%.2f"), $3/$2 * 100}')
printf "#Memory Usage: $mem1/$mem2%s ($mem3%%)\n" "MB"

used=$(df -Ph --total | grep total | awk '{print $3}')
total=$(df -Ph --total | grep total | awk '{print $2}')
percent=$(df -Ph --total | grep total | awk '{printf ("%.2f"), $3/$2 * 100}')
printf "#Disk Usage: $used/$total ($percent%%)\n"

cpu_load=$(mpstat | tail -n 1 | awk '{printf("%.1f"), 100 - $NF}')
printf "#CPU Load: $cpu_load%%\n"

l_boot=$(who -b | awk '{print $3 " " $4}')
printf "#Last boot: $l_boot\n"

lvm_use=$(if [ $(lsblk | grep lvm | wc -l) -gt 0 ]
then echo "yes"
else echo "no"
fi)
printf "#LVM use: $lvm_use\n"

tcp=$(ss -t | grep ESTAB | wc -l)
printf "#Connection TCP: $tcp ESTABLISHED\n"

user_log=$(users | wc -w)
printf "#User log: $user_log\n"

ip=$(hostname -I | awk '{print $1}')
mac=$(ip link | grep ether | awk '{print $2}')
printf "#Network: $ip ($mac)\n"

sudo=$(grep -c COMMAND /var/log/sudo/sudo.log 2>/dev/null || echo 0)
printf "#Sudo: $sudo cmd\n"
