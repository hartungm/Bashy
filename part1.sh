#!/bin/bash
showList=0
showCount=0
showHelp=0
for var in "$@"
do
	if [[ ${var:0:1} == "-" ]]
	then
		if [[ ${var:1:2} == "l" ]]
		then
			showList=1
		fi
		if [[ ${var:1:2} == "n" ]]
		then
			showCount=1
		fi
		if [[ ${var} == "--help" ]]
		then
			showHelp=1
		fi
	else
		if [[ -d $var ]] || [[ -f $var ]]
		then
			if [[ -d ~/.junk ]]
			then
				mv $var ~/.junk/
			else
				mkdir ~/.junk
				mv $var ~/.junk/
			fi
		else
			echo "Not a file or Directory!"
			return
		fi
	fi
done

if [[ $showList == 1 ]] 
then
	ls ~/.junk/
fi
if [[ $showCount == 1 ]]
then
	ls -1 ~/.junk | wc -l
fi
if [[ $showHelp == 1 ]]
then
	echo "Junk Command, moves specified files to ~/.junk directory. -l: Show contents of junk directory. -n: Count of files in junk directory. --help: Show help for junk command."
fi