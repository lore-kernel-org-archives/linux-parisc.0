Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from orion.netbank.com.br (orion.netbank.com.br [200.203.199.90])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CDC7482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jul 2003 22:12:46 -0600 (MDT)
Received: from [200.181.169.17] (helo=brinquendo.conectiva.com.br)
	by orion.netbank.com.br with asmtp (Exim 3.33 #1)
	id 19dMfd-0003PQ-00
	for parisc-linux@lists.parisc-linux.org; Fri, 18 Jul 2003 01:16:37 -0300
Date: Fri, 18 Jul 2003 01:14:40 -0300
From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030718041440.GZ1582@conectiva.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] arch/parisc/kernel/perf_asm.o not building
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

My first post 8)

2.6-bk (i.e. latest linus tree in master.kernel.org), using the
xc-20020118.tar.bz2 cross compiler (latest):

[acme@oops parisc-2.5]$ hppa-linux-gcc -v
Reading specs from /home/opt/palinux/bin/../lib/gcc-lib/hppa-linux/3.0.3/=
specs
Configured with: /home/al76/puffin/palinux/gcc/configure --target=3Dhppa-=
linux --host=3Di386-linux --build=3Di386-linux --prefix=3D/opt/palinux --=
disable-shared --disable-nls --with-libc --with-libs=3D/opt/palinux/lib
Thread model: single
gcc version 3.0.3

make[1]: `arch/parisc/kernel/asm-offsets.s' est=E1 atualizado.
  CHK     include/linux/compile.h
  AS      arch/parisc/kernel/perf_asm.o
arch/parisc/kernel/perf_asm.S: Assembler messages:
arch/parisc/kernel/perf_asm.S:42: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:54: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:68: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:71: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:119: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:135: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:152: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:176: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:272: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:284: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:320: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:356: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:368: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:464: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:476: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:512: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:535: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:574: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:969: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1015: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1031: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1044: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1053: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1125: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1134: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1143: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1152: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1161: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1170: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1179: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1197: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1206: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1278: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1287: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1314: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1323: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1331: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1372: Error: Invalid operands=20
arch/parisc/kernel/perf_asm.S:1675: Error: Invalid operands=20
make[1]: ** [arch/parisc/kernel/perf_asm.o] Erro 1
make: ** [arch/parisc/kernel] Erro 2


#
# Automatically generated make config: don't edit
#
CONFIG_PARISC=3Dy
CONFIG_MMU=3Dy
CONFIG_STACK_GROWSUP=3Dy
CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy

#
# Code maturity level options
#
CONFIG_EXPERIMENTAL=3Dy

#
# General setup
#
CONFIG_SWAP=3Dy
CONFIG_SYSVIPC=3Dy
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_SYSCTL=3Dy
CONFIG_LOG_BUF_SHIFT=3D15
# CONFIG_EMBEDDED is not set
CONFIG_KALLSYMS=3Dy
CONFIG_FUTEX=3Dy
CONFIG_EPOLL=3Dy

#
# Loadable module support
#
# CONFIG_MODULES is not set

#
# Processor type and features
#
# CONFIG_PA7000 is not set
# CONFIG_PA7100LC is not set
# CONFIG_PA7200 is not set
CONFIG_PA8X00=3Dy
CONFIG_PA20=3Dy
CONFIG_PARISC64=3Dy
# CONFIG_PDC_NARROW is not set
# CONFIG_SMP is not set
# CONFIG_PREEMPT is not set
CONFIG_COMPAT=3Dy
# CONFIG_HPUX is not set

#
# Bus options (PCI, PCMCIA, EISA, GSC, ISA)
#
# CONFIG_GSC is not set
CONFIG_PCI=3Dy
CONFIG_PCI_LEGACY_PROC=3Dy
CONFIG_PCI_NAMES=3Dy
CONFIG_PCI_LBA=3Dy
CONFIG_IOSAPIC=3Dy
CONFIG_IOMMU_SBA=3Dy
# CONFIG_SUPERIO is not set
# CONFIG_CHASSIS_LCD_LED is not set
CONFIG_HOTPLUG=3Dy

#
# PCMCIA/CardBus support
#
CONFIG_PCMCIA=3Dy
CONFIG_YENTA=3Dy
CONFIG_CARDBUS=3Dy
# CONFIG_I82092 is not set
# CONFIG_TCIC is not set

#
# PCI Hotplug Support
#
# CONFIG_HOTPLUG_PCI is not set

#
# Executable file formats
#
CONFIG_KCORE_ELF=3Dy
CONFIG_BINFMT_ELF=3Dy
# CONFIG_BINFMT_MISC is not set

#
# Generic Driver Options
#
# CONFIG_FW_LOADER is not set

#
# Parallel port support
#
# CONFIG_PARPORT is not set

#
# Block devices
#
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
# CONFIG_BLK_DEV_UMEM is not set
CONFIG_BLK_DEV_LOOP=3Dy
# CONFIG_BLK_DEV_CRYPTOLOOP is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_BLK_DEV_INITRD is not set

#
# ATA/ATAPI/MFM/RLL support
#
# CONFIG_IDE is not set

#
# SCSI device support
#
# CONFIG_SCSI is not set

#
# Multi-device support (RAID and LVM)
#
# CONFIG_MD is not set

#
# Networking support
#
CONFIG_NET=3Dy

#
# Networking options
#
CONFIG_PACKET=3Dy
CONFIG_PACKET_MMAP=3Dy
CONFIG_NETLINK_DEV=3Dy
# CONFIG_NETFILTER is not set
CONFIG_UNIX=3Dy
# CONFIG_NET_KEY is not set
CONFIG_INET=3Dy
CONFIG_IP_MULTICAST=3Dy
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=3Dy
# CONFIG_IP_PNP_DHCP is not set
CONFIG_IP_PNP_BOOTP=3Dy
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_IP_MROUTE is not set
# CONFIG_ARPD is not set
# CONFIG_INET_ECN is not set
# CONFIG_SYN_COOKIES is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
# CONFIG_IPV6 is not set
# CONFIG_XFRM_USER is not set

#
# SCTP Configuration (EXPERIMENTAL)
#
CONFIG_IPV6_SCTP__=3Dy
# CONFIG_IP_SCTP is not set
# CONFIG_ATM is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_LLC is not set
# CONFIG_DECNET is not set
# CONFIG_BRIDGE is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_NET_DIVERT is not set
# CONFIG_ECONET is not set
# CONFIG_WAN_ROUTER is not set
# CONFIG_NET_FASTROUTE is not set
# CONFIG_NET_HW_FLOWCONTROL is not set

#
# QoS and/or fair queueing
#
# CONFIG_NET_SCHED is not set

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
CONFIG_NETDEVICES=3Dy

#
# ARCnet devices
#
# CONFIG_ARCNET is not set
# CONFIG_DUMMY is not set
# CONFIG_BONDING is not set
# CONFIG_EQUALIZER is not set
# CONFIG_TUN is not set
# CONFIG_ETHERTAP is not set

#
# Ethernet (10 or 100Mbit)
#
CONFIG_NET_ETHERNET=3Dy
# CONFIG_MII is not set
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_NET_VENDOR_3COM is not set

#
# Tulip family network device support
#
CONFIG_NET_TULIP=3Dy
# CONFIG_DE2104X is not set
CONFIG_TULIP=3Dy
# CONFIG_TULIP_MWI is not set
# CONFIG_TULIP_MMIO is not set
# CONFIG_DE4X5 is not set
# CONFIG_WINBOND_840 is not set
# CONFIG_DM9102 is not set
# CONFIG_PCMCIA_XIRCOM is not set
# CONFIG_PCMCIA_XIRTULIP is not set
# CONFIG_HP100 is not set
# CONFIG_NET_PCI is not set

#
# Ethernet (1000 Mbit)
#
CONFIG_ACENIC=3Dy
# CONFIG_ACENIC_OMIT_TIGON_I is not set
# CONFIG_DL2K is not set
# CONFIG_E1000 is not set
# CONFIG_NS83820 is not set
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
# CONFIG_R8169 is not set
# CONFIG_SK98LIN is not set
# CONFIG_TIGON3 is not set

#
# Ethernet (10000 Mbit)
#
# CONFIG_IXGB is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Wireless LAN (non-hamradio)
#
CONFIG_NET_RADIO=3Dy

#
# Obsolete Wireless cards support (pre-802.11)
#
# CONFIG_STRIP is not set
# CONFIG_PCMCIA_WAVELAN is not set
# CONFIG_PCMCIA_NETWAVE is not set

#
# Wireless 802.11 Frequency Hopping cards support
#
# CONFIG_PCMCIA_RAYCS is not set

#
# Wireless 802.11b ISA/PCI cards support
#
# CONFIG_AIRO is not set
# CONFIG_HERMES is not set

#
# Wireless 802.11b Pcmcia/Cardbus cards support
#
# CONFIG_AIRO_CS is not set
# CONFIG_PCMCIA_ATMEL is not set
CONFIG_PCMCIA_WL3501=3Dy
CONFIG_NET_WIRELESS=3Dy

#
# Token Ring devices (depends on LLC=3Dy)
#
# CONFIG_RCPCI is not set
# CONFIG_SHAPER is not set

#
# Wan interfaces
#
# CONFIG_WAN is not set

#
# PCMCIA network device support
#
# CONFIG_NET_PCMCIA is not set

#
# IrDA (infrared) support
#
# CONFIG_IRDA is not set

#
# Input device support
#
CONFIG_INPUT=3Dy

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_TSDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input I/O drivers
#
# CONFIG_GAMEPORT is not set
CONFIG_SOUND_GAMEPORT=3Dy
# CONFIG_SERIO is not set

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set

#
# Character devices
#
CONFIG_VT=3Dy
CONFIG_VT_CONSOLE=3Dy
CONFIG_HW_CONSOLE=3Dy
# CONFIG_SERIAL_NONSTANDARD is not set

#
# Serial drivers
#
CONFIG_SERIAL_8250=3Dy
CONFIG_SERIAL_8250_CONSOLE=3Dy
# CONFIG_SERIAL_8250_CS is not set
CONFIG_SERIAL_8250_EXTENDED=3Dy
CONFIG_SERIAL_8250_MANY_PORTS=3Dy
CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
# CONFIG_SERIAL_8250_MULTIPORT is not set
# CONFIG_SERIAL_8250_RSA is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MUX is not set
# CONFIG_PDC_CONSOLE is not set
CONFIG_SERIAL_CORE=3Dy
CONFIG_SERIAL_CORE_CONSOLE=3Dy
CONFIG_UNIX98_PTYS=3Dy
CONFIG_UNIX98_PTY_COUNT=3D256

#
# I2C support
#
# CONFIG_I2C is not set

#
# I2C Hardware Sensors Mainboard support
#

#
# I2C Hardware Sensors Chip support
#
# CONFIG_I2C_SENSOR is not set

#
# Mice
#
# CONFIG_BUSMOUSE is not set
# CONFIG_QIC02_TAPE is not set

#
# IPMI
#
# CONFIG_IPMI_HANDLER is not set

#
# Watchdog Cards
#
# CONFIG_WATCHDOG is not set
# CONFIG_NVRAM is not set
CONFIG_GEN_RTC=3Dy
# CONFIG_GEN_RTC_X is not set
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_FTAPE is not set
# CONFIG_AGP is not set
# CONFIG_DRM is not set

#
# PCMCIA character devices
#
# CONFIG_SYNCLINK_CS is not set
# CONFIG_RAW_DRIVER is not set
# CONFIG_HANGCHECK_TIMER is not set

#
# Multimedia devices
#
# CONFIG_VIDEO_DEV is not set

#
# Digital Video Broadcasting Devices
#
# CONFIG_DVB is not set

#
# File systems
#
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
# CONFIG_JBD is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_ROMFS_FS is not set
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set

#
# DOS/FAT/NT Filesystems
#
# CONFIG_FAT_FS is not set
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=3Dy
# CONFIG_DEVFS_FS is not set
CONFIG_DEVPTS_FS=3Dy
# CONFIG_DEVPTS_FS_XATTR is not set
# CONFIG_TMPFS is not set
CONFIG_RAMFS=3Dy

#
# Miscellaneous filesystems
#
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_CRAMFS is not set
# CONFIG_VXFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set

#
# Network File Systems
#
CONFIG_NFS_FS=3Dy
CONFIG_NFS_V3=3Dy
# CONFIG_NFS_V4 is not set
# CONFIG_NFSD is not set
CONFIG_ROOT_NFS=3Dy
CONFIG_LOCKD=3Dy
CONFIG_LOCKD_V4=3Dy
# CONFIG_EXPORTFS is not set
CONFIG_SUNRPC=3Dy
# CONFIG_SUNRPC_GSS is not set
# CONFIG_SMB_FS is not set
# CONFIG_CIFS is not set
# CONFIG_NCP_FS is not set
# CONFIG_CODA_FS is not set
# CONFIG_INTERMEZZO_FS is not set
# CONFIG_AFS_FS is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=3Dy

#
# Graphics support
#
# CONFIG_FB is not set

#
# Console display driver support
#
# CONFIG_VGA_CONSOLE is not set
# CONFIG_MDA_CONSOLE is not set
# CONFIG_STI_CONSOLE is not set
CONFIG_DUMMY_CONSOLE_COLUMNS=3D160
CONFIG_DUMMY_CONSOLE_ROWS=3D64
CONFIG_DUMMY_CONSOLE=3Dy

#
# Sound
#
# CONFIG_SOUND is not set

#
# USB support
#
# CONFIG_USB is not set
# CONFIG_USB_GADGET is not set

#
# Bluetooth support
#
# CONFIG_BT is not set

#
# Profiling support
#
# CONFIG_PROFILING is not set

#
# Kernel hacking
#
CONFIG_DEBUG_KERNEL=3Dy
# CONFIG_DEBUG_SLAB is not set
CONFIG_MAGIC_SYSRQ=3Dy
# CONFIG_FRAME_POINTER is not set

#
# Security options
#
# CONFIG_SECURITY is not set

#
# Cryptographic options
#
# CONFIG_CRYPTO is not set

#
# Library routines
#
# CONFIG_CRC32 is not set
