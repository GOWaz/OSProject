#!/bin/bash

function memory () {
	echo ""
	echo "memory usage"
	free -h
	echo "" 
}


function cpuusage(){
	echo ""
	echo "cpu usage:"
	top -b -n 1 -d1 | grep "Cpu(s)" 
	echo ""
}



function hard() {
	echo ""
	echo "hard usage"
	df -h
	echo ""
}


function e() { 
	memory
	cpuusage
	hard
}

#function start () {
	#while [ 0 ]
	#do 
   		#while [ $(date +%T) = 23:52:00 ]
   		#do 
    			#touch  /home/gowaz/Desktop/q.$(date +%T).txt
    			#e > /home/gowaz/Desktop/q.$(date +%T).txt
   		#done
	#done
#}
#touch  /home/gowaz/Desktop/q.$(date +%T).txt
#e > /home/gowaz/Desktop/q.$(date +%T).txt

touch  /home/gowaz/Desktop/AM.txt
e > /home/gowaz/Desktop/AM.txt
