From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix kernel BUG at
 arch/parisc/include/asm/mmzone.h:50 (part 2)
Date: Wed, 5 Jun 2013 22:50:01 +0200
Message-ID: <20130605205001.GA2769@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Make sure that we really return -1 (instead of 0x00ff) as node id for
page frame numbers which are not physically available.

This finally fixes the kernel panic when running
cat /proc/kpageflags /proc/kpagecount.

Theoretically this patch now limits the number of physical memory ranges
to 127 instead of 254, but currently we have MAX_PHYSMEM_RANGES
hardcoded to 8 which is sufficient for all existing parisc machines.
    
Signed-off-by: Helge Deller <deller@gmx.de

diff --git a/arch/parisc/include/asm/mmzone.h b/arch/parisc/include/asm/mmzone.h
index cc50d33..b6b34a0 100644
--- a/arch/parisc/include/asm/mmzone.h
+++ b/arch/parisc/include/asm/mmzone.h
@@ -27,7 +27,7 @@ extern struct node_map_data node_data[];
 
 #define PFNNID_SHIFT (30 - PAGE_SHIFT)
 #define PFNNID_MAP_MAX  512     /* support 512GB */
-extern unsigned char pfnnid_map[PFNNID_MAP_MAX];
+extern signed char pfnnid_map[PFNNID_MAP_MAX];
 
 #ifndef CONFIG_64BIT
 #define pfn_is_io(pfn) ((pfn & (0xf0000000UL >> PAGE_SHIFT)) == (0xf0000000UL >> PAGE_SHIFT))
@@ -46,7 +46,7 @@ static inline int pfn_to_nid(unsigned long pfn)
 	i = pfn >> PFNNID_SHIFT;
 	BUG_ON(i >= ARRAY_SIZE(pfnnid_map));
 
-	return (int)pfnnid_map[i];
+	return pfnnid_map[i];
 }
 
 static inline int pfn_valid(int pfn)
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 1c96564..505b56c 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -47,7 +47,7 @@ pte_t pg0[PT_INITIAL * PTRS_PER_PTE] __attribute__ ((__section__ (".data..vm0.pt
 
 #ifdef CONFIG_DISCONTIGMEM
 struct node_map_data node_data[MAX_NUMNODES] __read_mostly;
-unsigned char pfnnid_map[PFNNID_MAP_MAX] __read_mostly;
+signed char pfnnid_map[PFNNID_MAP_MAX] __read_mostly;
 #endif
 
 static struct resource data_resource = {
