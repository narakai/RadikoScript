#!/usr/bin/bash

date=$(date +%Y年%m月%d日)
fndate=$(date +%Y%m%d)
pn="session"
fn="$pn"_"$fndate.m4a"

/usr/script/radiko/rec_radiko_aac.sh TBS 115 /mnt/orangepekoe/Music/session "$pn"

sleep 20h

date2=$(date +%Y.%m.%d)
Jdate2=$(date --data "1 day ago" +%m月%d日)

Info=$(curl -s https://www.tbsradio.jp/ss954/ | grep -e "<h1 class=\"b-media__heading\">" -e "$date2" | grep -A1 "$date2" | grep "<h1" | sed -e 's/<[^>]*>//g' | sed -e "s/▼${Jdate2}（.）放送分（TBSラジオ「荻上チキ・Session-22」）//g" | sed 's/^ *//g' | grep -v "告 知" | sed -e 's/▼/ /g' | sed -e 's/TBSラジオ「荻上チキ・Session-22」平日22時～//g' | sed -e 's/【.*】//g' | tr '\n' '/' | sed 's%/$%%g')



ffmpeg -i  "/mnt/orangepekoe/Music/session/$pn.m4a" -c copy -metadata artist="荻上チキ" -metadata album="Session-22" -metadata title="$date / $Info"  "/mnt/orangepekoe/Music/session/$fn"

rm -f /mnt/orangepekoe/Music/session/$pn.m4a

#lftp kiteretsu.ddns.net:50021 -u radiko << __EOL__

