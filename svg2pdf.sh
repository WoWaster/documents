#!/bin/bash
#
# Convert svg to pdf using Google Chrome and then crop to contents.

filename="$(basename $1 .svg)"
file_in_tmp="/tmp/${filename}-tmp.pdf"

google-chrome-stable --headless --disable-gpu --no-pdf-header-footer --print-to-pdf=${file_in_tmp} ${filename}.svg
pdfcrop ${file_in_tmp} ${filename}.pdf
rm ${file_in_tmp}
