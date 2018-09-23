#!/usr/bin/bash

date=$(date +%Y年%m月%d日)
fndate=$(date +%Y%m%d)
pn="toradioto"
fn="$pn"_"$fndate.m4a"

/usr/script/radiko/rec_radiko_aac.sh TBS 150 /mnt/orangepekoe/Music/toradioto "$pn"

#get program information
Info=$(curl -s https://www.tbsradio.jp/ij/ | grep -e "<strong>" | grep -e "<h1>" | grep -oP "<strong>.*?</strong>" | sed -e 's/<[^>]*>//g')
Guest=$(echo $Info | sed -n 1p)
Post=$(echo $Info | sed -n 2p)

ffmpeg -i  "/mnt/orangepekoe/Music/toradioto/$pn.m4a" -c copy -metadata artist="伊集院光" -metadata album="伊集院光とラジオと" -metadata title="$date ゲスト:$Guest 投稿テーマ:$Post"  "/mnt/orangepekoe/Music/toradioto/$fn"

rm -f /mnt/orangepekoe/Music/toradioto/$pn.m4a

lftp kiteretsu.ddns.net:50021 -u radiko << __EOL__
__EOL__
