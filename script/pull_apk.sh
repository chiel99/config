#! /bin/bash

adb shell ls /data/app/ | grep -v google | tr -d '\015' | while read file
do
    adb pull /data/app/$file .
done
