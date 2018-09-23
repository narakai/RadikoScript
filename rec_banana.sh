#!/usr/bin/bash

date=$(date --date "1 day ago" +%Y年%m月%d日)
fndate=$(date --date "1 day ago" +%Y%m%d)
pn="banana"
fn="$pn"_"$fndate"

/usr/script/radiko/rec_radiko_aac.sh TBS 120 /mnt/orangepekoe/Music/banana "$pn"

ffmpeg -i "/mnt/orangepekoe/Music/banana/$pn.m4a" -c copy -metadata artist="バナナマン" -metadata album="バナナマンのバナナムーンGOLD" -metadata title="$date" /mnt/orangepekoe/Music/banana/$fn.m4a

rm -f "/mnt/orangepekoe/Music/banana/$pn.m4a"


