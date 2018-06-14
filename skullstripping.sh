#!/bin/bash

while read dname
do
	python dumpfilenames.py -d $dname >| ${dname}_fullpath.txt
	python createdir.py -d $dname
	while read fname
	do
		id=`echo $fname | tail -n 1 | awk -F "/" '{print $NF}' | awk -F "_" '{print $NF}' | cut -d '.' -f 1 | sed -e 's/I//'`
		echo $id
		label=`cat ${dname}/*.csv | grep $id | cut -d ',' -f 3 | sed -e 's/\"//g'`
		echo $label
		subject=`cat ${dname}/*.csv | grep $id | cut -d ',' -f 2 | sed -e 's/\"//g'`
		echo $subject
	done < ${dname}_fullpath.txt
done < dirs.txt
