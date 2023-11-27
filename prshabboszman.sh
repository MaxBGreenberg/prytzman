# Shell script to print zmanim for shabbos of the current week to line printer
# Uses hebcal
#!/bin/sh
tomorrow=$(date -d '+1 day' '+%m %d %Y')			# sets variable 'tomorrow' with the value of tomorrow's date in the fomrat mm dd yyyy
hebcal -tSc > ~/hebcal.tmp					# Prints today's hebrew date, current week's parsha, and candle lighting times to file ~/hebcal.tmp
hebcal -tZ | grep Plag >> ~/hebcal.tmp				# Prints today's plag hamincha time to same file
hebcal -tZ | grep Sunset >> ~/hebcal.tmp			# Prints today's sunset time to same file
hebcal -Zc $tomorrow >> ~/hebcal.tmp				# Prints tomorrow's zmanim and havdala time to same file
cat ~/hebcal.tmp						# Prints file ~/hebcal.tmp to terminal
lp ~/hebcal.tmp							# Prints file ~/hebcal.tmp to line printer
rm ~/hebcal.tmp							# Removes file ~/hebcal.tmp
