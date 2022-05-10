#!/usr/bin/env bash

set -eoux pipefail

fol='.tmppackscreenshots'
packname="$(date -Idate)-screenshots.tar"

rm -rf "$fol"
mkdir -p "$fol"
find "." -type f -print0 | xargs -0 cp --reflink=always -t "$fol"
find "$fol" -type f -print0 | parallel -0 optimizepng.fish
printf "%s\0" $fol/*_*_grim_pngquant.png | tar cf "$fol/$packname" --strip-components=1 --null -T /dev/stdin
mv "$fol/$packname" "./$packname"
rm -rf "$fol"
