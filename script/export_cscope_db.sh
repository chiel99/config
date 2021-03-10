#! /bin/bash

support_list="
directfb
mkd_kernel
bmw_mkd
momedia
momedia_audio
ortp
"

function print_support_list ()
{
	for i in $support_list; do
		echo $i
	done
}

if [ $# != 1 ]; then
	echo "Usage: $0 <"
	print_support_list
	echo ">"
	exit 0
fi

for i in $support_list; do
	if [ $1 == $i ]; then
		break
	fi
done

if [ $i != $1 ]; then
	echo "Usage: $0 <"
	print_support_list
	echo ">"
	exit 0
fi

Cscope_db_folder="/home/richard/cscope_db/$1"
Cscope_db_file="$Cscope_db_folder/cscope.files"
Cscope_db_out="$Cscope_db_folder/cscope.out"

export CSCOPE_DB=$Cscope_db_out
