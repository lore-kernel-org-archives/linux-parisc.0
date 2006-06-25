From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 17/23] [PARISC] Match show_cache_info with
	reality
Date: Sun, 25 Jun 2006 19:34:45 -0400
Message-ID: <11512784931379-git-send-email-kyle@parisc-linux.org>
References: <20060625233123.GC2837@athena.road.mcmartin.ca>
Reply-To: Kyle McMartin <kyle@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060625233123.GC2837@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

show_cache_info and struct pdc_cache_cf were out of sync with
published documentation. Fix the reporting of cache associativity
and update the pdc_cache_cf bitfields to match documentation.

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

 arch/parisc/kernel/cache.c |   18 ++++++++++--------
 include/asm-parisc/pdc.h   |    4 ++--
 2 files changed, 12 insertions(+), 10 deletions(-)

9e474ed388eb542bf0948aced376f787fb2e26b9
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index c057ad7..851519c 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -97,15 +97,17 @@ update_mmu_cache(struct vm_area_struct *
 void
 show_cache_info(struct seq_file *m)
 {
+	char buf[32];
+
 	seq_printf(m, "I-cache\t\t: %ld KB\n", 
 		cache_info.ic_size/1024 );
-	seq_printf(m, "D-cache\t\t: %ld KB (%s%s, %d-way associative)\n", 
+	if (cache_info.dc_loop == 1)
+		snprintf(buf, 32, "%lu-way associative", cache_info.dc_loop);
+	seq_printf(m, "D-cache\t\t: %ld KB (%s%s, %s)\n",
 		cache_info.dc_size/1024,
 		(cache_info.dc_conf.cc_wt ? "WT":"WB"),
 		(cache_info.dc_conf.cc_sh ? ", shared I/D":""),
-		(cache_info.dc_conf.cc_assoc)
-	);
-
+		((cache_info.dc_loop == 1) ? "direct mapped" : buf));
 	seq_printf(m, "ITLB entries\t: %ld\n" "DTLB entries\t: %ld%s\n",
 		cache_info.it_size,
 		cache_info.dt_size,
@@ -158,11 +160,11 @@ #if 0
 		cache_info.dc_conf.cc_block,
 		cache_info.dc_conf.cc_line,
 		cache_info.dc_conf.cc_shift);
-	printk("	wt %d sh %d cst %d assoc %d\n",
+	printk("	wt %d sh %d cst %d hv %d\n",
 		cache_info.dc_conf.cc_wt,
 		cache_info.dc_conf.cc_sh,
 		cache_info.dc_conf.cc_cst,
-		cache_info.dc_conf.cc_assoc);
+		cache_info.dc_conf.cc_hv);
 
 	printk("IC  base 0x%lx stride 0x%lx count 0x%lx loop 0x%lx\n",
 		cache_info.ic_base,
@@ -176,11 +178,11 @@ #if 0
 		cache_info.ic_conf.cc_block,
 		cache_info.ic_conf.cc_line,
 		cache_info.ic_conf.cc_shift);
-	printk("	wt %d sh %d cst %d assoc %d\n",
+	printk("	wt %d sh %d cst %d hv %d\n",
 		cache_info.ic_conf.cc_wt,
 		cache_info.ic_conf.cc_sh,
 		cache_info.ic_conf.cc_cst,
-		cache_info.ic_conf.cc_assoc);
+		cache_info.ic_conf.cc_hv);
 
 	printk("D-TLB conf: sh %d page %d cst %d aid %d pad1 %d \n",
 		cache_info.dt_conf.tc_sh,
diff --git a/include/asm-parisc/pdc.h b/include/asm-parisc/pdc.h
index 7d8a71a..592f13b 100644
--- a/include/asm-parisc/pdc.h
+++ b/include/asm-parisc/pdc.h
@@ -352,8 +352,8 @@ #endif
 		cc_wt	: 1,	/* 0 = WT-Dcache, 1 = WB-Dcache */
 		cc_sh	: 2,	/* 0 = separate I/D-cache, else shared I/D-cache */
 		cc_cst  : 3,	/* 0 = incoherent D-cache, 1=coherent D-cache */
-		cc_pad1 : 5,	/* reserved */
-		cc_assoc: 8;	/* associativity of I/D-cache */
+		cc_pad1 : 10,	/* reserved */
+		cc_hv   : 3;	/* hversion dependent */
 };
 
 struct pdc_tlb_cf {		/* for PDC_CACHE (I/D-TLB's) */
-- 
1.3.3

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
