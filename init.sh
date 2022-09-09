#!/usr/bin/env bash

for i in $(ls -d *.dev.*); do
    cp -v -- $i ${i%.dev.*}.${i##*.}
    rm $i
done

cp -v .dev.env .env

rm -rf .dev.env

rm -rf .git

rm -rf .gitignore
