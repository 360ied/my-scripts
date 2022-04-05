#!/usr/bin/env fish

set lastelem (lastelem.sh *_grim_crop.png) && pngquant --speed 1 --strip --verbose --skip-if-larger --output (echo -n "$lastelem" | awk -F ".png" '{print $1}')"_pngquant.png" -- "$lastelem"
