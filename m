From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix commit 63379c1 parisc: implement full version of
 access_ok()
Date: Sun, 17 Nov 2013 21:56:38 +0100
Message-ID: <20131117205638.GA2852@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit 63379c1 parisc: implement full version of access_ok() was incomplete and
broke userspace. Fix it by checking if we really write to userspace.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index 63f4dd0..228fecb 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -45,7 +45,11 @@ static inline int __range_not_ok(unsigned long addr, unsigned long size,
 				 unsigned long limit)
 {
 	unsigned long __newaddr = addr + size;
-	return (__newaddr < addr || __newaddr > limit || size > limit);
+
+	if (segment_eq(get_fs(), KERNEL_DS))
+		return 0;
+
+	return (addr < PAGE_SIZE || __newaddr > limit || size > limit);
 }
 
 /**
