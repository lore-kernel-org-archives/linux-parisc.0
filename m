Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63C604829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Dec 2002 11:07:35 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18P54z-0005rr-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Dec 2002 19:07:29 +0100
Date: Thu, 19 Dec 2002 19:06:57 +0100
Message-ID: <3DED9BF500002922@ocpmta8.freegates.net>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] 2.4.20-paxx Config problem?
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

Hi all,

Let me first wish you and your families a Merry Christmas and a Happy New=

Year.
Also thanks you all for relevant help.

I need again help because I used a .config file of my own and I obtain a
kernel 2.4.20-paxx operational on my b2k. 
I also try to test the one suggested in arch/parisc/debian-configs/32. 
But this one make hung the kernel at "search devices..." step and the gre=
en
led on the ide cdrom stay light.

Here is the diff between mine and the suggested:
--- config-2.4.20-pa14	2002-12-19 17:36:14.000000000 +0100
+++ 32	2002-12-18 14:27:04.000000000 +0100
@@ -101,32 +101,33 @@
 #
 CONFIG_MD=3Dy
 CONFIG_BLK_DEV_MD=3Dy
-# CONFIG_MD_LINEAR is not set
-# CONFIG_MD_RAID0 is not set
+CONFIG_MD_LINEAR=3Dy
+CONFIG_MD_RAID0=3Dy
 CONFIG_MD_RAID1=3Dy
-# CONFIG_MD_RAID5 is not set
+CONFIG_MD_RAID5=3Dy
 # CONFIG_MD_MULTIPATH is not set
-CONFIG_BLK_DEV_LVM=3Dy
+# CONFIG_BLK_DEV_LVM is not set
 
 #
 # Networking options
 #
 CONFIG_PACKET=3Dy
-# CONFIG_PACKET_MMAP is not set
-# CONFIG_NETLINK_DEV is not set
+CONFIG_PACKET_MMAP=3Dy
+CONFIG_NETLINK_DEV=3Dy
 CONFIG_NETFILTER=3Dy
 CONFIG_NETFILTER_DEBUG=3Dy
 CONFIG_FILTER=3Dy
 CONFIG_UNIX=3Dy
 CONFIG_INET=3Dy
-# CONFIG_IP_MULTICAST is not set
+CONFIG_IP_MULTICAST=3Dy
 # CONFIG_IP_ADVANCED_ROUTER is not set
 CONFIG_IP_PNP=3Dy
 # CONFIG_IP_PNP_DHCP is not set
-# CONFIG_IP_PNP_BOOTP is not set
+CONFIG_IP_PNP_BOOTP=3Dy
 # CONFIG_IP_PNP_RARP is not set
 # CONFIG_NET_IPIP is not set
 # CONFIG_NET_IPGRE is not set
+# CONFIG_IP_MROUTE is not set
 # CONFIG_ARPD is not set
 # CONFIG_INET_ECN is not set
 # CONFIG_SYN_COOKIES is not set
@@ -147,7 +148,7 @@
 CONFIG_IP_NF_MATCH_TOS=3Dm
 # CONFIG_IP_NF_MATCH_ECN is not set
 # CONFIG_IP_NF_MATCH_DSCP is not set
-# CONFIG_IP_NF_MATCH_AH_ESP is not set
+CONFIG_IP_NF_MATCH_AH_ESP=3Dm
 # CONFIG_IP_NF_MATCH_LENGTH is not set
 # CONFIG_IP_NF_MATCH_TTL is not set
 CONFIG_IP_NF_MATCH_TCPMSS=3Dm
@@ -172,7 +173,7 @@
 # CONFIG_IP_NF_TARGET_DSCP is not set
 CONFIG_IP_NF_TARGET_MARK=3Dm
 CONFIG_IP_NF_TARGET_LOG=3Dm
-# CONFIG_IP_NF_TARGET_ULOG is not set
+CONFIG_IP_NF_TARGET_ULOG=3Dm
 CONFIG_IP_NF_TARGET_TCPMSS=3Dm
 # CONFIG_IP_NF_ARPTABLES is not set
 CONFIG_IP_NF_COMPAT_IPCHAINS=3Dm
@@ -310,12 +311,12 @@
 #
 CONFIG_BLK_DEV_SD=3Dy
 CONFIG_SD_EXTRA_DEVS=3D40
-CONFIG_CHR_DEV_ST=3Dm
+CONFIG_CHR_DEV_ST=3Dy
 # CONFIG_CHR_DEV_OSST is not set
 CONFIG_BLK_DEV_SR=3Dy
 # CONFIG_BLK_DEV_SR_VENDOR is not set
 CONFIG_SR_EXTRA_DEVS=3D2
-CONFIG_CHR_DEV_SG=3Dm
+CONFIG_CHR_DEV_SG=3Dy
 
 #
 # Some SCSI devices (e.g. CD jukebox) support multiple LUNs
@@ -370,7 +371,7 @@
 CONFIG_53C700_USE_CONSISTENT=3Dy
 # CONFIG_SCSI_NCR53C7xx is not set
 CONFIG_SCSI_SYM53C8XX_2=3Dy
-CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=3D0
+CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=3D1
 CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=3D16
 CONFIG_SCSI_SYM53C8XX_MAX_TAGS=3D64
 # CONFIG_SCSI_SYM53C8XX_IOMAPPED is not set
@@ -381,7 +382,7 @@
 CONFIG_ASK_ZALON=3Dy
 CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS=3D8
 CONFIG_SCSI_NCR53C8XX_MAX_TAGS=3D32
-CONFIG_SCSI_NCR53C8XX_SYNC=3D80
+CONFIG_SCSI_NCR53C8XX_SYNC=3D20
 # CONFIG_SCSI_NCR53C8XX_PROFILE is not set
 # CONFIG_SCSI_NCR53C8XX_IOMAPPED is not set
 # CONFIG_SCSI_NCR53C8XX_SYMBIOS_COMPAT is not set
@@ -444,7 +445,7 @@
 # CONFIG_HP100 is not set
 # CONFIG_NET_ISA is not set
 CONFIG_NET_PCI=3Dy
-# CONFIG_PCNET32 is not set
+CONFIG_PCNET32=3Dm
 CONFIG_ADAPTEC_STARFIRE=3Dm
 # CONFIG_AC3200 is not set
 # CONFIG_APRICOT is not set
@@ -483,7 +484,7 @@
 #
 # Ethernet (1000 Mbit)
 #
-CONFIG_ACENIC=3Dm
+# CONFIG_ACENIC is not set
 # CONFIG_ACENIC_OMIT_TIGON_I is not set
 # CONFIG_DL2K is not set
 # CONFIG_E1000 is not set
@@ -492,7 +493,7 @@
 CONFIG_HAMACHI=3Dm
 CONFIG_YELLOWFIN=3Dm
 CONFIG_SK98LIN=3Dm
-# CONFIG_TIGON3 is not set
+CONFIG_TIGON3=3Dm
 # CONFIG_FDDI is not set
 # CONFIG_HIPPI is not set
 # CONFIG_PLIP is not set
@@ -533,8 +534,8 @@
 # Input core support
 #
 CONFIG_INPUT=3Dy
-CONFIG_INPUT_KEYBDEV=3Dm
-CONFIG_INPUT_MOUSEDEV=3Dm
+CONFIG_INPUT_KEYBDEV=3Dy
+CONFIG_INPUT_MOUSEDEV=3Dy
 CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
 CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
 # CONFIG_INPUT_JOYDEV is not set
@@ -550,7 +551,25 @@
 CONFIG_SERIAL_CONSOLE=3Dy
 CONFIG_SERIAL_GSC=3Dy
 # CONFIG_SERIAL_EXTENDED is not set
-# CONFIG_SERIAL_NONSTANDARD is not set
+CONFIG_SERIAL_NONSTANDARD=3Dy
+# CONFIG_COMPUTONE is not set
+# CONFIG_ROCKETPORT is not set
+# CONFIG_CYCLADES is not set
+# CONFIG_DIGIEPCA is not set
+# CONFIG_DIGI is not set
+# CONFIG_ESPSERIAL is not set
+# CONFIG_MOXA_INTELLIO is not set
+# CONFIG_MOXA_SMARTIO is not set
+# CONFIG_ISI is not set
+# CONFIG_SYNCLINK is not set
+# CONFIG_SYNCLINKMP is not set
+# CONFIG_N_HDLC is not set
+# CONFIG_RISCOM8 is not set
+# CONFIG_SPECIALIX is not set
+# CONFIG_SX is not set
+# CONFIG_RIO is not set
+# CONFIG_STALDRV is not set
+CONFIG_PDC_CONSOLE=3Dy
 CONFIG_UNIX98_PTYS=3Dy
 CONFIG_UNIX98_PTY_COUNT=3D256
 CONFIG_PRINTER=3Dy
@@ -581,7 +600,7 @@
 # CONFIG_INPUT_PCIGAME is not set
 # CONFIG_INPUT_CS461X is not set
 # CONFIG_INPUT_EMU10K1 is not set
-# CONFIG_INPUT_SERIO is not set
+CONFIG_INPUT_SERIO=3Dy
 # CONFIG_INPUT_SERPORT is not set
 
 #
@@ -644,15 +663,14 @@
 #
 CONFIG_HP_SDC=3Dy
 # CONFIG_HP_SDC_RTC is not set
-# CONFIG_HIL_MLC is not set
-
-#
-#   Serial IO support needed for HIL keyboard and mouse support
-#
+CONFIG_HIL_MLC=3Dy
+CONFIG_HP_SDC_MLC=3Dy
 
 #
 #  HIL device driver
 #
+CONFIG_HIL_KBD=3Dy
+CONFIG_HIL_PTR=3Dy
 
 #
 # Multimedia devices
@@ -677,7 +695,7 @@
 # CONFIG_BFS_FS is not set
 CONFIG_EXT3_FS=3Dy
 CONFIG_JBD=3Dy
-CONFIG_JBD_DEBUG=3Dy
+# CONFIG_JBD_DEBUG is not set
 CONFIG_FAT_FS=3Dm
 CONFIG_MSDOS_FS=3Dm
 # CONFIG_UMSDOS_FS is not set
@@ -691,7 +709,7 @@
 CONFIG_ISO9660_FS=3Dy
 CONFIG_JOLIET=3Dy
 # CONFIG_ZISOFS is not set
-CONFIG_JFS_FS=3Dy
+# CONFIG_JFS_FS is not set
 # CONFIG_JFS_DEBUG is not set
 # CONFIG_JFS_STATISTICS is not set
 CONFIG_MINIX_FS=3Dm
@@ -962,7 +980,7 @@
 # Kernel hacking
 #
 CONFIG_MAGIC_SYSRQ=3Dy
-# CONFIG_DEBUG_SPINLOCK is not set
+CONFIG_DEBUG_SPINLOCK=3Dy
 
 #
 # Library routines

Is somebody see what could be wrong (It would also help me for 2.5 with
which met the same pb a time ago)?

See you next year.

Thanks again ,
    Joel


*************************************************************************=
*******
Controlez mieux votre consommation Internet...surfez Tiscali Complete...h=
ttp://tiscali.complete.be
