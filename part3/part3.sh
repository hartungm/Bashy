#!/bin/bash

unzip $1 -d $2
for file in $2*
do
	IFS='_' read -a parts <<< "$file"
	if [[ -d $2"${parts[1]}" ]]
	then
		mv "$file" $2"${parts[1]}"
	else
		mkdir $2"${parts[1]}"
		mv "$file" $2"${parts[1]}"
	fi
done 

for directory in $2*
do
	cd $directory
	for file in *
	do
		IFS='_' read -a parts <<< "$file"
		newfile=${parts[${#parts[@]} - 1]}
		if [[ $newfile == *"-"*".txt" ]]
		then
			mv "$file" "memo.txt"
		else
			mv "$file" "$newfile"
		fi
	done
	make
	make test
	cd ..
	cd ..
done