#!/bin/bash
rm -rf */
getMonday(){
        if [ $(date +%u) -ne 1 ]
        then
                mon=$(date +'%Y%m%d' -d'last monday')
        else
                mon=`date +'%Y%m%d'`
        fi
}
getMonday
i=0
while read line
do
        getDay=`date +'%d%m%Y' -d"$mon+$i days" `
        mkdir $getDay
        wget -P $getDay $(wget --user-agent 'Mozilla/5.0' -qO -  "www.google.be/search?q=${line}\&tbm=isch" | sed 's/</\n</g' | grep '<img' | head -n 10 | tail -n1 | sed 's/.*src="\([^"]*\)".*/\1/')
i=$(($i+1))
done < idol.txt

