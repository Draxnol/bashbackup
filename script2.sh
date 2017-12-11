#!/bin/bash
declare -a FILENAMES

function beginBackUp(){
	echo 'enter archive name'
	read archName


}

function setBackupLoc(){
	echo 'enter a backup location.'
	read backLoc
	if test -d $backLoc
		then
			echo 'backup location is '
			echo $backLoc
			beginBackUp
		else
			echo 'Invaild location'
			setBackupLoc
	fi
}

function getInput(){
	echo 'Please enter filename.'
	read FILENAME
	if test -f $FILENAME
		then
			FILENAMES+=($FILENAME)
			echo 'would you like to add another one?'
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

getInput