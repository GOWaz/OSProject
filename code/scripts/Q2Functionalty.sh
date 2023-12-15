#!/bin/bash

path="/home/gowaz/Desktop/Project/backup"
path2="/home/gowaz/Desktop/Project/database"

function backup_database () {
	echo -n "Enter name: "
	read name
	
	fullName=`echo "$name.txt.gz"`
	
	gzip -c $1 > $path/$fullName 
	echo "__________________________________________________________________"
	echo " "
	#echo "Backup at: $(readlink -f $fullName)"
	echo -n "Backup at: $path ... "
	echo "Backup Name: $fullName ......Done."
	echo "__________________________________________________________________"
}

function restore_database () {

	echo -n "Enter name: "
	read name
	
	fullName=`echo "$name.txt.gz"`
	newName=`echo "$name.txt"`
	
	gzip -d $path/$fullName > $path2/$newName
	rm $path/$newName
	echo "__________________________________________________________________"
	echo " "
	#echo "Restore at: $(readlink -f $newName)"
	echo "Restored at: $path2 ... "
	echo "Restoration name: $newName ....Done."	
	echo "__________________________________________________________________"
}

function auto_backup () {
	
	read -p "Max: " max
	
	timee="* * * * *"
	
	if [ $max -eq 0 ]
	then 
		ehco "Max can't be 0"
	else
	
	read -p "Enter schedule [d] Daily [w] Weekly [m] Monthly: " choice
	
	case $choice in 
	
		d)
	  	  timee="0 0 * * *"
	  	  ;;
		w)
	  	  timee="0 0 * * 0"
	  	  ;;
		m)
	       	  timee="0 0 1 * *"
	  	  ;;
		*)
	  	  echo "Wrong input!"
	  	  ;;
	esac
	#crontab -u $USER -l > temp
	crontab -l > temp
	
	echo "$timee ./Q2AutoBackup.sh $1 $max" >> temp
	
	#crontab -u $USER temp
	crontab temp
	
	rm temp
	
	echo "Adding ($timee $1 --backup --outputdir /opt/backup --max $max) .... Done."
	
	fi
}
