Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA11542
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Jan 2000 13:53:26 -0700
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by palrel1.hp.com (Postfix) with ESMTP id A80BF72
	for <parisc-linux@thepuffingroup.com>; Tue, 11 Jan 2000 12:55:33 -0800 (PST)
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linux 2.3 
In-reply-to: Your message of "Tue, 11 Jan 2000 12:46:18 PST."
             <20000111124618.E6152@linuxcare.com>
Date: Tue, 11 Jan 2000 13:55:33 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E1288KD-00081L-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


There've been rumors of a shell prompt with 2.3 but I haven't seen it.

Apparently there are still some secrets not widely shared about how
to make this stuff work which I don't know yet, but attached is a
.config file which at least caused me to see some output (and no
shell prompt).  Run this
with a linux command line including "console=tty".  After some
somewhat sane output minicom gets pretty confused :-)  It works
better on a graphics console than on serial.

	-Paul Bame

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
CONFIG_PA7100=y
CONFIG_PA7300=y
CONFIG_PA_1x=y
CONFIG_PA_11=y
# CONFIG_SMP is not set
CONFIG_GSC=y
# CONFIG_GSC_DINO is not set
CONFIG_GSC_LASI=y
CONFIG_HIL=y

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
CONFIG_PARIDE_PARPORT=m
# CONFIG_BLK_DEV_IDE_MODES is not set
# CONFIG_BLK_DEV_HD is not set

#
# Networking options
#
# CONFIG_PACKET is not set
# CONFIG_NETLINK is not set
# CONFIG_NETFILTER is not set
# CONFIG_FILTER is not set
# CONFIG_UNIX is not set
# CONFIG_INET is not set
# CONFIG_ATM is not set

#
#  
#
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_DECNET is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_BRIDGE is not set
# CONFIG_LLC is not set
# CONFIG_ECONET_AUNUDP is not set
# CONFIG_ECONET_NATIVE is not set
# CONFIG_WAN_ROUTER is not set
# CONFIG_NET_FASTROUTE is not set
# CONFIG_NET_HW_FLOWCONTROL is not set

#
# QoS and/or fair queueing
#
# CONFIG_NET_SCHED is not set

#
# SCSI support
#
# CONFIG_SCSI is not set

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
CONFIG_GSC_PS2=y
CONFIG_SERIAL=y
# CONFIG_SERIAL_CONSOLE is not set
CONFIG_SERIAL_EXTENDED=y
# CONFIG_SERIAL_MANY_PORTS is not set
# CONFIG_SERIAL_SHARE_IRQ is not set
# CONFIG_SERIAL_DETECT_IRQ is not set
# CONFIG_SERIAL_MULTIPORT is not set
# CONFIG_HUB6 is not set
# CONFIG_SERIAL_GSC is not set
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_UNIX98_PTYS=y
CONFIG_UNIX98_PTY_COUNT=256
# CONFIG_PRINTER is not set
# CONFIG_PPDEV is not set

#
# Mice
#
# CONFIG_BUSMOUSE is not set
# CONFIG_MOUSE is not set
# CONFIG_QIC02_TAPE is not set

#
# Watchdog Cards
#
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
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_FTAPE is not set
# CONFIG_DRM is not set

#
# PCMCIA character device support
#
# CONFIG_PCMCIA_SERIAL_CS is not set

#
# Filesystems
#
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_FAT_FS is not set
# CONFIG_MSDOS_FS is not set
# CONFIG_UMSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_ISO9660_FS=y
# CONFIG_JOLIET is not set
# CONFIG_UDF_FS is not set
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

#
# Network File Systems
#

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
# CONFIG_BSD_DISKLABEL is not set
# CONFIG_SOLARIS_X86_PARTITION is not set
# CONFIG_UNIXWARE_DISKLABEL is not set
# CONFIG_SGI_PARTITION is not set
# CONFIG_SUN_PARTITION is not set
# CONFIG_NLS is not set
# CONFIG_SOUND is not set

#
# Console drivers
#

#
# Frame-buffer support
#
# CONFIG_FB is not set
CONFIG_PDC_CONSOLE=y
CONFIG_IODC_CONSOLE=y

#
# Kernel hacking
#
CONFIG_MAGIC_SYSRQ=y
