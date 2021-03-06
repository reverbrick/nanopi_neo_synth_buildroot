#!/bin/sh
# post-build.sh for Nanopi NEO, based on the Orange Pi PC
# 2013, Carlo Caione <carlo.caione@gmail.com>
# 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>

BOARD_DIR="$( dirname "${0}" )"
MKIMAGE="${HOST_DIR}/usr/bin/mkimage"
BOOT_CMD="${BOARD_DIR}/boot.cmd"
BOOT_CMD_H="${BINARIES_DIR}/boot.scr"

#copy configuration files to image
mv $TARGET_DIR/etc/init.d/S40network	$TARGET_DIR/etc/init.d/network-disabled
cp $TARGET_DIR/usr/bin/wish8.6 		$TARGET_DIR/usr/bin/wish

# U-Boot script
"${MKIMAGE}" -C none -A arm -T script -d "${BOOT_CMD}" "${BOOT_CMD_H}"
