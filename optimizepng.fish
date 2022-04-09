#!/usr/bin/env fish

function optimize --argument-names outfile infile
	pngquant --speed 1 --strip --verbose \
		 --skip-if-larger --output "$outfile" \
		 -- "$infile"
end

set infiles $argv

# support optimizing the current opened file in imv
if set -q imv_current_file
	set infiles $infiles $imv_current_file
end

for infile in $infiles
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
