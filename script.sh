#!/bin/bash

#This line declares an array
declare -a FILENAMES

#Declares a function
function checkIfFileExists(){
	#checks if the value in the var is a valid file or dir
	if test -f $FILENAME 
		#if the statement above is true
		then	
			echo "file exists"
			#add file to array
			FILENAMES=(${FILENAMES[@]}$FILENAME)
			echo $FILENAMES
	else
		#if its not true.
		echo "what the hell am i doiing"
	fi

}
#this function doesnt do anything yet
function setBackupLocation(){
	echo 'Where would you like to put the backup archive? '
	read bakLoc
	if test -d $bakLoc
		then
			echo 'would you like to compress?'
			read ans
			if [ $ans == 'yes' ]
				then 
				beginBackUp "1"
			else
				beginBackUp "2" 
			fi

	fi
}
#this function doesnt do anything yet
function beginBackUp(){
	if [ "$1" -eq "1"]
		then
		#backup with compression
		echo ''
	else
		echo ''
	fi	#backup without compression
}
#set var to 0 
count=0

#while the count is 0, loop
while [ "$count" -eq "0" ] 
	do
		#ask the user if they would like to add a file the array
		echo 'would you like to enter another file?'
		read reply
		
		if [ $reply == 'yes' ] 
			then
				echo 'enter file name'
				#get filename from user
				read FILENAME
				#run the function
				checkIfFileExists
		else
			setBackupLocation
		fi

done