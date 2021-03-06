#!/bin/bash

#Example
#{
#    "version": "https://jsonfeed.org/version/1",
#    "title": "My Example Feed",
#    "home_page_url": "https://example.org/",
#    "feed_url": "https://example.org/feed.json",
#    "items": [
#        {
#            "id": "2",
#            "content_text": "This is a second item.",
#            "url": "https://example.org/second-item"
#        },
#        {
#            "id": "1",
#            "content_html": "<p>Hello, world!</p>",
#            "url": "https://example.org/initial-post"
#        }
#    ]
#}
filepath="/mnt/orangepekoe/Music/list.json"

fileList=$(ls /mnt/orangepekoe/Music/* | grep _20 )
# reserved by update check block

programList=$(echo "$fileList" | cut -d_ -f 1| sort | uniq)
echo "{" > $filepath
cat << _EOF_ > $filepath
{
    "version": "https://jsonfeed.org/version/1",
    "title": "Radiko Feed",
    "items": [
        {
_EOF_

for program in $(echo "$programList"); do
    dateList=$(echo "$fileList" | grep "$program" | cut -d_ -f 2 | sed 's/.m4a//g')

    for date in $(echo "$dateList"); do
        cat << _EOL_ >> $filepath
        },
        {
            "id": "http://192.168.0.10/Music/${program}/${program}_${date}.m4a"
            "title": "${program} ${date}"
_EOL_
    done
done

echo '        }' >> $filepath
echo '    ]' >> $filepath
echo '}' >> $filepath

sed -i '5,6d' $filepath

