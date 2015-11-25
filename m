From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Show more debug info about space registers and TLB
 configuration
Date: Wed, 25 Nov 2015 22:43:45 +0100
Message-ID: <20151125214345.GA1123@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index 7eb616e..451906d 100644
--- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -63,7 +63,7 @@ struct pdc_tlb_cf {		/* for PDC_CACHE (I/D-TLB's) */
 		tc_page : 1,	/* 0 = 2K page-size-machine, 1 = 4k page size */
 		tc_cst  : 3,	/* 0 = incoherent operations, else coherent operations */
 		tc_aid  : 5,	/* ITLB: width of access ids of processor (encoded!) */
-		tc_pad1 : 8;	/* ITLB: width of space-registers (encoded) */
+		tc_sr   : 8;	/* ITLB: width of space-registers (encoded) */
 };
 
 struct pdc_cache_info {		/* main-PDC_CACHE-structure (caches & TLB's) */
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index cda6dbb..32bc0bf 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -172,6 +172,24 @@ parisc_cache_init(void)
 		cache_info.ic_count,
 		cache_info.ic_loop);
 
+	printk("IT  base 0x%lx stride 0x%lx count 0x%lx loop 0x%lx off_base 0x%lx off_stride 0x%lx off_count 0x%lx\n",
+		cache_info.it_sp_base,
+		cache_info.it_sp_stride,
+		cache_info.it_sp_count,
+		cache_info.it_loop,
+		cache_info.it_off_base,
+		cache_info.it_off_stride,
+		cache_info.it_off_count);
+
+	printk("DT  base 0x%lx stride 0x%lx count 0x%lx loop 0x%lx off_base 0x%lx off_stride 0x%lx off_count 0x%lx\n",
+		cache_info.dt_sp_base,
+		cache_info.dt_sp_stride,
+		cache_info.dt_sp_count,
+		cache_info.dt_loop,
+		cache_info.dt_off_base,
+		cache_info.dt_off_stride,
+		cache_info.dt_off_count);
+
 	printk("ic_conf = 0x%lx  alias %d blk %d line %d shift %d\n",
 		*(unsigned long *) (&cache_info.ic_conf),
 		cache_info.ic_conf.cc_alias,
@@ -184,19 +202,19 @@ parisc_cache_init(void)
 		cache_info.ic_conf.cc_cst,
 		cache_info.ic_conf.cc_hv);
 
-	printk("D-TLB conf: sh %d page %d cst %d aid %d pad1 %d\n",
+	printk("D-TLB conf: sh %d page %d cst %d aid %d sr %d\n",
 		cache_info.dt_conf.tc_sh,
 		cache_info.dt_conf.tc_page,
 		cache_info.dt_conf.tc_cst,
 		cache_info.dt_conf.tc_aid,
-		cache_info.dt_conf.tc_pad1);
+		cache_info.dt_conf.tc_sr);
 
-	printk("I-TLB conf: sh %d page %d cst %d aid %d pad1 %d\n",
+	printk("I-TLB conf: sh %d page %d cst %d aid %d sr %d\n",
 		cache_info.it_conf.tc_sh,
 		cache_info.it_conf.tc_page,
 		cache_info.it_conf.tc_cst,
 		cache_info.it_conf.tc_aid,
-		cache_info.it_conf.tc_pad1);
+		cache_info.it_conf.tc_sr);
 #endif
 
 	split_tlb = 0;
