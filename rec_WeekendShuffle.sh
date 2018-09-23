#!/usr/bin/bash

date=$(date +%Y年%m月%d日)
fndate=$(date +%Y%m%d)
pn="WeekendShuffle"
fn="$pn"_"$fndate.m4a"

/usr/script/radiko/rec_radiko_aac.sh TBS 120 /mnt/orangepekoe/Music/weekend_shuffle $pn

#title section
wget -O /tmp/wes.html https://www.tbsradio.jp/utamaru/
lab=$(grep -A5 "ラボ.*23時" /tmp/wes.html | grep strong |perl -pe 's/<.*?>//g' | perl -pe 's/[\r\n|\n]//g')
movie=$(grep -A5 "22時" /tmp/wes.html | grep strong | perl -pe 's/[\r\n|\n]//g' |sed -e 's/\(.*『\)\(.*\)\(』.*\)/「\2」/g' )

ffmpeg -i "/mnt/orangepekoe/Music/weekend_shuffle/$pn.m4a" -c copy -metadata artist="宇多丸" -metadata album="ライムスター宇多丸のウィークエンド・シャッフル" -metadata title="$date $lab/$movie" "/mnt/orangepekoe/Music/weekend_shuffle/$fn"

rm -f "/mnt/orangepekoe/Music/weekend_shuffle/$pn.m4a"
rm -f /tmp/wes.html
