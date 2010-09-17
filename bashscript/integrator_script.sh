#!/bin/bash
export ARCH=arm
export CROSS_COMPILE=/opt/gcc-4.1.2-glibc-2.5-nptl-3/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-

if [ $# -ge 1 ]; then
	SUFFIX=nlev_soc_r${1}
	echo "suffix = "$SUFFIX
	echo ""

	echo "****************************************************************************"
	echo "******************************  ANDROID  ***********************************"
	echo "****************************************************************************"

	## -- android -- ##
	pushd ./conti-tools/ >> /dev/null
	set -x
	./build_android.sh install $SUFFIX
	set +x
	popd

	echo "****************************************************************************"
	echo "******************************  U-BOOT  ************************************"
	echo "****************************************************************************"

	## -- u-boot -- ##
	echo "checking for bootable/bootloader/uboot-imx/"
	pushd bootable/bootloader/uboot-imx/
	make nissan_ev_config
	make all
	popd
	ls -l bootable/bootloader/uboot-imx/u-boot.bin
	cp -rf bootable/bootloader/uboot-imx/u-boot.bin /opt/tftpboot/u-boot.bin.${SUFFIX}
	echo ""
	echo "checking for /opt/tftpboot"
	ls -l /opt/tftpboot/u-boot.bin.*

	echo "****************************************************************************"
	echo "******************************  KERNEL  ************************************"
	echo "****************************************************************************"

	## -- kernel -- ##
	pushd ./kernel_imx/conti-tools/ >> /dev/null
	set -x
	./build_kernel.sh nand install $SUFFIX
	set +x
	popd

	echo "****************************************************************************"
	echo "******************************  ZIPPING  ***********************************"
	echo "****************************************************************************"

	## -- packing -- ##
	pushd /opt/tftpboot/
	rm -rf ~/Desktop/${SUFFIX}.zip
	zip ~/Desktop/${SUFFIX}.zip *${SUFFIX}
	popd

	## -- generating md5sum -- ##
	md5sum ~/Desktop/${SUFFIX}.zip > ~/Desktop/${SUFFIX}.md5
	ls -l ~/Desktop/${SUFFIX}.zip ~/Desktop/${SUFFIX}.md5

	chown uidc1325:ccm_root /opt/tftpboot/android*${SUFFIX}
	chown uidc1325:ccm_root /opt/tftpboot/zImage*${SUFFIX}
	chown uidc1325:ccm_root /opt/tftpboot/uImage*${SUFFIX}
	chown uidc1325:ccm_root /opt/tftpboot/u-boot.bin*${SUFFIX}
	chown uidc1325:ccm_root ~/Desktop/${SUFFIX}.zip
else
	echo ""
	echo "Please provide one parameter for the suffix extension"
	echo "./integrator_script.sh X.Y.Z"
	echo ""
fi
