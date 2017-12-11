#!/bin/bash
declare -a FILENAMES

function beginBackUp(){
	for i in "${FILENAMES[@]}"
	do
		echo $i
	done
}

function setBackupLoc(){
	echo 'enter a backup location.'
	read backLoc
	if test -d $backLoc
		then
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
			echo 'file added to array'
			echo 'would you like to add another one?'
			read ans
			
			if [ $ans == 'yes' ] 
				then
				getInput
			elif [ $ans ==  'no' ]
				then
				echo 'setting back up location'
				setBackupLoc
			fi
	else
		echo 'Invaild File. Try again'
		getInput
	fi
}

getInput