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
declare -a FILENAMES

function begin(){
	echo 'DISCLAIMER: The creators of this software assume no responsiblity or liability for any data loss, world warsor natural disasters caused by the use of this software.'

	getInput
}

function getInput(){ 
	echo 'Please enter a filename.'
	read FILENAME
	if test -f $FILENAME || test -d $FILENAME;
		then
			FILENAMES+=($FILENAME)
			echo 'would you like to add another one? yes / no'
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

function setBackupLoc(){
	echo 'enter a backup location.'
	read backLoc
	if test -d $backLoc
		then
			echo 'backup location is '
			echo $backLoc
			beginBackUp $backLoc
		else
			echo 'Invaild location'
			setBackupLoc
	fi
}

function beginBackUp(){
	echo 'enter the name of the archive'
	read archName
	echo 'would you like to apply compression? yes / no'
	read ans
	
	date
	echo "Creating archive $archName in $1"
	echo
	if [ $ans == 'yes' ]
		then
			tar czf $1/$archName.tar "${FILENAMES[@]}"
		else
			tar cf $1/$archName.tar "${FILENAMES[@]}"
	fi
	echo 'Archive Completed'
	date
}

begin