BUILD_TOP_DIR=$(dirname $(readlink -f $0))
export PATH="$PATH:/home/cofface/android_source/cyanogenMod/cm-12.1/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin"
export KBUILD_BUILD_USER=cofface
export KBUILD_BUILD_HOST=cofface
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-android-

if [ -z $1 ]; then
echo "清除上次编译结果。。。"
make mrproper
    if [ -f "Image" ]; then
	rm Image
    fi
fi
