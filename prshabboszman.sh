# Shell script to print zmanim for shabbos of the current week to line printer
# (C) Copyright Max Greenberg 2023
# Licenced under GPLv2
# Uses hebcal and GNU date
# prshabboszman.sh is a UNIX shell script for printing zmnim
# It uses hebcal to determine zmanim and GNU date to get the date input into hebcal
# This came from a need to quickly print zmanim for Shabbos on Friday afternoon
# It will print some zmanim for the current day as well as all zmnim for the next day
# It prints today's and tomorrow's Hebrew dates
# and the current week's parsha
# It will run any day of the week
#!/bin/sh

DEFCITY='toronto'						# Sets default city for if now argument is passed
CITY="${@:-$DEFCITY}"						# Defines city we are calculating zmanim from standard input
echo "Shabbos zmanim for "$CITY > ~/hebcal.tmp			# Prints city you're printing zmanim for
FRI=$(date -dFriday '+%m %d %Y')				# Sets variable FRI to the date of Friday this week in format taken by hebcal
SAT=$(date -dSaturday '+%m %d %Y')				# Sets variable SAT to the date of Saturday this week in format taken by hebcal
hebcal -ScC "${CITY}" $FRI >> ~/hebcal.tmp			# Prints today's hebrew date, current week's parsha, and candle lighting times to file ~/hebcal.tmp
hebcal -ZC "${CITY}" $FRI | grep Plag >> ~/hebcal.tmp		# Prints today's plag hamincha time to same file
hebcal -ZC "${CITY}" $FRI | grep Sunset >> ~/hebcal.tmp		# Prints today's sunset time to same file
hebcal -ZcC "${CITY}" $SAT >> ~/hebcal.tmp			# Prints tomorrow's zmanim and havdala time to same file
cat ~/hebcal.tmp						# Prints file ~/hebcal.tmp to terminal
lp ~/hebcal.tmp							# Prints file ~/hebcal.tmp to line printer
rm ~/hebcal.tmp							# Removes file ~/hebcal.tmp
