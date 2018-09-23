#!/usr/bin/bash

date=$(date +%Y年%m月%d日)
fndate=$(date +%Y%m%d)
pn="vocaburider"
fn="$pn"_"$fndate.m4a"

/usr/script/radiko/rec_radiko_aac.sh JOAB 6 /mnt/orangepekoe/Music/vocaburider "$pn"


htmlFile=$(curl https://www2.nhk.or.jp/gogaku/english/vr-radio/words.cgi)
TITLE=$(echo "$htmlFile" | grep "<b>\|<div>" | perl -pe 's/月/-/' | grep "$(date "+%-m-%-d")" | perl -pe 's/.*「(.*)」.*/\1/g')
words=$(echo "$htmlFile" | grep "<b>\|<div>" | perl -pe 's/月/-/' | grep "$(date "+%-m-%-d")" -A4 | perl -pe 's/.*<b>(.*)<\/b>.*/\1/g' | grep -v "$(date "+%-m-%-d")" | sed -z 's/\n/ /g' | sed 's/ $//g')

ffmpeg -i  "/mnt/orangepekoe/Music/vocaburider/$pn.m4a" -c copy -metadata artist="ボキャブライダー" -metadata album="ボキャブライダー" -metadata title="$date $TITLE" -metadata comment="$words" "/mnt/orangepekoe/Music/vocaburider/$fn"

rm -f /mnt/orangepekoe/Music/vocaburider/$pn.m4a

lftp kiteretsu.ddns.net:50021 -u radiko << __EOL__
__EOL__
