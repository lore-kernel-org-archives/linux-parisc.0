From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: enable DEVTMPFS and DEVTMPFS_MOUNT in defconfigs
Date: Mon, 14 Oct 2013 22:55:36 +0200
Message-ID: <20131014205536.GA5389@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Latest udev version requires that DEVTMPFS and DEVTMPFS_MOUNT are
enabled, else initrd will fail to find root filesystem.
While touching those configs, unify a few other options, e.g.
disable CONFIG_IP_PNP_DHCP and enable CONFIG_BLK_DEV_INITRD.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/configs/712_defconfig b/arch/parisc/configs/712_defconfig
index 0f90569..39b680a 100644
--- a/arch/parisc/configs/712_defconfig
+++ b/arch/parisc/configs/712_defconfig
@@ -28,7 +28,6 @@ CONFIG_NET_KEY=m
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_INET_AH=m
 CONFIG_INET_ESP=m
@@ -40,6 +39,8 @@ CONFIG_IP_NF_QUEUE=m
 CONFIG_LLC2=m
 CONFIG_NET_PKTGEN=m
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 CONFIG_PARPORT=y
diff --git a/arch/parisc/configs/a500_defconfig b/arch/parisc/configs/a500_defconfig
index b647b18..51cc316 100644
--- a/arch/parisc/configs/a500_defconfig
+++ b/arch/parisc/configs/a500_defconfig
@@ -38,7 +38,6 @@ CONFIG_NET_KEY=m
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_INET_AH=m
 CONFIG_INET_ESP=m
@@ -79,6 +78,8 @@ CONFIG_IP_DCCP=m
 CONFIG_LLC2=m
 CONFIG_NET_PKTGEN=m
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 CONFIG_BLK_DEV_UMEM=m
diff --git a/arch/parisc/configs/b180_defconfig b/arch/parisc/configs/b180_defconfig
index e289f5b..f1a0c25 100644
--- a/arch/parisc/configs/b180_defconfig
+++ b/arch/parisc/configs/b180_defconfig
@@ -4,6 +4,7 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_SYSFS_DEPRECATED_V2=y
+CONFIG_BLK_DEV_INITRD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODVERSIONS=y
@@ -27,6 +28,8 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_LRO is not set
 CONFIG_IPV6=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 CONFIG_PARPORT=y
 CONFIG_PARPORT_PC=y
diff --git a/arch/parisc/configs/c3000_defconfig b/arch/parisc/configs/c3000_defconfig
index 311ca36..ec1b014 100644
--- a/arch/parisc/configs/c3000_defconfig
+++ b/arch/parisc/configs/c3000_defconfig
@@ -5,6 +5,7 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_SYSFS_DEPRECATED_V2=y
+CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
@@ -39,6 +40,8 @@ CONFIG_NETFILTER_DEBUG=y
 CONFIG_IP_NF_QUEUE=m
 CONFIG_NET_PKTGEN=m
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 CONFIG_BLK_DEV_UMEM=m
diff --git a/arch/parisc/configs/c8000_defconfig b/arch/parisc/configs/c8000_defconfig
index f110063..6d3852f 100644
--- a/arch/parisc/configs/c8000_defconfig
+++ b/arch/parisc/configs/c8000_defconfig
@@ -42,9 +42,7 @@ CONFIG_NET_KEY=m
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
-CONFIG_IP_PNP_RARP=y
 CONFIG_NET_IPIP=m
 CONFIG_IP_MROUTE=y
 CONFIG_IP_PIMSM_V1=y
@@ -62,6 +60,8 @@ CONFIG_TIPC=m
 CONFIG_LLC2=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
 CONFIG_PARPORT=y
 CONFIG_PARPORT_PC=y
@@ -197,16 +197,12 @@ CONFIG_USB=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
-CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT3_FS=y
 # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
 CONFIG_EXT4_FS=m
 CONFIG_REISERFS_FS=m
 CONFIG_REISERFS_PROC_INFO=y
 CONFIG_XFS_FS=m
-CONFIG_XFS_POSIX_ACL=y
 CONFIG_QUOTA=y
 CONFIG_QFMT_V1=m
 CONFIG_QFMT_V2=m
@@ -218,7 +214,6 @@ CONFIG_MSDOS_FS=m
 CONFIG_VFAT_FS=m
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
-CONFIG_TMPFS_XATTR=y
 CONFIG_NFS_FS=m
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_CODEPAGE_737=m
diff --git a/arch/parisc/configs/default_defconfig b/arch/parisc/configs/default_defconfig
index dfe88f6..697f409 100644
--- a/arch/parisc/configs/default_defconfig
+++ b/arch/parisc/configs/default_defconfig
@@ -37,7 +37,6 @@ CONFIG_NET_KEY=m
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_INET_AH=m
 CONFIG_INET_ESP=m
@@ -49,6 +48,8 @@ CONFIG_INET6_ESP=y
 CONFIG_INET6_IPCOMP=y
 CONFIG_LLC2=m
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
 CONFIG_PARPORT=y
