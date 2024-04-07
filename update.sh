#! /bin/bash
FILE=./doom.zip
if test -f "$FILE"; then
    rm doom.zip
fi
cd datapack
zip -r 'doom.zip' .
mv 'doom.zip' ..
cd .. 
# cp 'doom.zip' 'PATH TO MINECRAFT WORLD/datapacks'