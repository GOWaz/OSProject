#!/bin/bash

path="/opt/backup"

number=$(ls $path | wc -l)

if [ $number >= $2 ]
then
	newPath=`echo $(ls $path | head -n 1)`
	rm $path/$newPath
	name=`echo $1|cut -d "/" -f 7`
	fullName=$(echo "$(date)_$name.gz")
	gzip -c $1 > $path/$fullName 
elif [ $number < $2 ]
then
	name=`echo $1|cut -d "/" -f 7`
	fullName=$(echo "$(date)_$name.gz")
	gzip -c $1 > $path/$fullName 
fi
