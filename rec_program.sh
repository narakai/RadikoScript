#!/bin/bash -l

if [[ ! -e /mnt/orangepekoe/Music/$1 ]]
then
	mkdir /mnt/orangepekoe/Music/$1
fi

case $1 in
	baka)
		date=$(date --date "1 day ago" +%Y年%m月%d日)
		fndate=$(date --date "1 day ago" +%Y%m%d)
		recTime=120
		ch='TBS'
		artist="伊集院光"
		album="伊集院光 深夜の馬鹿力"
		title="${date}"
		;;
	TokyoPod)
		date=$(date --date "1 day ago" +%Y年%m月%d日)
		fndate=$(date --date "1 day ago" +%Y%m%d)
		recTime=60
		ch='TBS'
		artist='東京ポッド許可局員'
		album='東京ポッド許可局'
		title="${date}"
		;;
	WeekendShuffle)
		date=$(date +%Y年%m月%d日)
		fndate=$(date +%Y%m%d)
		recTime=120
		ch='TBS'
		artist='宇多丸'
		album='ライムスター宇多丸のウィークエンド・シャッフル'
		title="$date $lab/$movie"
		;;
	banana)
		date=$(date --date "1 day ago" +%Y年%m月%d日)
		fndate=$(date --date "1 day ago" +%Y%m%d)
		recTime=120
		ch='TBS'
		artist="バナナマン"
		album="バナナマンのバナナムーンGOLD"
		title="${date}"
		;;
	megane)
		date=$(date --date "1 day ago" +%Y年%m月%d日)
		fndate=$(date --date "1 day ago" +%Y%m%d)
		recTime=120
		ch='TBS'
		artist="おぎやはぎ"
		album="おぎやはぎのメガネびいき"
		title="${date}"
		;;
	mygame)
		date=$(date --date "1 day ago" +%Y年%m月%d日)
		fndate=$(date --date "1 day ago" +%Y%m%d)
		recTime=30
		ch='TBS'
		artist="宇多丸"
		album="ライムスター宇多丸とマイゲーム・マイライフ"
		title="${date}"
		;;
	remix)
		date=$(date --date "1 day ago" +%Y年%m月%d日)
		fndate=$(date --date "1 day ago" +%Y%m%d)
		recTime=30
		ch='FMT'
		artist="山田五郎と中川翔子"
		album="山田五郎と中川翔子の『リミックスZ』"
		title="${date}"
		;;
	session)
		date=$(date +%Y年%m月%d日)
		fndate=$(date +%Y%m%d)
		recTime=115
		ch='TBS'
		artist='荻上チキ'
		album='Session-22'
		;;
	toradioto)
		date=$(date +%Y年%m月%d日)
		fndate=$(date +%Y%m%d)
		recTime=150
		ch='TBS'
		artist='伊集院光'
		album='伊集院光とラジオと'
		;;
	conte)
		date=$(date --date "1 day ago" +%Y年%m月%d日)
		fndate=$(date --date "1 day ago" +%Y%m%d)
		recTime=120
		ch='TBS'
		artist="エレ片"
		album="エレ片のコント太郎"
		title="${date}"
		;;
	bakalizm)
		date=$(date +%Y年%m月%d日)
		fndate=$(date +%Y%m%d)
		recTime=110
		ch='LFR'
		artist='バカリズム'
		album='バカリズムのオールナイトニッポンPremium'
		title="$date"
		;;
	kougami)
		date=$(date +%Y年%m月%d日)
		fndate=$(date +%Y%m%d)
		recTime=110
		ch='LFR'
		artist='鴻上尚史'
		album='鴻上尚史のオールナイトニッポンPremium'
		title="$date"
		;;
	kendi)
		date=$(date +%Y年%m月%d日)
		fndate=$(date +%Y%m%d)
		recTime=110
		ch='LFR'
		artist='大槻ケンヂ'
		album='大槻ケンヂのオールナイトニッポンPremium'
		title="$date"
		;;
	test)
		date=$(date +%Y年%m月%d日)
		fndate=$(date +%Y%m%d)
		recTime=1
		ch='TBS'
		artist='test'
		album='test'
		title="test"
		;;
	*)
		echo 'Invalid augument'
		exit
esac

/usr/script/radiko/rec_radiko_aac.sh ${ch} ${recTime} /mnt/orangepekoe/Music/${1} "${1}"

case $1 in
	session)
		sleep 20h
		date2=$(date +%Y.%m.%d)
		Jdate2=$(date --data "1 day ago" +%m月%d日)

		Info=$(curl -s https://www.tbsradio.jp/ss954/ | grep -e "<h1 class=\"b-media__heading\">" -e "$date2" | grep -A1 "$date2" | grep "<h1" | sed -e 's/<[^>]*>//g' | sed -e "s/▼${Jdate2}（.）放送分（TBSラジオ「荻上チキ・Session-22」）//g" | sed 's/^ *//g' | grep -v "告 知" | sed -e 's/▼/ /g' | sed -e 's/TBSラジオ「荻上チキ・Session-22」平日22時～//g' | sed -e 's/【.*】//g' | tr '\n' '/' | sed 's%/$%%g')
		title="$date / $Info"
		;;

	WeekendShuffle)
		wget -O /mnt/orangepekoe/Music/${1}/wes.html https://www.tbsradio.jp/utamaru/
		lab=$(grep -A5 "ラボ.*23時" /tmp/wes.html | grep strong |perl -pe 's/<.*?>//g' | perl -pe 's/[\r\n|\n]//g')
		movie=$(grep -A5 "22時" /tmp/wes.html | grep strong | perl -pe 's/[\r\n|\n]//g' |sed -e 's/\(.*『\)\(.*\)\(』.*\)/「\2」/g' )
		title="$date $lab/$movie"
		;;

	toradioto)
		rec_toradioto.sh Info=$(curl -s https://www.tbsradio.jp/ij/ | grep -e "<strong>" | grep -e "<h1>" | grep -oP "<strong>.*?</strong>" | sed -e 's/<[^>]*>//g')
		Guest=$(echo $Info | sed -n 1p)
		Post=$(echo $Info | sed -n 2p)
		title="$date ゲスト:$Guest 投稿テーマ:$Post"
		;;

	*)
		:
		;;

esac

ffmpeg -i  "/mnt/orangepekoe/Music/${1}/${1}.m4a" -acodec copy -metadata artist="${artist}" -metadata album="${album}" -metadata title="$title"  "/mnt/orangepekoe/Music/${1}/${1}_${fndate}.m4a"

rm -f /mnt/orangepekoe/Music/${1}/${1}.m4a

