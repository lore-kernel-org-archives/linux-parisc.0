Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA12143
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Oct 1999 19:55:52 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id VAA09745
	for <parisc-linux@thepuffingroup.com>; Sat, 16 Oct 1999 21:55:54 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id SAA25411 for <parisc-linux@thepuffingroup.com>; Sat, 16 Oct 1999 18:56:34 -0700 (PDT)
Message-Id: <199910170156.SAA25411@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
In-reply-to: Your message of "Sat, 16 Oct 1999 18:17:59 PDT."
             <199910170118.SAA25384@milano.cup.hp.com>
Date: Sat, 16 Oct 1999 18:56:33 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] ld: Unsatisfied symbols: csum_partial (code)
List-ID: <linux-parisc.vger.kernel.org>


I have a "vanilla" CVS tree and am getting the following
linker error:
ld -R 0xc0010000 -N -e stext arch/parisc/kernel/head.o arch/parisc/kernel/init_task.o init/main.o init/version.o \
        arch/parisc/boot/ramdisk.o arch/parisc/kernel/kernel.o arch/parisc/mm/mm.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
        fs/filesystems.a \
        net/network.a \
        drivers/block/block.a drivers/char/char.a drivers/gecko/gecko.a  drivers/net/net.a drivers/scsi/scsi.a drivers/pci/pci.a \
        /linux/linux/arch/parisc/lib/lib.a /linux/linux/lib/lib.a /linux/linux/arch/parisc/lib/lib.a \
        -o vmlinux
ld: Unsatisfied symbols:
   csum_partial (code)
   serial_console_init (code)
make[1]: *** [vmlinux-real] Error 1

Any clue what's broken?
Someone submit code recently which touched these functions?

thanks,
grant

linux/.config contents are:
grundler <2776>cat .config
#
# Automatically generated make config: don't edit
#

#
# Code maturity level options
#
CONFIG_EXPERIMENTAL=y

#
# Machine type
#
# CONFIG_HP_715 is not set
# CONFIG_HP_712 is not set
CONFIG_HP_ACLASS=y
# CONFIG_HP_DCLASS is not set

#
# CPU type
#
# CONFIG_PA7100 is not set
CONFIG_PA7300=y
# CONFIG_SMP is not set
# CONFIG_IODC_CONSOLE is not set
CONFIG_GECKO_DINO=y
CONFIG_GECKO_LASI=y
CONFIG_GECKO=y
CONFIG_GECKO_DINO=y
CONFIG_PCI=y

#
# Loadable module support
#
# CONFIG_MODULES is not set

#
# General setup
#
CONFIG_NET=y
CONFIG_SYSVIPC=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_SYSCTL=y
# CONFIG_BINFMT_SOM is not set
# CONFIG_BINFMT_ELF is not set
# CONFIG_BINFMT_MISC is not set
# CONFIG_BINFMT_JAVA is not set

#
# Block devices
#
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_DEV_IDE is not set

#
# Please see Documentation/ide.txt for help/info on IDE drives
#
# CONFIG_BLK_DEV_HD_ONLY is not set

#
# Additional Block Devices
#
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_MD is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_INITRD=y
# CONFIG_BLK_DEV_XD is not set
# CONFIG_BLK_DEV_DAC960 is not set
CONFIG_PARIDE_PARPORT=m
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_DEV_HD is not set

#
# Networking options
#
# CONFIG_PACKET is not set
# CONFIG_NETLINK is not set
# CONFIG_FIREWALL is not set
# CONFIG_FILTER is not set
# CONFIG_UNIX is not set
# CONFIG_INET is not set

#
#  
#
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_BRIDGE is not set
# CONFIG_LLC is not set
# CONFIG_ECONET is not set
# CONFIG_WAN_ROUTER is not set
# CONFIG_NET_FASTROUTE is not set
# CONFIG_NET_HW_FLOWCONTROL is not set
# CONFIG_CPU_IS_SLOW is not set

#
# QoS and/or fair queueing
#
# CONFIG_NET_SCHED is not set

#
# SCSI support
#
CONFIG_SCSI=y

#
# SCSI support type (disk, tape, CDrom)
#
CONFIG_BLK_DEV_SD=y
CONFIG_CHR_DEV_ST=y
# CONFIG_BLK_DEV_SR is not set
# CONFIG_CHR_DEV_SG is not set

#
# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
#
# CONFIG_SCSI_MULTI_LUN is not set
CONFIG_SCSI_CONSTANTS=y

#
# SCSI low-level drivers
#
CONFIG_LASI_SCSI=y

#
# Network device support
#
CONFIG_NETDEVICES=y
# CONFIG_APRICOT is not set
CONFIG_DEC_ELCP=y

#
# Character devices
#
# CONFIG_VT is not set
# CONFIG_SERIAL is not set
# CONFIG_SERIAL_EXTENDED is not set
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_UNIX98_PTYS=y
CONFIG_UNIX98_PTY_COUNT=256
# CONFIG_PRINTER is not set
# CONFIG_MOUSE is not set
# CONFIG_QIC02_TAPE is not set
# CONFIG_WATCHDOG is not set
# CONFIG_NVRAM is not set
# CONFIG_RTC is not set

#
# Video For Linux
#
# CONFIG_VIDEO_DEV is not set

#
# Joystick support
#
# CONFIG_JOYSTICK is not set
# CONFIG_DTLK is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_FTAPE is not set

#
# Filesystems
#
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_FAT_FS is not set
# CONFIG_MSDOS_FS is not set
# CONFIG_UMSDOS_FS is not set
# CONFIG_VFAT_FS is not set
CONFIG_ISO9660_FS=y
# CONFIG_JOLIET is not set
# CONFIG_MINIX_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_HPFS_FS is not set
CONFIG_PROC_FS=y
# CONFIG_DEVPTS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_EXT2_FS=y
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EFS_FS is not set

#
# Network File Systems
#

#
# Partition Types
#
# CONFIG_BSD_DISKLABEL is not set
# CONFIG_MAC_PARTITION is not set
# CONFIG_SMD_DISKLABEL is not set
# CONFIG_SOLARIS_X86_PARTITION is not set
# CONFIG_UNIXWARE_DISKLABEL is not set
# CONFIG_NLS is not set

#
# Kernel hacking
#
CONFIG_MAGIC_SYSRQ=y


Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
