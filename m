From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: always detect multiple physical ranges
Date: Sun, 3 Feb 2013 00:42:25 +0100
Message-ID: <20130202234225.GB1188@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch unbreaks the current logic in that way, that even if
CONFIG_DISCONTIGMEM isn't set, the user may be informed, that he should turn on
CONFIG_DISCONTIGMEM for his machine.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/arch/parisc/include/asm/mmzone.h b/arch/parisc/include/asm/mmzone.h
index e67eb9c..31835b9 100644
--- a/arch/parisc/include/asm/mmzone.h
+++ b/arch/parisc/include/asm/mmzone.h
@@ -1,9 +1,10 @@
 #ifndef _PARISC_MMZONE_H
 #define _PARISC_MMZONE_H
 
+#define MAX_PHYSMEM_RANGES 8 /* Fix the size for now (current known max is 3) */
+
 #ifdef CONFIG_DISCONTIGMEM
 
-#define MAX_PHYSMEM_RANGES 8 /* Fix the size for now (current known max is 3) */
 extern int npmem_ranges;
 
 struct node_map_data {
@@ -60,7 +61,5 @@ static inline int pfn_valid(int pfn)
 	return 0;
 }
 
-#else /* !CONFIG_DISCONTIGMEM */
-#define MAX_PHYSMEM_RANGES 	1 
 #endif
 #endif /* _PARISC_MMZONE_H */
