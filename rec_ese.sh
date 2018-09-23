#!/usr/bin/bash

date=$(date +%Y年%m月%d日)
fndate=$(date +%Y%m%d)
pn="ese"
fn="$pn"_"$fndate.m4a"

/usr/script/radiko/rec_radiko_aac.sh JOAB 6 /mnt/orangepekoe/Music/ese "$pn"


ffmpeg -i  "/mnt/orangepekoe/Music/ese/$pn.m4a" -c copy -metadata artist="関根麻里" -metadata album="エンジョイ・シンプル・イングリッシュ" -metadata title="$date"  "/mnt/orangepekoe/Music/ese/$fn"

rm -f /mnt/orangepekoe/Music/ese/$pn.m4a

lftp kiteretsu.ddns.net:50021 -u radiko << __EOL__
__EOL__
