Received: from bentley.socsci.auc.dk (bentley.socsci.auc.dk [130.225.60.48])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id QAA03456
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Feb 2000 16:33:58 -0700
Sender: mkp@socsci.auc.dk
To: parisc-linux@puffin.external.hp.com
From: "Martin K. Petersen" <mkp@mkp.net>
Date: 14 Feb 2000 23:34:26 +0100
Message-ID: <yq1itzr9zwt.fsf@leyland.socsci.auc.dk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Subject: [parisc-linux] nfsroot howto
List-ID: <linux-parisc.vger.kernel.org>


--=-=-=


LINUX/PA-RISC NFSROOT HOWTO

(Or how to get to a working shell prompt)


YOU NEED:

A fresh linux-2.3 checkout from CVS

The .config included below

puffin.external.hp.com/pub/parisc/binaries/nfsroot/nfsroot-20000214.tar.gz

A supported PA-RISC box with serial console

A Linux (any Unix will do) server with NFS server, bootpd and tftpd 


Note on consoles:

Yes, you *will* need serial console on the PA-RISC box.  IODC console
was a quick hack to get output during development, but it will never
be usable as an interactive console.  When HP releases docs for STI we
will implement a proper framebuffer console.  Until then, serial is
the only option.  Sorry.

Futhermore this will only work on boxes with LASI.  I'm still working
on support for the NS87560UBD Super I/O chip on [BCJ]x000 boxes.


STEP 1. KERNEL BUILDING

Get the latest linux-2.3 tree from CVS.


a) If you use the standard boot loader

Edit DEFAULT_COMMANDLINE in linux-2.3/arch/parisc/boot/boot_code/ipl_c.c 
to read:

	"vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=10.0.0.1"


b) If you use PALO

Edit the echo line in palo/mklifimage to read

	"vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=10.0.0.1"


In both cases replace 10.0.0.1 with the IP address of your NFS server.


Copy the .config included below to the root of the linux source tree.

make oldconfig
make dep
make clean
make Image	(Or make palo, if you use Paul's loader)

Due to linker issues cross compiling is still not possible.  I.e. you
have to build on HP/UX.


STEP 2. BOOTP, TFTP AND NFS

Copy linux-2.3/arch/parisc/boot/Image (or palo/lifimage) to
/tftpboot/vmlinux on the server.  Make sure the file is world
readable.

Edit /etc/bootptab on the server.  I have an entry like this:

mybox:\
        :hd=/tftpboot:\
        :bf=vmlinux:\
        :ht=ether:\
        :ha=0060b007e4ab:\
        :sm=255.255.255.0:\
        :hn:\
        :ip=10.0.0.6:\
        :vm=rfc1048:

Replace ``mybox'' with the hostname of your PA-RISC box.

You need to insert the MAC address of the PA-RISC box in the ha=
field.  You can find the MAC by typing "in la" at the PDC prompt.

You should also change the IP to something appropriate for your LAN.

Add an entry for the host in /etc/hosts.

Unpack the nfsroot tarball in /tftpboot and rename the unpacked
directory (mybox) to the hostname of your box.

Make sure both bootps and tftp are enabled in /etc/inetd.conf.

Edit your /etc/exports to contain a line like this:

	/tftpboot/mybox		mybox(rw,no_root_squash)

Again, replace mybox with your hostname.

Restart inetd and nfs services if you made any modifications.


STEP 3. GO

Type "bo lan" at the PDC prompt on the PA-box and kapow.  You've got a
prompt (I hope). 

Here's what I get...

---8<---

Stand-alone shell (version 3.4)
500 5 1970 53b
> -mount -t proc proc /proc                                                       
quux                                                                            
quuux                                                                           
> -more /proc/cpuinfo
quux                                                                            
quuux
<< cpuinfo >>
processor       : 0
cpu family      : PA-RISC <NULL>
cpu             : PA8000
cpu MHz         : 160.000000
cpu category    : category A
cpu level       : level 0
cpu shadow regs : no
model           :
model name      : Raven U 160 (9000/780/C160)
sw_id           : 0
hversion        : 0x00000000
sversion        : 0x00000000
I-cache         : 0 KB
D-cache         : 0 KB (WB)
ITLB entries    : 0
DTLB entries    : 0
BTLB            : not supported
---8<---


--=-=-=
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=.config
Content-Description: .config

#
# Automatically generated make config: don't edit
#
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
CONFIG_GSC_DINO=y
CONFIG_GSC_LASI=y
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
# CONFIG_BLK_CPQ_DA is not set

#
# Additional Block Devices
#
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_MD is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_BLK_DEV_XD is not set
# CONFIG_BLK_DEV_DAC960 is not set
# CONFIG_PARIDE is not set
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
# CONFIG_LASI_82596 is not set

#
# ARCnet devices
#
# CONFIG_ARCNET is not set
# CONFIG_DUMMY is not set
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
# CONFIG_RTL8139 is not set
# CONFIG_DM9102 is not set
# CONFIG_AT1700 is not set
# CONFIG_DEPCA is not set
# CONFIG_NET_ISA is not set
CONFIG_NET_EISA=y
# CONFIG_PCNET32 is not set
# CONFIG_ADAPTEC_STARFIRE is not set
# CONFIG_AC3200 is not set
# CONFIG_APRICOT is not set
# CONFIG_CS89x0 is not set
# CONFIG_DE4X5 is not set
CONFIG_DEC_ELCP=y
# CONFIG_DGRS is not set
# CONFIG_EEXPRESS_PRO100 is not set
# CONFIG_LNE390 is not set
# CONFIG_NE3210 is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_SIS900 is not set
# CONFIG_TLAN is not set
# CONFIG_VIA_RHINE is not set
# CONFIG_ES3210 is not set
# CONFIG_EPIC100 is not set
# CONFIG_ZNET is not set
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
# Token Ring driver support
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
# Filesystems
#
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_BFS_FS_WRITE is not set
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
# CONFIG_NTFS_RW is not set
# CONFIG_HPFS_FS is not set
CONFIG_PROC_FS=y
# CONFIG_DEVPTS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX4FS_RW is not set
# CONFIG_ROMFS_FS is not set
CONFIG_EXT2_FS=y
# CONFIG_SYSV_FS is not set
# CONFIG_SYSV_FS_WRITE is not set
# CONFIG_UDF_FS is not set
# CONFIG_UDF_RW is not set
# CONFIG_UFS_FS is not set
# CONFIG_UFS_FS_WRITE is not set

#
# Network File Systems
#
# CONFIG_CODA_FS is not set
CONFIG_NFS_FS=y
CONFIG_ROOT_NFS=y
# CONFIG_NFSD is not set
# CONFIG_NFSD_V3 is not set
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

--=-=-=


-- 
Martin Kasper Petersen			BOFH, IC1&2, Aalborg University, DK
mailto:mkp@SunSITE.auc.dk		http://SunSITE.auc.dk/~mkp/

--=-=-=--
