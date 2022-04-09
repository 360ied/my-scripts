#!/usr/bin/env fish

function optimize --argument-names outfile infile
	pngquant --speed 1 --strip --verbose \
		 --skip-if-larger --output "$outfile" \
		 -- "$file"
end

for infile in $argv
	set -l outfile \
		 (echo -n "$infile" | awk -F '.png' '{print $1}')'_pngquant.png'

	optimize "$outfile" "$infile"

	set pngquantstatus $status
	if test $pngquantstatus != 0
		# pngquant exited with error
		echo "ERR: PNGQUANT EXITED WITH NONZERO STATUS:" $pngquantstatus
		exit $pngquantstatus
	end
end
exit 0
