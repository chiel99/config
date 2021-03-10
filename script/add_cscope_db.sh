#! /bin/bash

support_list="
directfb=/home/richard/tmp/directfb-1.4.16
mkd_kernel=/home/richard/Projects/BMW_MKD/linux-2.6.35.3
bmw_mkd=/home/richard/Projects/BMW_MKD/movial/bmw-mkd-1.0
momedia=/home/richard/Projects/WFC/vendor/movial/SeeWorks/momedia
momedia_audio=/home/richard/Projects/WFC/vendor/movial/SeeWorks/momedia_audio
ortp=/home/richard/Projects/WFC/vendor/movial/SeeWorks/ortp
"
parse_path=
for i in $support_list; do
        name=`echo $i | awk -F= '{print $1}'`
        path=`echo $i | awk -F= '{print $2}'`
        [ "$name" == "$1" ] && parse_path="$path" && break
done

function print_support_list ()
{
	echo "Support List:"
	for i in $support_list; do
		echo $i
	done
}

if [ $# != 2 ]; then
	print_support_list
	echo "$0 support_list is_kernel(1 or 0)"
	exit 0
fi

if [ $parse_path == "" ]; then
	print_support_list
	exit 0
fi

echo "$parse_path"
Cscope_db_folder="/home/richard/cscope_db/$1"
Cscope_db_file="$Cscope_db_folder/cscope.files"
Cscope_db_out="$Cscope_db_folder/cscope.out"
Src_Codebase=$parse_path

cd /

if [ $2 == 1 ]; then
	echo "Kernel..."
	find $Src_Codebase \
		-path $Src_Codebase/arch -a -prune \
		-o -name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" > $Cscope_db_file

	find $Src_Codebase/arch/arm/boot \
		-name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" >> $Cscope_db_file
	find $Src_Codebase/arch/arm/common \
		-name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" >> $Cscope_db_file
	find $Src_Codebase/arch/arm/configs \
		-name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" >> $Cscope_db_file
	find $Src_Codebase/arch/arm/include \
		-name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" >> $Cscope_db_file
	find $Src_Codebase/arch/arm/kernel \
		-name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" >> $Cscope_db_file
	find $Src_Codebase/arch/arm/lib \
		-name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" >> $Cscope_db_file
	find $Src_Codebase/arch/arm/mm \
		-name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" >> $Cscope_db_file
	find $Src_Codebase/arch/arm/nwfpe \
		-name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" >> $Cscope_db_file
	find $Src_Codebase/arch/arm/oprofile \
		-name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" >> $Cscope_db_file
	find $Src_Codebase/arch/arm/perfmon \
		-name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" >> $Cscope_db_file
	find $Src_Codebase/arch/arm/tools \
		-name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" >> $Cscope_db_file
	find $Src_Codebase/arch/arm/vfp \
		-name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" >> $Cscope_db_file
	find $Src_Codebase/arch/arm/mach-msm \
		-name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" >> $Cscope_db_file
else
	find $Src_Codebase -name "*.c" -o -name "*.h" -o -name "*.java" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.S" > $Cscope_db_file
fi


cd $Cscope_db_folder
cscope -b -q -k
export CSCOPE_DB=$Cscope_db_out
