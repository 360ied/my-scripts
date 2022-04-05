#!/usr/bin/env fish

set location 'Toronto'

if test "$argv" != ''
	set location "$argv"
end

wget -O - "https://wttr.in/$location" 2> /dev/null
