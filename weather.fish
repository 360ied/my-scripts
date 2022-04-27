#!/usr/bin/env nix-shell
#!nix-shell -i fish -p wget

set location 'Toronto'

if test "$argv" != ''
	set location "$argv"
end

wget -O - "https://wttr.in/$location" 2> /dev/null
exit $status
