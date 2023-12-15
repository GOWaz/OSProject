#!/bin/bash

host="192.168.198.129"
user="gow"
password="2048"

function putt () {

	echo -n "Enter file name: "
	read file
	path='.'
	ftp -inv $host <<-EOF
	user $user $password 
	put $file 
	bye 
	EOF
}
#cd $path
function gett () {

	echo -n "Enter file name: "
	read file
	path='.'
	ftp -inv $host <<-EOF
	user $user $password 
	get $file 
	bye 
	EOF
}
