Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA08002
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 May 2000 16:27:40 -0600
Received: from ppp177.a1-2.56k.execulink.com (ppp177.a1-2.56k.execulink.com [209.239.9.243])
	by amsterdam.execulink.net (8.9.3/8.9.3) with ESMTP id SAA16685
	for <parisc-linux@thepuffingroup.com>; Wed, 17 May 2000 18:27:37 -0400 (EDT)
Date: Wed, 17 May 2000 18:27:21 -0400 (EDT)
From: Chris Snow <csnow@julian.uwo.ca>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0005171823320.1861-100000@boy.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 715/50 hang - more info
List-ID: <linux-parisc.vger.kernel.org>


I managed to find some widgets and hook the serial output of the HP to my
PC, so I'm sending along the entire boot output, as well as my .config.


output:
------
              (c) Copyright Hewlett-Packard Company, 1991, 1992
Portions of this code are (c) Copyright Samsung Electronics Co., Ltd, 91,
92 

PDC ROM rev. 1.3
IODC ROM rev. 1.1
32 MB of memory have been configured.


Selecting a system to boot.
To stop selection process, press and hold the ESCAPE key.

Booting from:     lan.00a024-95c59e.3.6     boy

Hard booted.
palo ipl chris@boy Wed May 17 18:19:21 EDT 2000
0/vmlinux 1991268 bytes @ 0x7800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs
nfsroot=192.168.1.2'
Kernel: partition 0 file /vmlinux
ELF32 executable
prepare_loadable 0050368c 2

Entry 0010182c first 00100000 n 3
Segment 0 load 00100000 size 1123464 mediaptr 0x1000
Segment 1 load 00214000 size 158452 mediaptr 0x114000
Segment 2 load 0023c000 size 8192 mediaptr 0x13b000
branching to kernel entry point 0x0010182c
The Kernel has started...
Free memory starts at: 0xc02a8000
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.168.1.2'
PALO initrd 0-0
FP CCR was 0x0, will be set to 0xc0
model   00003100 00000481 00000000 00000000 7816bc26 ffffffff 00000004
0000000a 0000000a
vers    0000000b
CPUID vers 0 rev 0
CPU(s): 1 x PA7100 at 50.000000 MHz
Searching for devices in PDC firmware...  an older box...
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0, 0x77,
0x0, 0x0
2. Scorpio Core BA (11) at 0xf082f000, versions 0x7, 0x0, 0x70, 0x0, 0x0
3. Scorpio Core SCSI (10) at 0xf0825000, versions 0x7, 0x0, 0x71, 0x0, 0x0
4. Scorpio Core LAN (802.3) (10) at 0xf0826000, versions 0x7, 0x0, 0x72,
0x0, 0x0
5. Scorpio Core HIL (10) at 0xf0821000, versions 0x7, 0x0, 0x73, 0x0, 0x0
6. Scorpio Core RS-232 (10) at 0xf0823000, versions 0x7, 0x0, 0x75, 0x0,
0x0
7. Scorpio Core RS-232 (10) at 0xf0822000, versions 0x7, 0x0, 0x75, 0x0,
0x0
8. Scorpio Core Centronics (10) at 0xf0824000, versions 0x7, 0x0, 0x74,
0x0, 0x09. Scorpio Audio (10) at 0xf1000000, versions 0x7, 0x0, 0x7b, 0x0,
0x0
10. Scorpio EISA BA (11) at 0xfc000000, versions 0x7, 0x0, 0x76, 0x0, 0x0
11. Scorpio (715/50) (0) at 0xfffbe000, versions 0x310, 0x0, 0x4, 0x0,
0x81
12. Scorpio (1) at 0xfffbf000, versions 0x17, 0x0, 0x9, 0x0, 0x0
That's a total of 12 devices.
Linux version 2.3.99-pre1 (chris@boy) (gcc version 2.9-hppa-991112) #8 Wed
May 17 18:18:58 EDT 2000
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 8192
zone(0): 4096 pages.
zone(1): 4096 pages.
zone(2): 0 pages.
trap_init
Calibrating delay loop... 42.19 BogoMIPS
Memory: 29436k available
kmem_test() - start
kmem_free: Bad front redzone (objp=c1ffe004, name=test-cachep)
kmem_free: Bad rear redzone (objp=c1ffe004, name=test-cachep)
kmem_test() - finished
c1ff0000 c1ff8000 c1fee000 c1ffc000
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 8192 (order: 3, 32768 bytes)
POSIX conformance testing by UNIFIX
ASP version 1 at 0xf0800000 found.
request_irq(259, c01bfd00, 0x0, asp, c1fe9080)
ASP IRQ 259 EIM 0xfffe0003
busdevice_alloc_irq(0xf0823000) on ASP 0x200 + 26 = 538
Found serial #0 at 0xf0823000, IRQ 538
ttyS00 at iomem 0xf0823800 (irq = 538) is a 16550A
busdevice_alloc_irq(0xf0822000) on ASP 0x200 + 25 = 537
Found serial #1 at 0xf0822000, IRQ 537
ttyS00 at iomem 0xf0822800 (irq = 537) is a 16550A
busdevice_alloc_irq(0xf0826000) on ASP 0x200 + 23 = 535
Found i82596 at 0xf0826000, IRQ 535
early initialization of device eth0 is deferred
Linux NET4.0 for Linux 2.3
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 2048)
Starting kswapd v1.6
Serial driver version 4.92 (2000-1-27) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
82596.c: MAC of HP700 LAN blindely read from the prom!
eth0: 82596 at 0xf0826000, 08 00 09 62 82 1E IRQ 535.
lasi_82596.c:v1.2 02/13/2000
eth0: lp at 0xc1fd4000 (1720 bytes), lp->scb at 0xc1fd4014
request_irq(535, c01baea8, 0x0, i82596, c1fecc00)
busdev_enable_irq(c1fe9080, 23) ASP: IMR 0x100
busdev_disable_irq(c1fe9080, 23) ASP: IMR 0x0

----- end of output

and here is my .config (it is the default, I haven't changed anything...)

.config
-------
#
# Automatically generated make config: don't edit
#
CONFIG_PARISC=y
# CONFIG_UID16 is not set

#
# Code maturity level options
#
CONFIG_EXPERIMENTAL=y

#
# General options
#
# CONFIG_SMP is not set
CONFIG_GSC=y
CONFIG_GSC_LASI=y
CONFIG_PCI=y
CONFIG_GSC_DINO=y
# CONFIG_PCI_LBA is not set

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
# CONFIG_SYSCTL is not set
CONFIG_BINFMT_SOM=y
# CONFIG_BINFMT_ELF is not set
# CONFIG_BINFMT_MISC is not set
# CONFIG_BINFMT_JAVA is not set

#
# Block devices
#
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_DEV_XD is not set
# CONFIG_PARIDE is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set

#
# Additional Block Devices
#
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_MD is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_INITRD=y

#
# Networking options
#
# CONFIG_PACKET is not set
# CONFIG_NETLINK is not set
# CONFIG_NETFILTER is not set
# CONFIG_FILTER is not set
# CONFIG_UNIX is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_BOOTP=y
# CONFIG_IP_PNP_RARP is not set
# CONFIG_IP_ROUTER is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_IP_ALIAS is not set
# CONFIG_SYN_COOKIES is not set

#
# (it is safe to leave these untouched)
#
# CONFIG_SKB_LARGE is not set
# CONFIG_IPV6 is not set
# CONFIG_KHTTPD is not set
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
# CONFIG_ECONET is not set
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
CONFIG_LASI_82596=y

#
# ARCnet devices
#
# CONFIG_ARCNET is not set
# CONFIG_DUMMY is not set
# CONFIG_BONDING is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_SB1000 is not set

#
# Ethernet (10 or 100Mbit)
#
CONFIG_NET_ETHERNET=y
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_LANCE is not set
# CONFIG_NET_VENDOR_SMC is not set
# CONFIG_NET_VENDOR_RACAL is not set
# CONFIG_AT1700 is not set
# CONFIG_DEPCA is not set
# CONFIG_NET_ISA is not set
CONFIG_NET_PCI=y
# CONFIG_PCNET32 is not set
# CONFIG_ADAPTEC_STARFIRE is not set
# CONFIG_AC3200 is not set
# CONFIG_APRICOT is not set
# CONFIG_CS89x0 is not set
# CONFIG_DE4X5 is not set
CONFIG_TULIP=y
# CONFIG_DGRS is not set
# CONFIG_DM9102 is not set
# CONFIG_EEPRO100 is not set
# CONFIG_LNE390 is not set
# CONFIG_NE3210 is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_RTL8129 is not set
# CONFIG_8139TOO is not set
# CONFIG_SIS900 is not set
# CONFIG_TLAN is not set
# CONFIG_VIA_RHINE is not set
# CONFIG_ES3210 is not set
# CONFIG_EPIC100 is not set
# CONFIG_NET_POCKET is not set

#
# Ethernet (1000 Mbit)
#
# CONFIG_YELLOWFIN is not set
# CONFIG_ACENIC is not set
# CONFIG_SK98LIN is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Wireless LAN (non-hamradio)
#
# CONFIG_NET_RADIO is not set

#
# Token Ring devices
#
# CONFIG_TR is not set
# CONFIG_NET_FC is not set
# CONFIG_RCPCI is not set
# CONFIG_SHAPER is not set

#
# Wan interfaces
#
# CONFIG_WAN is not set

#
# Character devices
#
# CONFIG_VT is not set
CONFIG_SERIAL=y
CONFIG_SERIAL_CONSOLE=y
CONFIG_SERIAL_GSC=y
CONFIG_SERIAL_EXTENDED=y
# CONFIG_SERIAL_MANY_PORTS is not set
# CONFIG_SERIAL_SHARE_IRQ is not set
# CONFIG_SERIAL_DETECT_IRQ is not set
# CONFIG_SERIAL_MULTIPORT is not set
# CONFIG_HUB6 is not set
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_UNIX98_PTYS=y
CONFIG_UNIX98_PTY_COUNT=256
# CONFIG_PRINTER is not set
# CONFIG_PPDEV is not set

#
# I2C support
#
# CONFIG_I2C is not set

#
# Mice
#
# CONFIG_BUSMOUSE is not set
# CONFIG_MOUSE is not set

#
# Joysticks
#
# CONFIG_JOYSTICK is not set
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
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_FTAPE is not set
# CONFIG_DRM is not set
# CONFIG_DRM_TDFX is not set
# CONFIG_AGP is not set

#
# File systems
#
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_FAT_FS is not set
# CONFIG_MSDOS_FS is not set
# CONFIG_UMSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_CRAMFS is not set
CONFIG_ISO9660_FS=y
# CONFIG_JOLIET is not set
# CONFIG_MINIX_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_HPFS_FS is not set
CONFIG_PROC_FS=y
# CONFIG_DEVFS_FS is not set
# CONFIG_DEVFS_DEBUG is not set
# CONFIG_DEVPTS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_EXT2_FS=y
# CONFIG_SYSV_FS is not set
# CONFIG_UDF_FS is not set
# CONFIG_UFS_FS is not set

#
# Network File Systems
#
# CONFIG_CODA_FS is not set
CONFIG_NFS_FS=y
CONFIG_ROOT_NFS=y
# CONFIG_NFSD is not set
CONFIG_SUNRPC=y
CONFIG_LOCKD=y
# CONFIG_SMB_FS is not set
# CONFIG_NCP_FS is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
# CONFIG_NLS is not set

#
# Sound Drivers
#
# CONFIG_SOUND is not set

#
# Kernel hacking
#
CONFIG_MAGIC_SYSRQ=y

----- end .config


If there is more info. I can send along please let me know... 


Thanks,


     Chris
