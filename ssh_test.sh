#!/bin/sh
# needs perl
# user is root as default, change if needed


alarm() { perl -e 'alarm shift; exec @ARGV' "$@"; }

base_ip=$1
range_from=$2
range_to=$3

if [ "$1" == "help" ]
then 
	echo "usage: ./ssh_test.sh <base ip> <start number> <end number>"
	exit
fi

echo $range_from
echo $range_to
for i in $(seq $range_from $range_to)
do
	echo "Test Machine $base_ip.$i"
	alarm 5 ssh root@$base_ip.$i 'whoami; exit'
	if [ $? -ne 0 ]
	then
			echo "Cannot access Server $base_ip.$i!  DAMN!"
	fi
done
