shopt -s nullglob
for i in *.pdf; do
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dAutoRotatePages=/None  -dColorImageDownsampleType=/Bicubic -dColorImageResolution="72" -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution="72" -dMonoImageDownsampleType=/Subsample -dMonoImageResolution="72"  -dNOPAUSE -dQUIET -dBATCH -sOutputFile=tmp-$i $i
	mv -f tmp-$i $i
    done
