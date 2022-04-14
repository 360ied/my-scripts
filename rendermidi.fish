#!/usr/bin/env fish

fluidsynth -q -r 48000 -O float -T au -F /dev/stdout /dev/stdin \
    | ffmpeg -f au -i pipe:0 -c:a libopus -b:a 64K -f ogg pipe:1
