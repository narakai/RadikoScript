#!/usr/bin/bash

date=$(date +%Y年%m月%d日)
fndate=$(date +%Y%m%d)
pn="eikaiwa"
fn="$pn"_"$fndate.m4a"

/usr/script/radiko/rec_radiko_aac.sh JOAB 16 /mnt/orangepekoe/Music/eikaiwa "$pn"

ffmpeg -i  "/mnt/orangepekoe/Music/eikaiwa/$pn.m4a" -c copy -metadata artist="大西泰斗" -metadata album="ラジオ英会話" -metadata title="$date"  "/mnt/orangepekoe/Music/eikaiwa/$fn"

rm -f /mnt/orangepekoe/Music/eikaiwa/$pn.m4a

lftp kiteretsu.ddns.net:50021 -u radiko << __EOL__
__EOL__
