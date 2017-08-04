From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add MADV_HWPOISON and MADV_SOFT_OFFLINE
Date: Fri, 4 Aug 2017 20:07:41 +0200
Message-ID: <20170804180741.GA29755@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add the missing MADV_HWPOISON (100) and MADV_SOFT_OFFLINE (101) defines which
are needed for an upcoming patch which adds page-deallocation for parisc.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
index 5979745..2e7b8c2 100644
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -60,6 +60,9 @@
 					   overrides the coredump filter bits */
 #define MADV_DODUMP	70		/* Clear the MADV_NODUMP flag */
 
+#define MADV_HWPOISON     100		/* poison a page for testing */
+#define MADV_SOFT_OFFLINE 101		/* soft offline page for testing */
+
 /* compatibility flags */
 #define MAP_FILE	0
 #define MAP_VARIABLE	0
diff --git a/tools/arch/parisc/include/uapi/asm/mman.h b/tools/arch/parisc/include/uapi/asm/mman.h
index 03d8d5b..286c0bd 100644
--- a/tools/arch/parisc/include/uapi/asm/mman.h
+++ b/tools/arch/parisc/include/uapi/asm/mman.h
@@ -36,9 +36,7 @@
 #define PROT_READ	0x1
 #define PROT_SEM	0x8
 #define PROT_WRITE	0x2
-/* MADV_HWPOISON is undefined on parisc, fix it for perf */
 #define MADV_HWPOISON	100
-/* MADV_SOFT_OFFLINE is undefined on parisc, fix it for perf */
 #define MADV_SOFT_OFFLINE 101
 /* MAP_32BIT is undefined on parisc, fix it for perf */
 #define MAP_32BIT	0
