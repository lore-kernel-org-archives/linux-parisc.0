From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH] parisc: defconfig: Cleanup from old Kconfig options
Date: Thu, 20 Jul 2017 07:00:13 +0200
Message-ID: <1500526814-3900-1-git-send-email-krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Remove old, dead Kconfig options (in order appearing in this commit):
 - EXPERIMENTAL is gone since v3.9;
 - INET_LRO: commit 7bbf3cae65b6 ("ipv4: Remove inet_lro library");
 - IP_NF_QUEUE: commit 3dd6664fac7e ("netfilter: remove unused "config
   IP_NF_QUEUE"");
 - VIDEO_OUTPUT_CONTROL: commit f167a64e9d67 ("video / output: Drop
   display output class support");
 - RCU_CPU_STALL_DETECTOR: commit a00e0d714fbd ("rcu: Remove conditional
   compilation for RCU CPU stall warnings");
 - IP_NF_TARGET_ULOG: commit d4da843e6fad ("netfilter: kill remnants of
   ulog targets");
 - IP6_NF_TARGET_LOG: commit 6939c33a757b ("netfilter: merge ipt_LOG and
   ip6_LOG into xt_LOG");
 - AUTOFS_FS: commit 561c5cf9236a ("staging: Remove autofs3");

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/parisc/configs/712_defconfig           | 5 -----
 arch/parisc/configs/a500_defconfig          | 6 ------
 arch/parisc/configs/b180_defconfig          | 3 ---
 arch/parisc/configs/c3000_defconfig         | 5 -----
 arch/parisc/configs/default_defconfig       | 5 -----
 arch/parisc/configs/generic-32bit_defconfig | 2 --
 6 files changed, 26 deletions(-)

diff --git a/arch/parisc/configs/712_defconfig b/arch/parisc/configs/712_defconfig
index 143d02652792..493e03c2a219 100644
--- a/arch/parisc/configs/712_defconfig
+++ b/arch/parisc/configs/712_defconfig
@@ -1,4 +1,3 @@
-CONFIG_EXPERIMENTAL=y
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
@@ -32,11 +31,9 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_INET_AH=m
 CONFIG_INET_ESP=m
-# CONFIG_INET_LRO is not set
 CONFIG_INET_DIAG=m
 # CONFIG_IPV6 is not set
 CONFIG_NETFILTER=y
-CONFIG_IP_NF_QUEUE=m
 CONFIG_LLC2=m
 CONFIG_NET_PKTGEN=m
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
@@ -94,7 +91,6 @@ CONFIG_PPDEV=m
 # CONFIG_HW_RANDOM is not set
 CONFIG_RAW_DRIVER=y
 # CONFIG_HWMON is not set
-CONFIG_VIDEO_OUTPUT_CONTROL=m
 CONFIG_FB=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_TILEBLITTING=y
@@ -181,7 +177,6 @@ CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_MUTEXES=y
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
 CONFIG_CRYPTO_NULL=m
 CONFIG_CRYPTO_TEST=m
 CONFIG_CRYPTO_HMAC=y
diff --git a/arch/parisc/configs/a500_defconfig b/arch/parisc/configs/a500_defconfig
index 1a4f776b49b8..8d67e2373920 100644
--- a/arch/parisc/configs/a500_defconfig
+++ b/arch/parisc/configs/a500_defconfig
@@ -1,4 +1,3 @@
-CONFIG_EXPERIMENTAL=y
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
@@ -43,21 +42,18 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_INET_AH=m
 CONFIG_INET_ESP=m
-# CONFIG_INET_LRO is not set
 CONFIG_INET6_AH=m
 CONFIG_INET6_ESP=m
 CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_NETFILTER=y
 # CONFIG_NETFILTER_XT_MATCH_DCCP is not set
-CONFIG_IP_NF_QUEUE=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_TARGET_LOG=m
-CONFIG_IP_NF_TARGET_ULOG=m
 CONFIG_IP_NF_MANGLE=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_RAW=m
@@ -70,7 +66,6 @@ CONFIG_IP6_NF_MATCH_OPTS=m
 CONFIG_IP6_NF_MATCH_HL=m
 CONFIG_IP6_NF_MATCH_IPV6HEADER=m
 CONFIG_IP6_NF_MATCH_RT=m
-CONFIG_IP6_NF_TARGET_LOG=m
 CONFIG_IP6_NF_FILTER=m
 CONFIG_IP6_NF_TARGET_REJECT=m
 CONFIG_IP6_NF_MANGLE=m
@@ -192,7 +187,6 @@ CONFIG_DEBUG_FS=y
 CONFIG_HEADERS_CHECK=y
 CONFIG_DEBUG_KERNEL=y
 # CONFIG_DEBUG_BUGVERBOSE is not set
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
 CONFIG_CRYPTO_NULL=m
 CONFIG_CRYPTO_TEST=m
 CONFIG_CRYPTO_HMAC=y
diff --git a/arch/parisc/configs/b180_defconfig b/arch/parisc/configs/b180_defconfig
index f1a0c25bef8d..0eca8208591c 100644
--- a/arch/parisc/configs/b180_defconfig
+++ b/arch/parisc/configs/b180_defconfig
@@ -25,7 +25,6 @@ CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_BOOTP=y
-# CONFIG_INET_LRO is not set
 CONFIG_IPV6=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
@@ -71,7 +70,6 @@ CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_PRINTER=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-CONFIG_VIDEO_OUTPUT_CONTROL=m
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
@@ -105,6 +103,5 @@ CONFIG_NLS_UTF8=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_HEADERS_CHECK=y
 CONFIG_DEBUG_KERNEL=y
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
 CONFIG_SECURITY=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
diff --git a/arch/parisc/configs/c3000_defconfig b/arch/parisc/configs/c3000_defconfig
index 8e8f0e34f817..8337f5adf414 100644
--- a/arch/parisc/configs/c3000_defconfig
+++ b/arch/parisc/configs/c3000_defconfig
@@ -1,4 +1,3 @@
-CONFIG_EXPERIMENTAL=y
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
 CONFIG_IKCONFIG=y
@@ -31,13 +30,11 @@ CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_BOOTP=y
-# CONFIG_INET_LRO is not set
 # CONFIG_INET_DIAG is not set
 CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_NETFILTER=y
 CONFIG_NETFILTER_DEBUG=y
-CONFIG_IP_NF_QUEUE=m
 CONFIG_NET_PKTGEN=m
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
@@ -111,7 +108,6 @@ CONFIG_SERIAL_8250_SHARE_IRQ=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_RAW_DRIVER=y
 # CONFIG_HWMON is not set
-CONFIG_VIDEO_OUTPUT_CONTROL=m
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
@@ -165,7 +161,6 @@ CONFIG_HEADERS_CHECK=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_MUTEXES=y
 # CONFIG_DEBUG_BUGVERBOSE is not set
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
 CONFIG_CRYPTO_NULL=m
 CONFIG_CRYPTO_TEST=m
 CONFIG_CRYPTO_MD5=m
diff --git a/arch/parisc/configs/default_defconfig b/arch/parisc/configs/default_defconfig
index 310b6657e4ac..e28e3acbdff3 100644
--- a/arch/parisc/configs/default_defconfig
+++ b/arch/parisc/configs/default_defconfig
@@ -1,4 +1,3 @@
-CONFIG_EXPERIMENTAL=y
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
@@ -41,7 +40,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_INET_AH=m
 CONFIG_INET_ESP=m
-# CONFIG_INET_LRO is not set
 CONFIG_INET_DIAG=m
 CONFIG_IPV6=y
 CONFIG_INET6_AH=y
@@ -114,7 +112,6 @@ CONFIG_PRINTER=m
 CONFIG_PPDEV=m
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-CONFIG_VIDEO_OUTPUT_CONTROL=m
 CONFIG_FB=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_TILEBLITTING=y
@@ -151,7 +148,6 @@ CONFIG_USB_UHCI_HCD=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 # CONFIG_EXT3_FS_XATTR is not set
-CONFIG_AUTOFS_FS=y
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_VFAT_FS=y
@@ -209,7 +205,6 @@ CONFIG_DEBUG_FS=y
 CONFIG_HEADERS_CHECK=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_MUTEXES=y
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
 CONFIG_KEYS=y
 CONFIG_CRYPTO_NULL=m
 CONFIG_CRYPTO_TEST=m
diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/configs/generic-32bit_defconfig
index 8688ba7f5966..80aa10a9016e 100644
--- a/arch/parisc/configs/generic-32bit_defconfig
+++ b/arch/parisc/configs/generic-32bit_defconfig
@@ -49,7 +49,6 @@ CONFIG_INET_ESP=m
 # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
 CONFIG_INET_DIAG=m
 CONFIG_LLC2=m
 # CONFIG_WIRELESS is not set
@@ -152,7 +151,6 @@ CONFIG_I2C=y
 CONFIG_POWER_SUPPLY=y
 # CONFIG_HWMON is not set
 CONFIG_AGP=y
-CONFIG_VIDEO_OUTPUT_CONTROL=y
 CONFIG_FB=y
 CONFIG_FB_FOREIGN_ENDIAN=y
 CONFIG_FB_MODE_HELPERS=y
-- 
2.7.4
