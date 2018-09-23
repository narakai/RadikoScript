#!/usr/bin/bash

date=$(date +%Y年%m月%d日)
fndate=$(date +%Y%m%d)
pn="mygame"
fn="$pn"_"$fndate"

/usr/script/radiko/rec_radiko_aac.sh TBS 30 /mnt/orangepekoe/Music/mygame $pn

ffmpeg -i "/mnt/orangepekoe/Music/mygame/$pn.m4a" -c copy -metadata artist="宇多丸" -metadata album="ライムスター宇多丸とマイゲーム・マイライフ" -metadata title="$date" "/mnt/orangepekoe/Music/mygame/$fn.m4a"

rm -f "/mnt/orangepekoe/Music/weekend_shuffle/$pn.m4a"
