#!/usr/bin/env fish

for file in $argv
	set -l outfile \
		 (echo -n "$file" | awk -F '.png' '{print $1}')'_pngquant.png'

	pngquant --speed 1 --strip --verbose   \
		 --skip-if-larger --output "$outfile" \
		 -- "$file"
	if test $status != 0
		# pngquant exited with error
		echo "ERR: PNGQUANT EXITED WITH NONZERO STATUS:" $status
		exit $status
	end
end
exit 0
