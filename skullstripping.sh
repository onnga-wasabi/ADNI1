#!/bin/bash

while read dname
do
	python createdirs.py -d $dname
	python dumpfilenames.py -d $dname >| ${dname}_fullpath.txt
	while read src
	do
		id=`echo $src | tail -n 1 | awk -F "/" '{print $NF}' | awk -F "_" '{print $NF}' | cut -d '.' -f 1 | sed -e 's/I//'`
		#echo $id
		label=`cat ${dname}/*.csv | grep $id | cut -d ',' -f 3 | sed -e 's/\"//g'`
		#echo $label
		subject=`cat ${dname}/*.csv | grep $id | cut -d ',' -f 2 | sed -e 's/\"//g'`
		#echo $subject
		dst=`echo $src | awk -F '/' '{print $NF}'`
		#echo ${FreeSurfer_DST}/${label}/${subject}/${dst}
		#recon-all -s target -i $src -autorecon1
		echo $SUBJECTS_DIR
	done < ${dname}_fullpath.txt
done < dirs.txt
