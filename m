From: Babu Moger <babu.moger@oracle.com>
Subject: [PATCH 1/2] arch: Fix duplicates in Kconfig for parisc and sparc
Date: Mon, 18 Sep 2017 10:53:28 -0600
Message-ID: <1505753609-602923-2-git-send-email-babu.moger@oracle.com>
References: <1505753609-602923-1-git-send-email-babu.moger@oracle.com>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-parisc@vger.kernel.org, babu.moger@oracle.com
To: monstr@monstr.eu, jejb@parisc-linux.org, deller@gmx.de,
        davem@davemloft.net, akpm@linux-foundation.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505753609-602923-1-git-send-email-babu.moger@oracle.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix duplicates for sparc and parisc. This was due these following commits.

1. commit 4c97a0c8fee3 ("arch: define CPU_BIG_ENDIAN for all fixed big
   endian archs")
2. commit 97d9f969161d ("arch/sparc: Define config parameter
   CPU_BIG_ENDIAN")
3. commit 74ad3d28af21 ("parisc: Define CONFIG_CPU_BIG_ENDIAN")

Remove duplicates.

Signed-off-by: Babu Moger <babu.moger@oracle.com>
---
 arch/parisc/Kconfig |    3 ---
 arch/sparc/Kconfig  |    3 ---
 2 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index ba7b7dd..1364851 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -59,9 +59,6 @@ config PARISC
 config CPU_BIG_ENDIAN
 	def_bool y
 
-config CPU_BIG_ENDIAN
-	def_bool y
-
 config MMU
 	def_bool y
 
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 0be3828..a4a6261 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -97,9 +97,6 @@ config ARCH_PROC_KCORE_TEXT
 config CPU_BIG_ENDIAN
 	def_bool y
 
-config CPU_BIG_ENDIAN
-	def_bool y
-
 config ARCH_ATU
 	bool
 	default y if SPARC64
-- 
1.7.1
