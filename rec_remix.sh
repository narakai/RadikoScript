#!/usr/bin/bash

date=$(date --date "1 day ago" +%Y年%m月%d日)
fndate=$(date --date "1 day ago" +%Y%m%d)
pn="remix"
fn="$pn"_"$fndate.m4a"

/usr/script/radiko/rec_radiko_aac.sh FMT 31 /mnt/orangepekoe/Music/remix "$pn"

ffmpeg -i "/mnt/orangepekoe/Music/remix/$pn.m4a" -c copy -metadata artist="山田五郎と中川翔子" -metadata album="山田五郎と中川翔子の『リミックスZ』" -metadata title="$date" "/mnt/orangepekoe/Music/remix/$fn"

rm -f "/mnt/orangepekoe/Music/remix/$pn.m4a"

