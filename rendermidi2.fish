#!/usr/bin/env fish

argparse --name 'rendermidi.fish' \
         'f/soundfont=' \
         -- $argv

set -l soundfont $_flag_soundfont

for filename in $argv
    fluidsynth -q -r 48000 -O float -T au -F /dev/stdout "$soundfont" "$filename" \
      | ffmpeg -f au -i pipe:0 -c:a libopus -b:a 64K -f ogg "$filename.ogg"
end
