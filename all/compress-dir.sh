#!/bin/bash
shopt -s nullglob
##gif
mogrify -layers 'optimize' -fuzz 7% *.gif
##png
mogrify -quality 50 *.png
##jpeg
mogrify -quality 50 -format png *.jpg
##pdf
for p in *.pdf; do
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dAutoRotatePages=/None  -dColorImageDownsampleType=/Bicubic -dColorImageResolution="72" -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution="72" -dMonoImageDownsampleType=/Subsample -dMonoImageResolution="72"  -dNOPAUSE -dQUIET -dBATCH -sOutputFile=tmp-$p $p
	mv -f tmp-$p $p
done
##flac
for f in *.flac; do
	flac -s -4 --replay-gain "$f" -o "tmp-$f"
	mv -f "tmp-$f" "$f"
done
printf "done\n"
