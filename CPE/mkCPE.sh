#!/bin/bash

# eg ./mkCPE.sh Debian5_Fedora14_Matches Debian.CPE.import
grep -v '^#' $1|while read packages; do
	package1=$(echo $packages|cut -d: -f1)
	package2=$(echo $packages|cut -d: -f2)
	cpe=$(grep ^$package1\; $2|cut -d\; -f2)
	if [ "$cpe" != "" ]; then
		echo $package2\;$cpe
	fi
done
