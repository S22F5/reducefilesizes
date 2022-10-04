shopt -s nullglob
#start conversions
##gif
mogrify -layers 'optimize' -fuzz 7% *.gif
##png
mogrify -quality 50 *.png
##jpeg
mogrify -quality 50 -format png *.jpg
##pdf
for i in *.pdf; do
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dAutoRotatePages=/None  -dColorImageDownsampleType=/Bicubic -dColorImageResolution="72" -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution="72" -dMonoImageDownsampleType=/Subsample -dMonoImageResolution="72"  -dNOPAUSE -dQUIET -dBATCH -sOutputFile=tmp-$i $i
	mv -f tmp-$i $i
done
##flac
for i in *.flac; do
	flac -s -4 --replay-gain "$i" -o "tmp-$i"
	mv -f "tmp-$i" "$i"
done
##done
echo done
