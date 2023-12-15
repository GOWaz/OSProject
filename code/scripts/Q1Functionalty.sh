#!/bin/bash

function insert_new_record () {

	echo -n "Enter key: "
	read key

	info=$(grep -w "$key" $1)

	key2=`echo $info| cut -d ":" -f 1`

	if [ $key == $key2 ]
	then 
		echo "Already exist"
	else
		echo -n "Enter value: "
	  	read value
	  	
	  	coded=`echo $value|base64`
	  	
	  	echo "version 1 $USER" >> $1 
	  	echo "$key : $coded" >> $1
	  	
	  	echo "__________________________________________________________________"
	  	echo " "
	  	echo "Adding new key to the database ($1)...... Done"		
	  	echo "__________________________________________________________________"
	  	echo " "
	fi
}

function delete_record () {

	echo -n "Enter key: "
	read key 

	info=$(grep -n "$key" $1)
	
	key2=`echo $info| cut -d ":" -f 2`
	
	line=`echo $info| cut -d ":" -f 1`
	
	line2=$(expr $line - 1)
	
	if [ $key == $key2 ] 
	then 
		sed -i.bak -e "$line d;$line2 d" $1
	
		echo "_______________________________________________________"
		echo " "
		echo "The record holding the key $key got deleted."
		echo "_______________________________________________________"
		echo " "
	else
		echo "__________"
		echo " "
		echo "Does not exist"
		echo "__________"
		echo " "
	fi
}

# grep -n
# grep -B 1

function search_record () {
	
	echo -n "Enter key: "
	read key 
	
	value=$(grep -w "$key" $1)
	
	key2=`echo $value| cut -d ":" -f 1`
	
	if [ $key == $key2 ] 
	then  
		decoded=`echo $value| cut -d ':' -f2-`
	
		echo "______________________________________________"
		echo " "
		echo "$key : $(echo $decoded|base64 -d)" 
		echo "______________________________________________"
		echo " "
	else
		echo "__________"
		echo " "
		echo "Does not exist"
		echo "__________"
		echo " "
	fi
}

function edit_record () {
	
	echo -n "Enter key: "
	read key 
	
	info=$(grep -n "$key" $1)
	
	key2=`echo $info| cut -d ":" -f 2`
	
	line=`echo $info| cut -d ":" -f 1`
	
	line2=$(expr $line - 1)
	
	fullInfo=$(grep -B 1 "$key" $1)
	
	number=`echo $fullInfo| cut -d " " -f 2`
	
	newNumber=$(expr $number + 1)
	
	
	if [ $key == $key2 ] 
	then 
	
		coded=`echo $info| cut -d ':' -f3-`
		
		echo "old value: $(echo $coded|base64 -d)"
	
		echo -n "Enter new value: "
		read newValue
	
		newCoded=`echo $newValue|base64`
		
		sed -i "$line2 s/$number/$newNumber/" $1
		sed -i "$line s/$coded/$newCoded/" $1
	
		echo "__________"
		echo " "
		echo "Successful"
		echo "__________"
		echo " "
	else
		echo "__________"
		echo " "
		echo "Does not exist"
		echo "__________"
		echo " "
	fi
}

