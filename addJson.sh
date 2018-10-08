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
dir="$1"
program="$2"
date="$3"

lastnum=$(cat -n /mnt/orangepekoe/Music/list.json | tail -n 1 | cut -f 1 | sed -e 's/ //g')
last2=$(echo $((${lastnum} - 2)))

sed -i "${lastnum},${last2}d" $filepath

cat << _EOL_ >> $filepath
        },
        {
            "id": "http://192.168.0.10/Music/${dir}/${dir}_${date}.m4a"
            "title": "${program} ${date}"
_EOL_

echo '        }' >> $filepath
echo '    ]' >> $filepath
echo '}' >> $filepath

sed -i '5,6d' $filepath

