#!/bin/bash

touch searshHistory.txt

sh="searshHistory.txt"

function search_multible_files () {

	echo -n "Enter files names: "
	declare -a fileNames
	read fileNames
	for i in ${fileNames[@]}
	do 
	info=$(grep -w "$i" $sh)
	key=`echo $info| cut -d ":" -f 1`
	
	if [ $i == $key ]
	then
		echo $info
	else
		found=$(sudo find / -type f -name "$i" 2>/dev/null & wait)
		echo "---------------------------------------------------"
		echo "$found"
		echo "---------------------------------------------------"
		echo "$i : $found" >> $sh
	fi
	done
}

function search_file () {
	echo -n "Enter file name: "
	read fileName
	info=$(find / -name "$fileName" -exec ls -la {} \; 2>/dev/null)
	echo "----------------------------------------"
	echo $info|cut -d " " -f 1,2,3
	echo "----------------------------------------" 
}
