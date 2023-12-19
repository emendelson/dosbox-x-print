#!/bin/bash

## TODO: add this to PJL string
LOC=$( defaults read "Apple Global Domain" AppleLocale )
PAPER="A4"
if [ $LOC = "en_US" ] || [ $LOC = "en_CA" ] ; then
 PAPER="LETTER"
fi
# PJLPAPER="@PJL SET PAPER=$PAPER"

cd "$(dirname "$0")"

./gpcl6 -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=temp.pdf "$1"

lpr -r temp.pdf
rm "$1"
