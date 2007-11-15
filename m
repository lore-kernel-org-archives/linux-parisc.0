From: Jiri Olsa <olsajiri@gmail.com>
Subject: [parisc-linux] [PATCH] alpha/parisc: Removing config variable
	DEBUG_RWLOCK
Date: Thu, 15 Nov 2007 09:42:05 +0100
Message-ID: <473C065D.1000000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: Andrew Morton <akpm@linux-foundation.org>,
 parisc-linux@parisc-linux.org,
 ink@jurassic.park.msu.ru,
 rth@twiddle.net
To: kernel-janitors@vger.kernel.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Removing config variable DEBUG_RWLOCK, since it is not used

Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
---
 arch/alpha/Kconfig.debug           |    9 ---------
 arch/alpha/defconfig               |    1 -
 arch/parisc/Kconfig.debug          |    9 ---------
 arch/parisc/configs/a500_defconfig |    1 -
 4 files changed, 0 insertions(+), 20 deletions(-)

diff --git a/arch/alpha/Kconfig.debug b/arch/alpha/Kconfig.debug
index f45f28c..3f6265f 100644
--- a/arch/alpha/Kconfig.debug
+++ b/arch/alpha/Kconfig.debug
@@ -7,15 +7,6 @@ config EARLY_PRINTK
 	depends on ALPHA_GENERIC || ALPHA_SRM
 	default y
 
-config DEBUG_RWLOCK
-	bool "Read-write spinlock debugging"
-	depends on DEBUG_KERNEL
-	help
-	  If you say Y here then read-write lock processing will count how many
-	  times it has tried to get the lock and issue an error message after
-	  too many attempts.  If you suspect a rwlock problem or a kernel
-	  hacker asks for this option then say Y.  Otherwise say N.
-
 config ALPHA_LEGACY_START_ADDRESS
 	bool "Legacy kernel start address"
 	depends on ALPHA_GENERIC
diff --git a/arch/alpha/defconfig b/arch/alpha/defconfig
index 6da9c3d..e43f68f 100644
--- a/arch/alpha/defconfig
+++ b/arch/alpha/defconfig
@@ -882,7 +882,6 @@ CONFIG_MAGIC_SYSRQ=y
 # CONFIG_DEBUG_SPINLOCK is not set
 CONFIG_DEBUG_INFO=y
 CONFIG_EARLY_PRINTK=y
-# CONFIG_DEBUG_RWLOCK is not set
 # CONFIG_DEBUG_SEMAPHORE is not set
 CONFIG_ALPHA_LEGACY_START_ADDRESS=y
 CONFIG_MATHEMU=y
diff --git a/arch/parisc/Kconfig.debug b/arch/parisc/Kconfig.debug
index 9166bd1..bc989e5 100644
--- a/arch/parisc/Kconfig.debug
+++ b/arch/parisc/Kconfig.debug
@@ -2,15 +2,6 @@ menu "Kernel hacking"
 
 source "lib/Kconfig.debug"
 
-config DEBUG_RWLOCK
-        bool "Read-write spinlock debugging"
-        depends on DEBUG_KERNEL && SMP
-        help
-          If you say Y here then read-write lock processing will count how many
-          times it has tried to get the lock and issue an error message after
-          too many attempts.  If you suspect a rwlock problem or a kernel
-          hacker asks for this option then say Y.  Otherwise say N.
