#!/usr/bin/env fish

set by 1

if test "$argv" != ""
	set by $argv
end

math "$by + "(cat ratcount) > ratcount.tmp
printf '%s -> %s\n' (cat ratcount) (cat ratcount.tmp)
mv ratcount.tmp ratcount
