#!/bin/bash

touch /home/gowaz/Desktop/Project/database/$1
file="/home/gowaz/Desktop/Project/database/$1"

. Q1Functionalty.sh 
. Q2Functionalty.sh
. Q3Functionalty.sh
. Q4Functionalty.sh
. Q5Functionalty.sh 

function auto_monitoring () {
	#crontab -u $USER -l > temp
	crontab -l > temp

	echo "00 12 * * * ./Q3Functionalty.sh" >> temp
	
	#crontab -u $USER temp
	crontab temp
	
	rm temp
	echo "__________________________________________________________________"
	echo " "
	echo "Auto Monitoring is enabled."
	echo "__________________________________________________________________"
}

option=20

while [ $option -ne 0 ]
do 

echo "Q1($1):"
echo "[01] Add new record."
echo "[02] Delete record."
echo "[03] Search for a record."
echo "[04] Update a record."
echo "-------------------------------------------------"
echo "Q2 Backup / Restore ($1):"
echo "[05] Backup the database."
echo "[06] Restore the database."
echo "[07] Auto backup the database."
echo "-------------------------------------------------"
echo "Q3 Monitoring."
echo "[08] Enable Moitoring." 
echo "-------------------------------------------------"
echo "Q4 FTP server."
echo "[09] Upload a file."
echo "[10] Download a file."
echo "-------------------------------------------------"
echo "Q5 Search."
echo "[11] Search for multible files."
echo "[12] Search a file."
echo "[00] Exit."
echo -n "Select an option: "

read option

case $option in

  1)
    insert_new_record "$file"
    ;;

  2)
    delete_record "$file"
    ;;

  3)
    search_record "$file"
    ;;
  4)
    edit_record "$file"
    ;;
  5)
    backup_database "$file"
    ;;
  6)
    restore_database 
    ;;
  7)
    auto_backup "$file"
    ;;
  8)
    auto_monitoring
    ;;
  9)
    putt
    echo "up"
    ;;
  10)
    gett
    echo "dow"
    ;;
  11)
    search_multible_files
    ;;
  12)
    search_file 
    ;;
  *)
    echo "Exit"
    ;;
esac

done


