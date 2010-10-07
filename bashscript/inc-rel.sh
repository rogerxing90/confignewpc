#!/bin/bash

if [ $# -lt 1 ]; then
	echo "usage: ./inc-rel.sh <release-number/tag-name>"
	echo "usage: ./inc-rel.sh 0.5.0"
	exit 2
fi

echo "current_dir=" `pwd`
NEW_STRING="CONFIG_LOCALVERSION=\"-nlev_r$1\""

sed '
s/CONFIG_LOCALVERSION="-nlev_r.*"/'${NEW_STRING}'/
'< kernel_imx/arch/arm/configs/nissan_ev_defconfig > kernel_imx/arch/arm/configs/nissan_ev_defconfig.inc

rm -rf kernel_imx/arch/arm/configs/nissan_ev_defconfig
mv kernel_imx/arch/arm/configs/nissan_ev_defconfig.inc kernel_imx/arch/arm/configs/nissan_ev_defconfig

cd kernel_imx
git add arch/arm/configs/nissan_ev_defconfig
git commit -m "changes CONFIG_LOCALVERSION to nlev_r$1"
git log -n1 --stat -p
