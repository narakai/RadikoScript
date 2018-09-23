#!/usr/bin/bash

date=$(date +%Y年%m月%d日)
fndate=$(date +%Y%m%d)
pn="TokyoPod"
fn="$pn"_"$fndate.m4a"

/usr/script/radiko/rec_radiko_aac.sh TBS 60 /mnt/orangepekoe/Music/TokyoPod $pn

ffmpeg -i "/mnt/orangepekoe/Music/TokyoPod/$pn.m4a" -c copy -metadata artist="東京ポッド許可局員" -metadata album="東京ポッド許可局" -metadata title="$date" "/mnt/orangepekoe/Music/TokyoPod/$fn"

rm -f "/mnt/orangepekoe/Music/TokyoPod/$pn.m4a"
