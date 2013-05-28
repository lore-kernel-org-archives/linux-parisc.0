From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix kernel BUG at arch/parisc/include/asm/mmzone.h:50
Date: Tue, 28 May 2013 22:35:54 +0200
Message-ID: <20130528203554.GA18344@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

With CONFIG_DISCONTIGMEM=y and multiple physical memory areas,
cat /proc/kpageflags triggers this kernel bug:

kernel BUG at arch/parisc/include/asm/mmzone.h:50!
CPU: 2 PID: 7848 Comm: cat Tainted: G      D W 3.10.0-rc3-64bit #44
 IAOQ[0]: kpageflags_read0x128/0x238
 IAOQ[1]: kpageflags_read0x12c/0x238
 RP(r2): proc_reg_read0xbc/0x130
Backtrace:
 [<00000000402ca2d4>] proc_reg_read0xbc/0x130
 [<0000000040235bcc>] vfs_read0xc4/0x1d0
 [<0000000040235f0c>] SyS_read0x94/0xf0
 [<0000000040105fc0>] syscall_exit0x0/0x14

kpageflags_read() walks through the whole memory, even if some memory
areas are physically not available. So, we should better not BUG on an
unavailable pfn in pfn_to_nid() but just return the expected value -1 or
0.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/mmzone.h b/arch/parisc/include/asm/mmzone.h
index 0e625ab..cc50d33 100644
--- a/arch/parisc/include/asm/mmzone.h
+++ b/arch/parisc/include/asm/mmzone.h
@@ -39,17 +39,14 @@ extern unsigned char pfnnid_map[PFNNID_MAP_MAX];
 static inline int pfn_to_nid(unsigned long pfn)
 {
 	unsigned int i;
-	unsigned char r;
 
 	if (unlikely(pfn_is_io(pfn)))
 		return 0;
 
 	i = pfn >> PFNNID_SHIFT;
 	BUG_ON(i >= ARRAY_SIZE(pfnnid_map));
-	r = pfnnid_map[i];
-	BUG_ON(r == 0xff);
 
-	return (int)r;
+	return (int)pfnnid_map[i];
 }
 
 static inline int pfn_valid(int pfn)
