#! /bin/bash

APK_list=`ls *apk`

for apk in $APK_list;
do
    echo "adb install -f -r $apk"
    adb install -f -r $apk
done
