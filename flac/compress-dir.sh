shopt -s nullglob
for i in *.flac; do
	flac -4 --replay-gain "$i" -o "tmp-$i"
	mv -f "tmp-$i" "$i"
    done
