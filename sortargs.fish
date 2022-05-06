#!/usr/bin/env fish

function printchars --argument-names chars
    set chars (string split '' "$chars")

    for c in $chars
        echo "$c"
    end
end

echo -s (printchars "$argv" | sort | grep -Gv '\s')
