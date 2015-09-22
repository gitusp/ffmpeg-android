[FFmpeg-Android](http://hiteshsondhi88.github.io/ffmpeg-android/) [![Android Arsenal](https://img.shields.io/badge/Android%20Arsenal-FFmpeg--Android-brightgreen.svg?style=flat)](https://android-arsenal.com/details/1/925)
==============

* FFmpeg for Android compiled with x264, libass, libfaac, fontconfig, freetype and fribidi
* Supports Android L
* [FFmpeg Android Library](https://github.com/hiteshsondhi88/ffmpeg-android-java)

Supported Architecture
----
* armv7
* armv7-neon
* x86

Instructions
----
* Set environment variable
  1. export ANDROID_NDK={Android NDK Base Path}
* Install the latest yasm.
```
wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar xzf yasm-1.3.0.tar.gz 
cd yasm-1.3.0/
./configure
sudo  make install
```
* Run following commands to compile ffmpeg
  1. sudo apt-get --quiet --yes install build-essential git autoconf libtool pkg-config gperf gettext
  2. ./init_update_libs.sh
  3. ./android_build.sh
* To update submodules and libraries you can use ./init_update_libs.sh command
* Find the executable binary in build directory.
* If you want to use FONTCONFIG then you need to specify your custom fontconfig config file (e.g - "FONTCONFIG_FILE=/sdcard/fonts.conf ./ffmpeg --version", where /sdcard/fonts.conf is location of your FONTCONFIG configuration file).

License
----
  check files LICENSE.GPLv3 and LICENSE
