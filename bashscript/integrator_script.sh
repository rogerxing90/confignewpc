#!/bin/bash
export ARCH=arm
export CROSS_COMPILE=/opt/gcc-4.1.2-glibc-2.5-nptl-3/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-
export INIT_BOOTCHART=true

if [ $# -ge 2 ]; then
	PLATFORM_VERSION="-v ${2}"
fi

if [ $# -ge 3 ]; then
	CLEAN_BUILD="y"
fi

if [ $# -ge 1 ]; then
	SOC_SUFFIX=nlev_soc_r${1}
	NEC_SUFFIX=nlev_nec_r${1}
	ZIP_FILENAME=nlev_r${1}
	TOTAL_PROC=`grep -c processor /proc/cpuinfo`
	RELEASE_FOLDER="release/`date +%F`"
	echo "suffix = "$SOC_SUFFIX
	echo ""

	if [ $CLEAN_BUILD != "y" ]; then
		if [ -f kernel_imx/arch/arm/boot/uImage* ]; then
			read "kernel_imx image exist, delete it?" YESNO
			if [ $YESNO == "y" ]; then
				rm -rf kernel_imx/arch/arm/boot/uImage*
			fi
		fi
		if [ -d out ]; then
			read "android out folder exist, delete it? " YESNO
			if [ $YESNO == 'y' ]; then
				rm -rf out
			fi
		fi

	fi
	echo "removing files in /opt/tftpboot/ ~/Desktop/${ZIP_FILENAME}"
	rm -f -v /opt/tftpboot/*${SOC_SUFFIX} /opt/tftpboot/vuc*
	rm -rf ~/Desktop/${ZIP_FILENAME}.zip ~/Desktop/${ZIP_FILENAME}.md5
	rm -rf ~/${RELEASE_FOLDER}
	echo ""

	echo "****************************************************************************"
	echo "******************************  ANDROID  ***********************************"
	echo "****************************************************************************"

	## -- android -- ##
	pushd ./conti-tools/ >> /dev/null
	set -x
	BUILD_CMD="./build_android.sh install $SOC_SUFFIX no-nfs $PLATFORM_VERSION"
	echo "integrator_script.sh: "$BUILD_CMD
	$BUILD_CMD
	#./build_android.sh install $SOC_SUFFIX no-nfs $PLATFORM_VERSION
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
	rm ../arch/arm/boot/uImage*
	./build_kernel.sh nand vga install vga_${SOC_SUFFIX}
	rm ../arch/arm/boot/uImage*
	./build_kernel.sh nfs install ${SOC_SUFFIX}
	rm ../arch/arm/boot/uImage*
	./build_kernel.sh nfs vga install vga_${SOC_SUFFIX}
	rm ../arch/arm/boot/uImage*
	set +x
	popd

	echo "****************************************************************************"
	echo "******************************  ZIPPING  ***********************************"
	echo "****************************************************************************"

	## -- packing -- ##
	/bin/cp -f ./vuc* /opt/tftpboot/
	pushd /opt/tftpboot/
	rm -rf /opt/tftpboot/zImage*${SOC_SUFFIX}
	mkdir -p ~/${RELEASE_FOLDER}
	zip ~/${RELEASE_FOLDER}/${ZIP_FILENAME}.zip *${SOC_SUFFIX} vuc*
	popd

	## -- generating md5sum -- ##
	md5sum ~/${RELEASE_FOLDER}/${ZIP_FILENAME}.zip > ~/${RELEASE_FOLDER}/${ZIP_FILENAME}.md5
	ls -l ~/${RELEASE_FOLDER}/${ZIP_FILENAME}.zip ~/${RELEASE_FOLDER}/${ZIP_FILENAME}.md5

	chown uidc1325:uidc1325 /opt/tftpboot/android*${SOC_SUFFIX}
	#chown uidc1325:uidc1325 /opt/tftpboot/zImage*${SOC_SUFFIX}
	chown uidc1325:uidc1325 /opt/tftpboot/uImage*${SOC_SUFFIX}
	chown uidc1325:uidc1325 /opt/tftpboot/u-boot.bin*${SOC_SUFFIX}
	chown uidc1325:uidc1325 ~/${RELEASE_FOLDER}/${ZIP_FILENAME}.zip
else
	echo ""
	echo "Please provide one parameter for the suffix extension"
	echo "./integrator_script.sh X.Y.Z"
	echo ""
fi
