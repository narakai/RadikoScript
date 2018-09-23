#!/usr/bin/bash

date=$(date --date "1 day ago" +%Y年%m月%d日)
fndate=$(date --date "1 day ago" +%Y%m%d)
pn="megane"
fn="$pn"_"$fndate.m4a"

/usr/script/radiko/rec_radiko_aac.sh TBS 120 /mnt/orangepekoe/Music/megane "$pn"

ffmpeg -i "/mnt/orangepekoe/Music/megane/$pn.m4a" -c copy -metadata artist="おぎやはぎ" -metadata album="おぎやはぎのメガネびいき" -metadata title="$date" "/mnt/orangepekoe/Music/megane/$fn"

#rm -f "/mnt/orangepekoe/Music/megane/$pn.m4a"
