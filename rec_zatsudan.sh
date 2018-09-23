#!/usr/bin/bash

date=$(date +%Y年%m月%d日)
fndate=$(date +%Y%m%d)
program_name="いとうせいこうxみうらじゅん ザツダン!"
filename="ザツダン$date"

/usr/script/radiko/radiko.sh QRR 61 "$filename"

id3v2 -a "いとうせいこうxみうらじゅん" -A "$program_name" -t "$date" "/tmp/radiko_out/$filename.m4a"

mv "/tmp/radiko_out/$filename.m4a" /srv/share/Music/
