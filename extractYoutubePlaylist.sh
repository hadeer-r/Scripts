#!/bin/bash

read -p "Enter playlist url: " url

titles="titlesOfPlayList.tmp"
urls="urlsOfPlayList.tmp"

yt-dlp --flat-playlist --print title "$url" > $titles 2> /dev/null
yt-dlp --flat-playlist --print url "$url" > $urls 2> /dev/null


read -p "Enter name of to save result in: " resultname


paste "$titles" "$urls" | while IFS=$'\t' read -r line1 line2; do
  echo "- [ ] [$line1]($line2) " >> $resultname
done

rm $titles
rm $urls
