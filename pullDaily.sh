#!/bin/bash

export PATH=/usr/local/bin:$PATH


WD="/Users/thomaslauer/Documents/GitHub/DailyCalvinAndHobbes"
cd $WD

date >> log.txt

if [[ ! -e "wallpapers" ]]; then
    mkdir wallpapers
fi

rm -f wallpapers/*.png
rm -f tmp.xml
rm -f today.gif


python gocomics-scrape.py calvinandhobbes > tmp.xml
wget $(python parseXml.py) -O today.gif

if [[ $(date +%w) -eq 0 ]]; then
    ffmpeg -i today.gif -vf scale=2.5*iw:2.5*ih wallpapers/$(date +%s).png
else
    ffmpeg -i today.gif -vf scale=3*iw:3*ih wallpapers/$(date +%s).png
fi

