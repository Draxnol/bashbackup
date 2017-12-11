#!/bin/bash

##########################################
#Project name: Bash Back Up Script.      #
#Created By: Some nerds in T147.         #
#Date Completed: Few hours after due date#
#Copyright: Donald Trump 2017            #
#If found, please discard in a           #
#environmentally unfriendly manner.		 #
#Ver. 10.2.3.000000000000200001          #
##########################################

#declare Array that will store file/folder locations
declare -a FILENAMES

function begin(){
	echo 'DISCLAIMER: The creators of this software assume no responsiblity or liability for any data loss, world wars or natural disasters caused by the use of this software.'

	getInput
}
#Get files/folders from users, and check if files exist.
function getInput(){ 
	echo 'Please enter a filename.'
	read FILENAME
	if test -f $FILENAME || test -d $FILENAME;
		then
			FILENAMES+=($FILENAME)
			echo 'Would you like to add another one? yes / no'
			read ans
			
			if [ $ans == 'yes' ] 
				then
				getInput
			elif [ $ans ==  'no' ]
				then
				setBackupLoc
			fi
	else
		echo 'Invaild File. Try again'
		getInput
	fi
}
#Asks user where to but the archive and check it.
function setBackupLoc(){
	echo 'Enter a backup location.'
	read backLoc
	if test -d $backLoc
		then
			echo 'Backup location is '
			echo $bacLoc
			beginBackUp $backLoc
		else
			echo 'Invaild location'
			setBackupLoc
	fi
}
#Main function.
function beginBackUp(){
	
	echo 'Enter the name of the archive.'
	read archName
	
	echo 'Would you like to apply compression? yes / no'
	read ans
	echo

	echo "Creating archive $archName in $1"
	date

	echo
	if [ $ans == 'yes' ]
		then
			tar czf $1/$archName.tar "${FILENAMES[@]}"
		else
			tar cf $1/$archName.tar "${FILENAMES[@]}"
	fi
	
	echo 'Archive completed.'
	date
}

begin