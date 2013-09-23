#!/bin/sh
# written on a mac. Due to its BSD-system, the 
# 'open' command may not be available on your machine


base_url=$1
range_from=$2
range_to=$3

if [ "$1" == "help" ]
then 
	echo "usage: ./open_multiple_websites.sh <base url> <start number> <end number>"
	exit
fi
echo $range_from
echo $range_to
for i in $(seq $range_from $range_to)
do
	echo $base_url.$i
	open http://$base_url.$i
done
