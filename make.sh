LD_TOP_DIR=$(dirname $(readlink -f $0))
export PATH="$PATH:/home/cofface/android_source/cyanogenMod/cm-12.1/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin"
export KBUILD_BUILD_USER=cofface
export KBUILD_BUILD_HOST=cofface
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-android-
#KERNEL_DEFCONFIG=cofface_prada_defconfig
KERNEL_DEFCONFIG=msm8937-perf_defconfig

START=$(date +%s)
make $KERNEL_DEFCONFIG
make -j16 || exit -1

END=$(date +%s)
ELAPSED=$((END - START))
E_MIN=$((ELAPSED / 60))
E_SEC=$((ELAPSED - E_MIN * 60))
printf "编译完成，消耗时间："
[ $E_MIN != 0 ] && printf "%d 分 " $E_MIN
printf "%d 秒\n" $E_SEC

echo "拷贝zImage到当前目录下。。。"
cp -f arch/arm64/boot/Image ./
