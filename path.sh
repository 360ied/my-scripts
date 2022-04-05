#!/usr/bin/env sh

for folder in $(printf "%s" "$PATH" | tr ":" " "); do
	ls "$folder"
done
