Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA29408
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Nov 1999 22:29:38 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by palrel1.hp.com (Postfix) with ESMTP id EDF865F7
	for <parisc-linux@thepuffingroup.com>; Thu, 18 Nov 1999 21:31:11 -0800 (PST)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id VAA01055 for parisc-linux@thepuffingroup.com; Thu, 18 Nov 1999 21:32:58 -0800 (PST)
Date: Thu, 18 Nov 1999 21:32:58 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <199911190532.VAA01055@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] `PROC_SCSI_LASI7XX' undeclared here
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
I tried to rebuild after doing "cvs -z9 update -d" (ggg nods to _A_)
and got the following output:
(and yes I ran make oldconfig/dep/Image sequence)

...
gcc -D__KERNEL__ -I/linux/linux/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -mdisable-fpregs -fwritable-strings  -fno-strict-aliasing -pipe -fno-strength-reduce   -c -o lasi7xx.o lasi7xx.c
lasi7xx.c:38: `PROC_SCSI_LASI7XX' undeclared here (not in a function)
lasi7xx.c:38: initializer element for `proc_scsi_lasi7xx.low_ino' is not constant
lasi7xx.c:48: warning: type defaults to `int' in declaration of `ncr53c7xx_init'
make[3]: *** [lasi7xx.o] Error 1
...

If I recall correctly, a shared enum table had "PROC_SCSI_LASI7XX"
added to it.  I think it was a /proc header file.

Normally I'd fix this myself (and probably will) but don't have time.
If some else does, that would be great. Otherwise, I'll get to it on
the weekend.

I've appended my "linux/.config" file.

grant

#
# Automatically generated make config: don't edit
#

#
# Code maturity level options
#
CONFIG_EXPERIMENTAL=y

#
# CPU type
#
# CONFIG_PA7100 is not set
CONFIG_PA7300=y
CONFIG_PA_1x=y
CONFIG_PA_11=y
# CONFIG_SMP is not set
CONFIG_GSC=y
CONFIG_GSC_DINO=y
CONFIG_GSC_LASI=y
# CONFIG_HIL is not set
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
CONFIG_BINFMT_SOM=y
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
# CONFIG_CHR_DEV_ST is not set
# CONFIG_BLK_DEV_SR is not set
# CONFIG_CHR_DEV_SG is not set

#
# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
#
# CONFIG_SCSI_MULTI_LUN is not set
# CONFIG_SCSI_CONSTANTS is not set

#
# SCSI low-level drivers
#
CONFIG_LASI_SCSI=y

#
# Network device support
#
CONFIG_NETDEVICES=y
CONFIG_APRICOT=y
CONFIG_DEC_ELCP=y

#
# Character devices
#
CONFIG_VT=y
CONFIG_VT_CONSOLE=y
# CONFIG_GSC_PS2 is not set
CONFIG_SERIAL=y
CONFIG_SERIAL_CONSOLE=y
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
# CONFIG_ISO9660_FS is not set
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
# Console drivers
#
# CONFIG_IODC_CONSOLE is not set

#
# Kernel hacking
#
CONFIG_MAGIC_SYSRQ=y
