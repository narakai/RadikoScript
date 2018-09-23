#!/usr/bin/bash

date=$(date +%Y年%m月%d日)
fndate=$(date +%Y%m%d)
pn="junction"
fn="$pn"_"$fndate.m4a"

/usr/script/radiko/rec_radiko_aac.sh TBS 180 /mnt/orangepekoe/Music/junction "$pn"

title=$(curl -s https://www.tbsradio.jp/a6j/ | nkf -wd | grep "18:30\|19:00\|20:00" | grep -v "class=" | perl -pe 's/<.?strong>//g' | perl -pe 's/<br .>//g' | grep -v "※金曜" |perl -pe 's/～/-/g'| sed -z 's/\n/;/g')

ffmpeg -i  "/mnt/orangepekoe/Music/junction/$pn.m4a" -c copy -metadata artist="ライムスター宇多丸" -metadata album="アフター6ジャンクション" -metadata title="${date};${title}"  "/mnt/orangepekoe/Music/junction/$fn"

rm -f /mnt/orangepekoe/Music/junction/$pn.m4a

lftp kiteretsu.ddns.net:50021 -u radiko << __EOL__
__EOL__
