#!/bin/bash
export ARCH=arm
export CROSS_COMPILE=/opt/gcc-4.1.2-glibc-2.5-nptl-3/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-

if [ $# -ge 1 ]; then
	SOC_SUFFIX=nlev_soc_r${1}
	NEC_SUFFIX=nlev_nec_r${1}
	ZIP_FILENAME=nlev_r${1}
	TOTAL_PROC=`grep -c processor /proc/cpuinfo`
	echo "suffix = "$SOC_SUFFIX
	echo ""

	echo "removing files in /opt/tftpboot/"
	rm -f -v /opt/tftpboot/*${SOC_SUFFIX} /opt/tftpboot/vuc*${NEC_SUFFIX}*
	echo ""

	echo "****************************************************************************"
	echo "******************************  ANDROID  ***********************************"
	echo "****************************************************************************"

	## -- android -- ##
	pushd ./conti-tools/ >> /dev/null
	set -x
	./build_android.sh install $SOC_SUFFIX no-nfs
	set +x
	popd

	echo "****************************************************************************"
	echo "******************************  U-BOOT  ************************************"
	echo "****************************************************************************"

	## -- u-boot -- ##
	echo "checking for bootable/bootloader/uboot-imx/"
	pushd bootable/bootloader/uboot-imx/
	make nissan_ev_config
	echo "command = make -j${TOTAL_PROC} all"
	make -j${TOTAL_PROC} all
	popd
	ls -l bootable/bootloader/uboot-imx/u-boot.bin
	cp -rf bootable/bootloader/uboot-imx/u-boot.bin /opt/tftpboot/u-boot.bin.${SOC_SUFFIX}
	echo ""
	echo "checking for /opt/tftpboot"
	ls -l /opt/tftpboot/u-boot.bin.*

	echo "****************************************************************************"
	echo "******************************  KERNEL  ************************************"
	echo "****************************************************************************"

	## -- kernel -- ##
	pushd ./kernel_imx/conti-tools/ >> /dev/null
	set -x
	./build_kernel.sh nand install $SOC_SUFFIX
	set +x
	popd

	echo "****************************************************************************"
	echo "******************************  ZIPPING  ***********************************"
	echo "****************************************************************************"

	## -- packing -- ##
	/bin/cp -f ./vuc*${NEC_SUFFIX}* /opt/tftpboot/
	pushd /opt/tftpboot/
	rm -rf ~/Desktop/${ZIP_FILENAME}.zip
	rm -rf /opt/tftpboot/zImage*${SOC_SUFFIX}
	zip ~/Desktop/${ZIP_FILENAME}.zip *${SOC_SUFFIX} vuc*${NEC_SUFFIX}*
	popd

	## -- generating md5sum -- ##
	md5sum ~/Desktop/${ZIP_FILENAME}.zip > ~/Desktop/${ZIP_FILENAME}.md5
	ls -l ~/Desktop/${ZIP_FILENAME}.zip ~/Desktop/${ZIP_FILENAME}.md5

	chown uidc1325:uidc1325 /opt/tftpboot/android*${SOC_SUFFIX}
	#chown uidc1325:uidc1325 /opt/tftpboot/zImage*${SOC_SUFFIX}
	chown uidc1325:uidc1325 /opt/tftpboot/uImage*${SOC_SUFFIX}
	chown uidc1325:uidc1325 /opt/tftpboot/u-boot.bin*${SOC_SUFFIX}
	chown uidc1325:uidc1325 ~/Desktop/${SOC_SUFFIX}.zip
else
	echo ""
	echo "Please provide one parameter for the suffix extension"
	echo "./integrator_script.sh X.Y.Z"
	echo ""
fi
