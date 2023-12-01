# Shell script to print zmanim for shabbos of the current week to line printer
# Uses hebcal and GNU date
# prshabboszman.sh is a UNIX shell script for printing zmnim
# It uses hebcal to determine zmanim and GNU date to get the date input into hebcal
# This came from a need to quickly print zmanim for Shabbos on Friday afternoon
# It will print some zmanim for the current day as well as all zmnim for the next day
# It prints today's and tomorrow's Hebrew dates
# and the current week's parsha
# The intended time for use is Erev Shabbos to print Shabbos zmanim
# It will run any day of the week, but will always use today's and tomorrow's dates
# It is therefore not useful for prining Shabbos Zmanim in advance
#!/bin/sh

DEFCITY=toronto									# sets default city for if now argument is passed
CITY="${1:-$DEFCITY}"								# defines city we are calculating zmanim for
tomorrow=$(date -d '+1 day' '+%m %d %Y')					# sets variable 'tomorrow' with the value of tomorrow's date in the fomrat mm dd yyyy
hebcal -tScC $CITY > ~/hebcal.tmp						# Prints today's hebrew date, current week's parsha, and candle lighting times to file ~/hebcal.tmp
hebcal -tZC $CITY | grep Plag >> ~/hebcal.tmp					# Prints today's plag hamincha time to same file
hebcal -tZC $CITY | grep Sunset >> ~/hebcal.tmp					# Prints today's sunset time to same file
hebcal -ZcC $CITY $tomorrow >> ~/hebcal.tmp					# Prints tomorrow's zmanim and havdala time to same file
cat ~/hebcal.tmp								# Prints file ~/hebcal.tmp to terminal
#lp ~/hebcal.tmp								# Prints file ~/hebcal.tmp to line printer
#rm ~/hebcal.tmp								# Removes file ~/hebcal.tmp
