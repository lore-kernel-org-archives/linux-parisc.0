Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp7.xs4all.nl (smtp7.xs4all.nl [194.109.127.133])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34D4C482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 13:57:25 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp7.xs4all.nl (8.9.3/8.9.3) with ESMTP id VAA03600
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 21:57:22 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Thu, 30 Aug 2001 21:57:14 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010830215714.A19233@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.4.9-pa10 hangs on c200+ after 'branching to kernel entry point'
List-ID: <linux-parisc.vger.kernel.org>

did I configure somethings wrong? I grabbed linux-latest yesterday,
and did a 

make oldconfig
make config

I did change the CPU-type to PA8x00, and set CONFIG_PA20 to y.

That should still work, right?

I have the feeling I'm asking a lot of questions.

Jurriaan


2/boot/vmlinux-2.4.9-pa10 root=/dev/sda2 HOME=/ console=ttyS0 TERM=vt102
 0: 2/boot/vmlinux-2.4.9-pa10
 1: root=/dev/sda2
 2: HOME=/
 3: console=ttyS0
 4: TERM=vt102

Edit which field?
(or 'b' to boot with this command line)? b

Command line: 'root=/dev/sda2 HOME=/ console=ttyS0 TERM=vt102'

Kernel: partition 2 file /boot/vmlinux-2.4.9-pa10
ext2 block size 4096
ext2_mount(partition 2) returns 0
ext2_open(/boot/vmlinux-2.4.9-pa10) = 3
ELF32 executable
Entry 00100028 first 00100000 n 4
Segment 0 load 00100000 size 1720172 mediaptr 0x1000
Segment 1 load 002a4000 size 282416 mediaptr 0x1a5000
Segment 2 load 002ec000 size 385024 mediaptr 0x1ea000
Segment 3 load 0037f530 size 87984 mediaptr 0x248530
branching to kernel entry point 0x00100028
=============================
jurriaan@pa8200:~/source/linux$ ls -l /boot
total 7020
-rw-r--r--    1 root     root       593072 Jan 16  2021 System.map-2.4.0
-rw-r--r--    1 root     disk       552272 Aug 30 23:21 System.map-2.4.9-pa10
-rw-r--r--    1 root     root         3949 Jan 16  2021 config-2.4.0
-rw-r--r--    1 root     disk        13616 Aug 30 23:21 config-2.4.9-pa10
-rw-r--r--    1 root     root        26624 Jul 11 19:08 iplboot
-rw-r--r--    1 root     root      2853588 Jan 16  2021 vmlinux-2.4.0
-rwxr-xr-x    1 root     disk      3118114 Aug 30 23:20 vmlinux-2.4.9-pa10
jurriaan@pa8200:~/source/linux$ cat /etc/palo.conf
--bootloader=/boot/iplboot
--commandline=2/boot/vmlinux-2.4.9-pa10 root=/dev/sda2 HOME=/
--recoverykernel=/boot/vmlinux-2.4.0
--init-partitioned=/dev/sda
jurriaan@pa8200:~/source/linux$ egrep "m$|y$" .config
CONFIG_PARISC=y
CONFIG_RWSEM_GENERIC_SPINLOCK=y
CONFIG_EXPERIMENTAL=y
CONFIG_PA8X00=y
CONFIG_PA20=y
CONFIG_GSC=y
CONFIG_IOMMU_CCIO=y
CONFIG_GSC_LASI=y
CONFIG_GSC_WAX=y
CONFIG_PCI=y
CONFIG_GSC_DINO=y
CONFIG_PCI_LBA=y
CONFIG_WAX_EISA=y
CONFIG_SUPERIO=y
CONFIG_IOSAPIC=y
CONFIG_IOMMU_SBA=y
CONFIG_PCI_NAMES=y
CONFIG_CHASSIS_LCD_LED=y
CONFIG_HOTPLUG=y
CONFIG_NET=y
CONFIG_SYSVIPC=y
CONFIG_SYSCTL=y
CONFIG_KCORE_ELF=y
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_SOM=y
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=y
CONFIG_PARPORT_PC_CML1=y
CONFIG_PARPORT_GSC=y
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_LINEAR=y
CONFIG_MD_RAID0=y
CONFIG_MD_RAID1=y
CONFIG_MD_RAID5=y
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_BOOTP=y
CONFIG_SCSI=y
CONFIG_BLK_DEV_SD=y
CONFIG_CHR_DEV_ST=y
CONFIG_BLK_DEV_SR=y
CONFIG_CHR_DEV_SG=y
CONFIG_SCSI_LASI=y
CONFIG_SCSI_ZALON=y
CONFIG_SCSI_SYM53C8XX=y
CONFIG_NETDEVICES=y
CONFIG_NET_ETHERNET=y
CONFIG_LASI_82596=y
CONFIG_NET_PCI=y
CONFIG_TULIP=y
CONFIG_VT=y
CONFIG_VT_CONSOLE=y
CONFIG_GSC_PS2=y
CONFIG_HIL=y
CONFIG_SERIAL=y
CONFIG_SERIAL_CONSOLE=y
CONFIG_SERIAL_GSC=y
CONFIG_UNIX98_PTYS=y
CONFIG_PRINTER=y
CONFIG_MOUSE=y
CONFIG_PSMOUSE=y
CONFIG_GENRTC=y
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
CONFIG_PROC_FS=y
CONFIG_DEVPTS_FS=y
CONFIG_EXT2_FS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V3=y
CONFIG_ROOT_NFS=y
CONFIG_NFSD=y
CONFIG_NFSD_V3=y
CONFIG_SUNRPC=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_MSDOS_PARTITION=y
CONFIG_NLS=y
CONFIG_FB=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_FB_STI=y
CONFIG_FBCON_CFB2=y
CONFIG_FBCON_CFB4=y
CONFIG_FBCON_CFB8=y
CONFIG_FBCON_STI=y
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_STI_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_FBCON=y
CONFIG_FBCON_FONT=y
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_FONT_6x11=y
CONFIG_FONT_SUN12x22=y
CONFIG_SOUND=y
CONFIG_SOUND_HARMONY=y
CONFIG_MAGIC_SYSRQ=y

-- 
BOFH excuse #210:

We didn't pay the Internet bill and it's been cut off.
GNU/Linux 2.4.9-ac2 SMP/ReiserFS 2x1402 bogomips load av: 0.13 0.07 0.02
