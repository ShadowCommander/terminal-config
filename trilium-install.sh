#!/bin/bash

# Have to use nodejs-lts because nodejs 19 is not supported by Trilium
pkg install --no-install-recommends -y libpng binutils nodejs-lts python build-essential

mkdir -P $HOME/github
git clone https://github.com/zadam/trilium.git $HOME/github/trilium
cd $HOME/github/trilium

# Add if check for if cpuInfos is undefined
#git apply --verbose 0001-Add-an-undefined-check-for-cpuInfos.patch
#git fetch origin pull/3957/head:termux
#git checkout termux 

# Remove cpu check due to no 'os' package on Termux
sed -i.bak '/cpuInfos/d' src/www

# Remove electron references so that the server runs on Termux
mv package-lock.json package-lock.json.bak
sed -i.bak '/electron/d' package.json

npm run webpack
npm install pngquant-bin@5.0.2 --ignore-scripts
npm install
npm rebuild

node src/www
