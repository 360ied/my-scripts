#!/usr/bin/env fish

set by_n $argv[1]

if test "$by_n" = ""
	# by_n isn't specified
	echo "ERR: by_n ISN'T SPECIFIED" >&2
	exit 2
end

set max_brightness (brightnessctl m)
set cur_brightness (brightnessctl g)

set by_n_absolute (math "$max_brightness * $by_n / 100")

set new_brightness (math "$cur_brightness + $by_n_absolute")

brightnessctl s "$new_brightness"
