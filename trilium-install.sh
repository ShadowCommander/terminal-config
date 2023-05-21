#!/bin/bash

# Have to use nodejs-lts because nodejs 19 is not supported by Trilium
pkg install binutils nodejs-lts python build-essential --no-install-recommends -y

git clone https://github.com/zadam/trilium.git
cd trilium

# Add if check for if cpuInfos is undefined
git apply --verbose 0001-Add-an-undefined-check-for-cpuInfos.patch

mv package-lock.json package-lock.json.bak
sed -i.bak '/electron/d' package.json

npm run webpack
npm install pngquant-bin --ignore-scripts
npm install
npm rebuild

node src/www
