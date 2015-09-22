#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd ffmpeg

case $1 in
  armeabi-v7a | armeabi-v7a-neon)
    CPU='cortex-a8'
  ;;
  x86)
    CPU='i686'
  ;;
esac

make clean

./configure \
--target-os="$TARGET_OS" \
--cross-prefix="$CROSS_PREFIX" \
--arch="$NDK_ABI" \
--cpu="$CPU" \
--enable-runtime-cpudetect \
--sysroot="$NDK_SYSROOT" \
--enable-pic \
--enable-libx264 \
--enable-libass \
--enable-libfaac --enable-nonfree \
--enable-libfreetype \
--enable-libfribidi \
--enable-fontconfig \
--enable-pthreads \
--disable-debug \
--disable-ffserver \
--enable-version3 \
--enable-hardcoded-tables \
--enable-hwaccel=h264_d3d11va \
--enable-hwaccel=h264_dxva2 \
--enable-hwaccel=h264_mmal \
--enable-hwaccel=h264_qsv \
--enable-hwaccel=h264_vaapi \
--enable-hwaccel=h264_vda \
--enable-hwaccel=h264_vda_old \
--enable-hwaccel=h264_vdpau \
--enable-hwaccel=h264_videotoolbox \
--disable-ffplay \
--disable-ffprobe \
--enable-gpl \
--disable-doc \
--enable-static \
--pkg-config="${2}/ffmpeg-pkg-config" \
--prefix="${2}/build/${1}" \
--extra-cflags="-I${TOOLCHAIN_PREFIX}/include $CFLAGS" \
--extra-ldflags="-L${TOOLCHAIN_PREFIX}/lib $LDFLAGS" \
--extra-libs="-lpng -lexpat -lm" \
--extra-cxxflags="$CXX_FLAGS" || exit 1

make -j${NUMBER_OF_CORES} && make install || exit 1

popd
