#!/usr/bin/env bash

set -eoux pipefail

fol='.tmppackscreenshots'

rm -rf "$fol"
mkdir -p "$fol"
cp --reflink=always -t "$fol" ./*_*_grim.png
#optimizepng.fish $fol/*
find "$fol" -type f -print0 | xargs -0P "$(nproc)" optimizepng.fish
tar cf "$fol/$(date -Idate).tar" ./*_*_grim_pngquant.png
