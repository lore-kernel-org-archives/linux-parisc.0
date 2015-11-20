From: Helge Deller <deller@gmx.de>
Subject: [PATCH 3/9] parisc: Fix asm/mman.h regarding MAP_HUGETLB and MADV_XX flags
Date: Fri, 20 Nov 2015 22:38:36 +0100
Message-ID: <1448055522-11594-4-git-send-email-deller@gmx.de>
References: <1448055522-11594-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	stable@vger.kernel.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1448055522-11594-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On parisc we have up to now never supported Huge Pages, even glibc did
not defined MAP_HUGETLB for parisc. Since the Huge Page support is being
added now, clean up existing definitions for MAP_HUGETLB and friends.

Drop lots of MADV_xxK_PAGES flags, which were never used and were
designed for a patch which was never integrated into the Linux
kernel. Instead move other MADV_ flags to make them more compatible to
other linux architectures.

Cc: stable@vger.kernel.org
Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/uapi/asm/mman.h | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
index 294d251..9ac77f1 100644
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -19,11 +19,12 @@
 #define MAP_EXECUTABLE	0x1000		/* mark it as an executable */
 #define MAP_LOCKED	0x2000		/* pages are locked */
 #define MAP_NORESERVE	0x4000		/* don't check for reservations */
-#define MAP_GROWSDOWN	0x8000		/* stack-like segment */
+#define MAP_GROWSDOWN	0x8000		/* x86 stack-like segment */
 #define MAP_POPULATE	0x10000		/* populate (prefault) pagetables */
 #define MAP_NONBLOCK	0x20000		/* do not block on IO */
-#define MAP_STACK	0x40000		/* give out an address that is best suited for process/thread stacks */
-#define MAP_HUGETLB	0x80000		/* create a huge page mapping */
+#define MAP_HUGETLB	0x40000		/* create a huge page mapping */
+#define MAP_GROWSUP	0x80000		/* parisc stack-like segment */
+#define MAP_STACK	MAP_GROWSUP	/* give out an address that is best suited for process/thread stacks */
 
 #define MS_SYNC		1		/* synchronous memory sync */
 #define MS_ASYNC	2		/* sync memory asynchronously */
@@ -46,25 +47,15 @@
 #define MADV_DONTFORK	10		/* don't inherit across fork */
 #define MADV_DOFORK	11		/* do inherit across fork */
 
-/* The range 12-64 is reserved for page size specification. */
-#define MADV_4K_PAGES   12              /* Use 4K pages  */
-#define MADV_16K_PAGES  14              /* Use 16K pages */
-#define MADV_64K_PAGES  16              /* Use 64K pages */
-#define MADV_256K_PAGES 18              /* Use 256K pages */
-#define MADV_1M_PAGES   20              /* Use 1 Megabyte pages */
-#define MADV_4M_PAGES   22              /* Use 4 Megabyte pages */
-#define MADV_16M_PAGES  24              /* Use 16 Megabyte pages */
-#define MADV_64M_PAGES  26              /* Use 64 Megabyte pages */
+#define MADV_MERGEABLE   12		/* KSM may merge identical pages */
+#define MADV_UNMERGEABLE 13		/* KSM may not merge identical pages */
 
-#define MADV_MERGEABLE   65		/* KSM may merge identical pages */
-#define MADV_UNMERGEABLE 66		/* KSM may not merge identical pages */
+#define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
+#define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
 
-#define MADV_HUGEPAGE	67		/* Worth backing with hugepages */
-#define MADV_NOHUGEPAGE	68		/* Not worth backing with hugepages */
