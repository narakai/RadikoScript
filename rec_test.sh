#!/usr/bin/bash

date=$(date +%Y年%m月%d日)
fndate=$(date +%Y%m%d)
pn="WeekendShuffle"
fn="$pn"_"$fndate.m4a"

#title section
#wget -O /tmp/wes.html https://www.tbsradio.jp/utamaru/
lab=$(grep -A5 "ラボ.*23時" /tmp/wes.html | grep strong |perl -pe 's/<.*?>//g' | perl -pe 's/[\r\n|\n]//g')
#movie=$(grep -A2 "22時" /tmp/wes.html | grep strong | sed -e 's/\(.*『\)\(.*\)\(』.*\)/「\2」/g')
movie=$(grep -A5 "22時" /tmp/wes.html | grep strong | perl -pe 's/[\r\n|\n]//g' |sed -e 's/\(.*『\)\(.*\)\(』.*\)/「\2」/g' )

echo -e "lab is \n$lab"
echo -e "movie is \n$movie"


