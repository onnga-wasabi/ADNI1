#!/bin/bash

while read dname
do
	rm ${dname}_done.log
	python createdirs.py -d $dname
	python dumpfilenames.py -d $dname >| ${dname}_fullpath.txt
	while read src
	do
		id=`echo $src | tail -n 1 | awk -F "/" '{print $NF}' | awk -F "_" '{print $NF}' | cut -d '.' -f 1 | sed -e 's/I//'`
		label=`cat ${dname}/*.csv | grep $id | cut -d ',' -f 3 | sed -e 's/\"//g'`
		subject=`cat ${dname}/*.csv | grep $id | cut -d ',' -f 2 | sed -e 's/\"//g'`
		dst_fname=`echo $src | awk -F '/' '{print $NF}'`
		dst=`echo ${FREESURFER_DST}/${label}/${subject}/${dst_fname}.gz`
		if [ ! -e $dst ];then
			#recon-all -s target -i $src -autorecon1
			#mri_convert $SUBJECTS_DIR/target/mri/brainmask.mgz $dst
			#rm -rf $SUBJECTS_DIR/target
			echo $dst >> ${dname}_done.log
		else
			echo -n '[Attention] ' && echo -n ${dst_fname}.gz && echo ' is already exits!'
		fi
	done < ${dname}_fullpath.txt
done < dirs.txt
