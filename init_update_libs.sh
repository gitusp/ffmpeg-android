#!/bin/bash

echo "============================================"
echo "Updating submodules"
git submodule update --init
echo "============================================"
echo "Updating libpng, expat and fribidi"
rm -rf libpng-*
rm -rf expat-*
rm -rf faac-*
rm -rf fribidi-*

wget -O- http://downloads.sourceforge.net/project/libpng/libpng16/older-releases/1.6.13/libpng-1.6.13.tar.xz | tar xJ
wget -O- http://downloads.sourceforge.net/project/expat/expat/2.1.0/expat-2.1.0.tar.gz | tar xz
wget -O- http://downloads.sourceforge.net/project/faac/faac-src/faac-1.28/faac-1.28.tar.gz | tar xz
wget -O- http://fribidi.org/download/fribidi-0.19.6.tar.bz2 | tar xj
echo "============================================"

echo "Putting new config"
cp assets/config.sub faac-1.28/config.sub
cp assets/config.guess faac-1.28/config.guess
echo "============================================"

