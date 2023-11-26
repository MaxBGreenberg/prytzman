# Shell script to print zmanim for shabbos of the current week to line printer
# Uses hebcal
#!/bin/sh
tomorrow=$(date -d '+1 day' '+%m %d %Y')
hebcal -tSc > ~/hebcal.tmp && hebcal -tZ | grep Plag >> ~/hebcal.tmp && hebcal -tZ | grep Sunset >> ~/hebcal.tmp && hebcal -Zc $tomorrow >> ~/hebcal.tmp && lp ~/hebcal.tmp && rm ~/hebcal.tmp
