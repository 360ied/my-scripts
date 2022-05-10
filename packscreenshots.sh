#!/usr/bin/env bash

set -eoux pipefail

fol='.tmppackscreenshots'
packname="$(date -Idate)-screenshots.tar"

rm -rf "$fol"
mkdir -p "$fol"
printf "%s\0" ./*_*_grim.png | xargs -0 cp --reflink=always -t "$fol"
find "$fol" -type f -print0 | parallel -0 optimizepng.fish
cd "$fol"
printf "%s\0" ./*_*_grim_pngquant.png | tar cf "$packname" --strip-components=1 --null -T /dev/stdin
cd -
mv "$fol/$packname" "./$packname"
rm -rf "$fol"
