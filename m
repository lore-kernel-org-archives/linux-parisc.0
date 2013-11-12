From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: size_t is unsigned, so comparison size < 0 doesn't
 make sense.
Date: Tue, 12 Nov 2013 21:01:24 +0100
Message-ID: <20131112200124.GA1438@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mikulas Patocka <mpatocka@redhat.com>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>
CC: Mikulas Patocka <mpatocka@redhat.com>

diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index b5507ec..32f0303 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -529,7 +529,7 @@ long probe_kernel_read(void *dst, const void *src, size_t size)
 {
 	unsigned long addr = (unsigned long)src;
 
-	if (size < 0 || addr < PAGE_SIZE)
+	if (addr < PAGE_SIZE)
 		return -EFAULT;
 
 	/* check for I/O space F_EXTEND(0xfff00000) access as well? */
