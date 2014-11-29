#!/usr/bin/env bash

if [ ! -d utf8 ]; then
    mkdir -p utf8 
fi

for i in `ls | grep csv$`
do 
    j=`basename "${i}" .csv`
    sed -i "" 's/"//g' ${j}.csv
    piconv -f big5 -t utf8 ${i} > utf8/${j}.csv
    if [ `cat ${i} | wc -l` -lt 2 ]; then
        sed -i "" 's//\
/g' ${j}.csv
    fi
    yr=`awk -F',' ' {print $1}' ${j}.csv | tail -n1 | awk -F'/' '{print $1}'`
    stn=`awk -F',' ' {print $2}' ${j}.csv | tail -n1`
    echo ${j}.csv ${yr}${stn}.csv
done
