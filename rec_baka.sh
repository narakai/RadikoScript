#!/usr/bin/bash

date=$(date --date "1 day ago" +%Y年%m月%d日)
fndate=$(date --date "1 day ago" +%Y%m%d)
pn="baka"
fn="$pn"_"$fndate.m4a"

/usr/script/radiko/rec_radiko_aac.sh TBS 120 /mnt/orangepekoe/Music/baka "$pn"

ffmpeg -i  "/mnt/orangepekoe/Music/baka/$pn.m4a" -c copy -metadata artist="伊集院光" -metadata album="伊集院光 深夜の馬鹿力" -metadata title="$date"  "/mnt/orangepekoe/Music/baka/$fn"

rm -f /mnt/orangepekoe/Music/baka/$pn.m4a

#lftp kiteretsu.ddns.net:50021 -u radiko << __EOL__

