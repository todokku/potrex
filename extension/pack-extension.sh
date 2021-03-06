#!/usr/bin/env bash

rm -rf ./dist
mkdir ./dist
NODE_ENV=production node_modules/.bin/webpack -p

echo "Manually removing 'localhost:10000' from the manifest.json"
# This is savage.
grep -v localhost manifest.json | grep -v 127\.0 > ./dist/manifest.json

#V=`git tag -l | head -1`
#sed -es'/BUILD_VERSION/'$V'/' src/popup/popup.html  > dist/popup.html

cp src/popup/popup.html ./dist/
cp icons/* ./dist
cd ./dist
zip extension.zip *
