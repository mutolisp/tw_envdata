#!/usr/bin/env bash

for i in `ls | grep *.csv$`
do
    # 1. Formating timestamp mm/dd/yyyy to yyyy/mm/dd
    # 2. Remove the original (duplicate) header
    # 3. Insert new header
    vim "+%s/\(^.*\)\/\([1-2][0-9][0-9][0-9]\),/\2\/\1,/g" \
        "+g/^日期/d" \
        "+1,1s/\(^.*\)/date,station,measurement,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24\r\1/g" "+wq" ${i}
done
