#!/bin/bash

ls -d addons-plan/* | while read dir
do
	if [ -d "$dir" ]; then
      	 	MainfestFile=$dir"/__manifest__.py"
		if [ -f "$MainfestFile" ]; then
  			echo "$MainfestFile exist"
		fi
	fi
done
