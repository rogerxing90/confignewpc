#!/bin/bash
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
	echo "******************************  KERNEL  ************************************"
	echo "****************************************************************************"

	## -- kernel -- ##
	pushd ./kernel_imx/conti-tools/ >> /dev/null
	set -x
	./build_kernel.sh nand install $SUFFIX
	set +x
	popd

	echo "****************************************************************************"
	echo "******************************  U-BOOT  ************************************"
	echo "****************************************************************************"

	## -- u-boot -- ##
	echo "checking for bootable/bootloader/uboot-imx/"
	ls -l bootable/bootloader/uboot-imx/u-boot.bin
	cp -rf bootable/bootloader/uboot-imx/u-boot.bin /opt/tftpboot/u-boot.bin.${SUFFIX}
	echo ""
	echo "checking for /opt/tftpboot"
	ls -l /opt/tftpboot/u-boot.bin.*

	echo "****************************************************************************"
	echo "******************************  ZIPPING  ***********************************"
	echo "****************************************************************************"

	## -- packing -- ##
	pushd /opt/tftpboot/
	rm -rf ~/Desktop/${SUFFIX}.zip
	zip ~/Desktop/${SUFFIX}.zip *${SUFFIX}
	popd
	ls -l ~/Desktop/${SUFFIX}.zip

else
	echo ""
	echo "Please provide one parameter for the suffix extension"
	echo "./integrator_script.sh X.Y.Z"
	echo ""
fi
