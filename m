From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Improving performance of munmap
Date: Fri, 8 Oct 2004 09:59:26 -0700
Message-ID: <20041008165926.GI14151@tausq.org>
References: <20041007230232.GF14151@tausq.org>
	<20041008020343.GN24430@baldric.uwo.ca>
	<20041008041657.GG14151@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041008041657.GG14151@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

In reference to a message from Randolph Chung, dated Oct 07:
> i made some changes to the flush_user_{dcache,icache}_range
> implementation and it seems to be better now. will post the patch
> tomorrow after some cleanups.

Here's the patch. Any comments before i check it in?

On the a500 that i am testing on, this bumps the cache threshold up 
from 0.5MB to 1MB after the timing.

I've retained the assumption in the code that the icache and dcache
thresholds are the same. i don't know if that's really a good
assumption though.

One more thing -- the performance of flush_data_cache() (i.e. the 
architected whole-cache flush) seems to be dependent on the current
contents of the cache. i suppose that when the cache is more heavily
populated it takes longer to flush. so if you do multiple timings of
flush_data_cache() one after the other, the calls after the first tend
to be much faster (2-3x in one experiment). i've decided to only use the
first measurement, with the assumption that on a running system the
cache is normally fairly populated.

randolph

Index: arch/parisc/kernel/cache.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/cache.c,v
retrieving revision 1.21
diff -u -p -r1.21 cache.c
--- arch/parisc/kernel/cache.c	13 Sep 2004 15:22:24 -0000	1.21
+++ arch/parisc/kernel/cache.c	8 Oct 2004 16:48:22 -0000
@@ -55,6 +55,11 @@ flush_data_cache(void)
 {
 	on_each_cpu((void (*)(void *))flush_data_cache_local, NULL, 1, 1);
 }
+void 
+flush_instruction_cache(void)
+{
+	on_each_cpu((void (*)(void *))flush_instruction_cache_local, NULL, 1, 1);
+}
 #endif
 
 void
@@ -326,4 +331,36 @@ void clear_user_page_asm(void *page, uns
 	purge_tlb_start();
 	__clear_user_page_asm(page, vaddr);
 	purge_tlb_end();
+}
+
+#define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
+int parisc_cache_flush_threshold = FLUSH_THRESHOLD;
+
+void parisc_setup_cache_timing(void)
+{
+	unsigned long rangetime, alltime;
+	extern char _text;	/* start of kernel code, defined by linker */
+	extern char _end;	/* end of BSS, defined by linker */
+	unsigned long size;
+
+	alltime = mfctl(16);
+	flush_data_cache();
+	alltime = mfctl(16) - alltime;
+
+	size = (unsigned long)(&_end - _text);
+	rangetime = mfctl(16);
+	flush_kernel_dcache_range((unsigned long)&_text, size);
+	rangetime = mfctl(16) - rangetime;
+
+	printk(KERN_DEBUG "Whole cache flush %lu cycles, flushing %lu bytes %lu cycles\n",
+		alltime, size, rangetime);
+
+	/* Racy, but if we see an intermediate value, it's ok too... */
+	parisc_cache_flush_threshold = size * alltime / rangetime;
+
+	parisc_cache_flush_threshold = (parisc_cache_flush_threshold + L1_CACHE_BYTES - 1) &~ (L1_CACHE_BYTES - 1); 
+	if (!parisc_cache_flush_threshold)
+		parisc_cache_flush_threshold = FLUSH_THRESHOLD;
+
+	printk("Setting cache flush threshold to %x (%d CPUs online)\n", parisc_cache_flush_threshold, num_online_cpus());
 }
Index: arch/parisc/kernel/setup.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/setup.c,v
retrieving revision 1.8
diff -u -p -r1.8 setup.c
--- arch/parisc/kernel/setup.c	4 Oct 2004 19:12:49 -0000	1.8
+++ arch/parisc/kernel/setup.c	8 Oct 2004 16:48:22 -0000
@@ -310,6 +310,8 @@ static int __init parisc_init(void)
 			boot_cpu_data.cpu_hz / 1000000,
 			boot_cpu_data.cpu_hz % 1000000	);
 
+	parisc_setup_cache_timing();
+
 	/* These are in a non-obvious order, will fix when we have an iotree */
 #if defined(CONFIG_IOSAPIC)
 	iosapic_init();
Index: include/asm-parisc/cache.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/cache.h,v
retrieving revision 1.3
diff -u -p -r1.3 cache.h
--- include/asm-parisc/cache.h	5 Apr 2004 02:47:39 -0000	1.3
+++ include/asm-parisc/cache.h	8 Oct 2004 16:48:44 -0000
@@ -34,6 +34,7 @@ extern void flush_data_cache_local(void)
 extern void flush_instruction_cache_local(void); /* flushes local code-cache only */
 #ifdef CONFIG_SMP
 extern void flush_data_cache(void); /* flushes data-cache only (all processors) */
+extern void flush_instruction_cache(void); /* flushes i-cache only (all processors) */
 #else
 #define flush_data_cache flush_data_cache_local
 #define flush_instruction_cache flush_instruction_cache_local
Index: include/asm-parisc/cacheflush.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/cacheflush.h,v
retrieving revision 1.15
diff -u -p -r1.15 cacheflush.h
--- include/asm-parisc/cacheflush.h	30 Sep 2004 12:08:46 -0000	1.15
+++ include/asm-parisc/cacheflush.h	8 Oct 2004 16:48:44 -0000
@@ -33,36 +33,25 @@ static inline void flush_cache_all(void)
 #define flush_cache_vmap(start, end)		flush_cache_all()
 #define flush_cache_vunmap(start, end)		flush_cache_all()
 
-/* The following value needs to be tuned and probably scaled with the
- * cache size.
- */
-
-#define FLUSH_THRESHOLD 0x80000
+extern int parisc_cache_flush_threshold;
+void parisc_setup_cache_timing(void);
 
 static inline void
 flush_user_dcache_range(unsigned long start, unsigned long end)
 {
-#ifdef CONFIG_SMP
-	flush_user_dcache_range_asm(start,end);
-#else
-	if ((end - start) < FLUSH_THRESHOLD)
+	if ((end - start) < parisc_cache_flush_threshold)
 		flush_user_dcache_range_asm(start,end);
 	else
 		flush_data_cache();
-#endif
 }
 
 static inline void
 flush_user_icache_range(unsigned long start, unsigned long end)
 {
-#ifdef CONFIG_SMP
-	flush_user_icache_range_asm(start,end);
-#else
-	if ((end - start) < FLUSH_THRESHOLD)
+	if ((end - start) < parisc_cache_flush_threshold)
 		flush_user_icache_range_asm(start,end);
 	else
 		flush_instruction_cache();
-#endif
 }
 
 extern void flush_dcache_page(struct page *page);
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
