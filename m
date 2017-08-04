From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Drop MADV_SPACEAVAIL, MADV_VPS_PURGE and
 MADV_VPS_INHERIT
Date: Fri, 4 Aug 2017 21:32:41 +0200
Message-ID: <20170804193241.GA17917@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Those aren't used or implemented anywhere in Linux.

Furthermore, MADV_SPACEAVAIL seems to be a HP-UX related flag which is
implemented as null operation in HP-UX. And since we don't support running
HP-UX binaries there is no need to keep it.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
index 2e7b8c2..9a9c2fe 100644
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -40,9 +40,6 @@
 #define MADV_SEQUENTIAL 2               /* expect sequential page references */
 #define MADV_WILLNEED   3               /* will need these pages */
 #define MADV_DONTNEED   4               /* don't need these pages */
-#define MADV_SPACEAVAIL 5               /* insure that resources are reserved */
-#define MADV_VPS_PURGE  6               /* Purge pages from VM page cache */
-#define MADV_VPS_INHERIT 7              /* Inherit parents page size */
 
 /* common/generic parameters */
 #define MADV_FREE	8		/* free pages only if memory pressure */
