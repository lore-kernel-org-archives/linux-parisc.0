From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PA8800/ZX1 support committed to 2.6.7-rc2-pa2
Date: Thu, 10 Jun 2004 23:58:19 -0600
Message-ID: <20040611055819.GA32005@colo.lackof.org>
References: <20040604202546.GC18574@colo.lackof.org>
	<20040605065126.GA28343@colo.lackof.org>
	<1086444652.1999.20.camel@mulgrave>
	<20040605210515.GA8098@colo.lackof.org>
	<1086470366.1999.36.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1086470366.1999.36.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 05, 2004 at 04:19:24PM -0500, James Bottomley wrote:
> The pa8800 only has a 750k/750k VIPT cache, that's smaller than my
> raven.  The 32M L2 cache is PIPT, which doesn't suffer from aliasing or
> address remapping effects---in fact, the PA engineers probably arranged
> for a fdc not to flush it because there's no point; the only coherency
> problems the PIPT cache has is with I/O, which is supposed to be fully
> coherent in the ZX1, isn't it.  Thus, we'd only pick up a caching
> problems like you describe from the VIPT caches.


Well, I talked to another HP engineer who deals with this stuff
more than I do and came away with some observations:

1) values returned from the PDC_CACHE_INFO call (stride, block, loop)
   are supposed to be "universal" - ie apply to all levels of cache.
   The values are intended to work in the "architected cache flush loop".
   Does that only apply for the FDCE loop?
   What about FDC/FIC loops?


2) values from the C8000 prototype could be wrong. Output and diff
   are appended below. Basically it's telling me to traverse
   the entire 32MB cache with 128 byte stride.

3) I'm not sure if loop=1 indicates 2-way associative or direct mapped.
   I expect direct mapped.  I need to re-read the docs.
   Maybe someone knows? jsm?


Console output from debug info I enabled/added:
| model 9000/785/C8000
| ic_size 2000000 dc_size 2000000 it_size f0
| DC  base 0x0 stride 0x80 count 0x40000 loop 0x1
| dc_conf = 0x1882000  alias 0 blk 1 line 4 shift 1
|         wt 0 sh 0 cst 1 assoc 0
| IC  base 0x0 stride 0x80 count 0x40000 loop 0x1
| ic_conf = 0x1882000  alias 0 blk 1 line 4 shift 1
|         wt 0 sh 0 cst 1 assoc 0
| D-TLB conf: sh 3 page 1 cst 1 aid 0 pad1 0
| I-TLB conf: sh 3 page 1 cst 1 aid 3 pad1 0
| dcache_stride 128   icache_stride 128
| parisc_cache_init: Only equivalent aliasing supported!


The difference between D-TLB and I-TLB was interesting but
I don't know what to make of it.

I noticed HPUX was calculating the stride differently than
parisc-linux. I didn't realize until later the difference
could be due to older/newer firmware versions and/or differences
in the "architected loop" initialization.

Changing "4 + cnf.cc_shift" (stride=128) to "3 + cnf.cc_shift"
(stride=64) didn't help. This implies the stride is not the problem.

grant


Index: arch/parisc/kernel/cache.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/cache.c,v
retrieving revision 1.17
diff -u -p -r1.17 cache.c
--- arch/parisc/kernel/cache.c	30 May 2004 18:57:23 -0000	1.17
+++ arch/parisc/kernel/cache.c	11 Jun 2004 05:33:38 -0000
@@ -123,47 +123,56 @@ parisc_cache_init(void)
 	if (pdc_cache_info(&cache_info) < 0)
 		panic("parisc_cache_init: pdc_cache_info failed");
 
-#if 0
-	printk(KERN_DEBUG "ic_size %lx dc_size %lx it_size %lx pdc_cache_info %d*long pdc_cache_cf %d\n",
-	    cache_info.ic_size,
-	    cache_info.dc_size,
-	    cache_info.it_size,
-	    sizeof (struct pdc_cache_info) / sizeof (long),
-	    sizeof (struct pdc_cache_cf)
-	);
-
-	printk(KERN_DEBUG "dc base %x dc stride %x dc count %x dc loop %d\n",
-	    cache_info.dc_base,
-	    cache_info.dc_stride,
-	    cache_info.dc_count,
-	    cache_info.dc_loop);
-
-	printk(KERN_DEBUG "dc conf: alias %d block %d line %d wt %d sh %d cst %d assoc %d\n",
-	    cache_info.dc_conf.cc_alias,
-	    cache_info.dc_conf.cc_block,
-	    cache_info.dc_conf.cc_line,
-	    cache_info.dc_conf.cc_wt,
-	    cache_info.dc_conf.cc_sh,
-	    cache_info.dc_conf.cc_cst,
-	    cache_info.dc_conf.cc_assoc);
-
-	printk(KERN_DEBUG "ic conf: alias %d block %d line %d wt %d sh %d cst %d assoc %d\n",
-	    cache_info.ic_conf.cc_alias,
-	    cache_info.ic_conf.cc_block,
-	    cache_info.ic_conf.cc_line,
-	    cache_info.ic_conf.cc_wt,
-	    cache_info.ic_conf.cc_sh,
-	    cache_info.ic_conf.cc_cst,
-	    cache_info.ic_conf.cc_assoc);
+#if 1
+	printk("ic_size %lx dc_size %lx it_size %lx\n",
+		cache_info.ic_size,
+		cache_info.dc_size,
+		cache_info.it_size);
+
+	printk("DC  base 0x%lx stride 0x%lx count 0x%lx loop 0x%lx\n",
+		cache_info.dc_base,
+		cache_info.dc_stride,
+		cache_info.dc_count,
+		cache_info.dc_loop);
+
+	printk("dc_conf = 0x%lx  alias %d blk %d line %d shift %d\n",
+		*(unsigned long *) (&cache_info.dc_conf),
+		cache_info.dc_conf.cc_alias,
+		cache_info.dc_conf.cc_block,
+		cache_info.dc_conf.cc_line,
+		cache_info.dc_conf.cc_shift);
+	printk("	wt %d sh %d cst %d assoc %d\n",
+		cache_info.dc_conf.cc_wt,
+		cache_info.dc_conf.cc_sh,
+		cache_info.dc_conf.cc_cst,
+		cache_info.dc_conf.cc_assoc);
+
+	printk("IC  base 0x%lx stride 0x%lx count 0x%lx loop 0x%lx\n",
+		cache_info.ic_base,
+		cache_info.ic_stride,
+		cache_info.ic_count,
+		cache_info.ic_loop);
+
+	printk("ic_conf = 0x%lx  alias %d blk %d line %d shift %d\n",
+		*(unsigned long *) (&cache_info.ic_conf),
+		cache_info.ic_conf.cc_alias,
+		cache_info.ic_conf.cc_block,
+		cache_info.ic_conf.cc_line,
+		cache_info.ic_conf.cc_shift);
+	printk("	wt %d sh %d cst %d assoc %d\n",
+		cache_info.ic_conf.cc_wt,
+		cache_info.ic_conf.cc_sh,
+		cache_info.ic_conf.cc_cst,
+		cache_info.ic_conf.cc_assoc);
 
-	printk(KERN_DEBUG "dt conf: sh %d page %d cst %d aid %d pad1 %d \n",
+	printk("D-TLB conf: sh %d page %d cst %d aid %d pad1 %d \n",
 	    cache_info.dt_conf.tc_sh,
 	    cache_info.dt_conf.tc_page,
 	    cache_info.dt_conf.tc_cst,
 	    cache_info.dt_conf.tc_aid,
 	    cache_info.dt_conf.tc_pad1);
 
-	printk(KERN_DEBUG "it conf: sh %d page %d cst %d aid %d pad1 %d \n",
+	printk("I-TLB conf: sh %d page %d cst %d aid %d pad1 %d \n",
 	    cache_info.it_conf.tc_sh,
 	    cache_info.it_conf.tc_page,
 	    cache_info.it_conf.tc_cst,
@@ -180,10 +189,17 @@ parisc_cache_init(void)
 		split_tlb = 1;
 	}
 
-	dcache_stride = (1 << (cache_info.dc_conf.cc_block + 3)) *
-						cache_info.dc_conf.cc_line;
-	icache_stride = (1 << (cache_info.ic_conf.cc_block + 3)) *
-						cache_info.ic_conf.cc_line;
+#if 0
+#define CAFL_STRIDE(cnf) ((1 << (cnf.cc_block + 3)) * cnf.cc_line)
+#else
+#define CAFL_STRIDE(cnf) (cnf.cc_block * (cnf.cc_line << (4 + cnf.cc_shift)))
+#endif
+	dcache_stride = CAFL_STRIDE(cache_info.dc_conf);
+	icache_stride = CAFL_STRIDE(cache_info.ic_conf);
+#undef CAFL_STRIDE
+
+printk("dcache_stride %d   icache_stride %d\n", dcache_stride, icache_stride);
+
 #ifndef CONFIG_PA20
 	if (pdc_btlb_info(&btlb_info) < 0) {
 		memset(&btlb_info, 0, sizeof btlb_info);
@@ -192,8 +208,8 @@ parisc_cache_init(void)
 
 	if ((boot_cpu_data.pdc.capabilities & PDC_MODEL_NVA_MASK) ==
 						PDC_MODEL_NVA_UNSUPPORTED) {
-		printk(KERN_WARNING "Only equivalent aliasing supported\n");
-#ifndef CONFIG_SMP
+		printk(KERN_WARNING "parisc_cache_init: Only equivalent aliasing supported!\n");
+#if 0
 		panic("SMP kernel required to avoid non-equivalent aliasing");
 #endif
 	}
Index: include/asm-parisc/pdc.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/pdc.h,v
retrieving revision 1.7
diff -u -p -r1.7 pdc.h
--- include/asm-parisc/pdc.h	4 Jun 2004 19:36:53 -0000	1.7
+++ include/asm-parisc/pdc.h	11 Jun 2004 05:34:04 -0000
@@ -346,10 +346,10 @@ struct pdc_cache_cf {		/* for PDC_CACHE 
 #ifdef __LP64__
 		cc_padW:32,
 #endif
-		cc_alias:4,	/* alias boundaries for virtual addresses   */
+		cc_alias: 4,	/* alias boundaries for virtual addresses   */
 		cc_block: 4,	/* to determine most efficient stride */
 		cc_line	: 3,	/* maximum amount written back as a result of store (multiple of 16 bytes) */
-		cc_pad0 : 2,	/* reserved */
+		cc_shift: 2,	/* how much to shift cc_block left */
 		cc_wt	: 1,	/* 0 = WT-Dcache, 1 = WB-Dcache */
 		cc_sh	: 2,	/* 0 = separate I/D-cache, else shared I/D-cache */
 		cc_cst  : 3,	/* 0 = incoherent D-cache, 1=coherent D-cache */
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
