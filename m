From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] some more cpu info?
Date: Tue, 12 Sep 2006 11:21:13 +0000
Message-ID: <45069829.5060804@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Kyle,

ITSR that JDA sent me some interesting material about cpuinfog which 
would look like:
--- include/asm-parisc/pdc.h.Orig       2006-09-10 21:22:11.000000000 +0200
+++ include/asm-parisc/pdc.h    2006-09-11 12:32:59.000000000 +0200
@@ -346,26 +346,57 @@
  #endif
                 cc_alias: 4,    /* alias boundaries for virtual 
addresses   */
                 cc_block: 4,    /* to determine most efficient stride */
-               cc_line : 3,    /* maximum amount written back as a 
result of store (multiple of 16 bytes) */
+               cc_line : 3,    /* maximum amount written back as a result
+                                  of store (multiple of 16 bytes) */
                 cc_shift: 2,    /* how much to shift cc_block left */
                 cc_wt   : 1,    /* 0 = WT-Dcache, 1 = WB-Dcache */
-               cc_sh   : 2,    /* 0 = separate I/D-cache, else shared 
I/D-cache */
-               cc_cst  : 3,    /* 0 = incoherent D-cache, 1=coherent 
D-cache */
+               cc_sh   : 2,    /* 0 = separate I/D-cache (both FIC and 
FDC),
+                                  1 = shared I/D-cache (only FDC),
+                                  2 = shared I/D-cache (only FIC),
+                                  3 = shared I/D-cache (either FIC or 
FDC) */
+               cc_cst  : 3,    /* 0 = incoherent D-cache,
+                                  1 = coherent D-cache,
+                                  2 - 7 reserved */
                 cc_pad1 : 10,   /* reserved */
                 cc_hv   : 3;    /* hversion dependent */
  };

-struct pdc_tlb_cf {            /* for PDC_CACHE (I/D-TLB's) */
-    unsigned long tc_pad0:12,  /* reserved */
+struct pdc_dtlb_cf {           /* for PDC_CACHE (D-TLB's) */
+    unsigned long
  #ifdef __LP64__
                 tc_padW:32,
  #endif
+               tc_pad0 :12,    /* reserved */
+               tc_sh   : 2,    /* 0 = separate I/D-TLB (both PITLB and 
PDTLB),
+                                  1 = shared I/D-TLB (only PDTLB),
+                                  2 = shared I/D-TLB (only PITLB),
+                                  3 = shared I/D-TLB (either PITLB or 
PDTLB) */
+               tc_hv   : 1,    /* HV */
+               tc_u    : 1,    /* 0 = TLB U-bit not implemented,
+                                  1 = TLB U-bit implemented */
+               tc_cst  : 3,    /* 0 = incoherent D-cache,
+                                  1 = coherent D-cache,
+                                  2 -7 reserved */
+               tc_pad1 :11,    /* reserved */
+               tc_hv1  : 2;    /* HV1 */
+};
+
+struct pdc_itlb_cf {           /* for PDC_CACHE (I-TLB's) */
+    unsigned long
+#ifdef __LP64__
+               tc_padW:32,
+#endif
+               tc_pad0 :12,    /* reserved */
                 tc_sh   : 2,    /* 0 = separate I/D-TLB, else shared 
I/D-TLB */
                 tc_hv   : 1,    /* HV */
-               tc_page : 1,    /* 0 = 2K page-size-machine, 1 = 4k page 
size */
-               tc_cst  : 3,    /* 0 = incoherent operations, else 
coherent operations */
-               tc_aid  : 5,    /* ITLB: width of access ids of 
processor (encoded!) */
-               tc_pad1 : 8;    /* ITLB: width of space-registers 
(encoded) */
+               tc_page : 1,    /* 0 = 2K page-size-machine,
+                                  1 = 4k page size */
+               tc_cst  : 3,    /* 0 = incoherent D-cache,
+                                  1 = coherent D-cache,
+                                  2 -7 reserved */
+               tc_aid  : 5,    /* encoded width of access ids of 
processor */
+               tc_sr   : 6,    /* encoded width of space-registers */
+               tc_hv1  : 2;    /* HV1 */
  };

  struct pdc_cache_info {                /* main-PDC_CACHE-structure 
(caches & TLB's) */
@@ -385,7 +416,7 @@
         unsigned long   dc_loop;
         /* Instruction-TLB */
         unsigned long   it_size;        /* number of entries in I-TLB */
-       struct pdc_tlb_cf it_conf;      /* I-TLB-configuration */
+       struct pdc_itlb_cf it_conf;     /* I-TLB-configuration */
         unsigned long   it_sp_base;
         unsigned long   it_sp_stride;
         unsigned long   it_sp_count;
@@ -395,7 +426,7 @@
         unsigned long   it_loop;
         /* data-TLB */
         unsigned long   dt_size;        /* number of entries in D-TLB */
-       struct pdc_tlb_cf dt_conf;      /* D-TLB-configuration */
+       struct pdc_dtlb_cf dt_conf;     /* D-TLB-configuration */
         unsigned long   dt_sp_base;
         unsigned long   dt_sp_stride;
         unsigned long   dt_sp_count;
--- arch/parisc/kernel/cache.c.Orig     2006-09-11 11:35:10.000000000 +0200
+++ arch/parisc/kernel/cache.c  2006-09-12 12:44:21.000000000 +0200
@@ -104,11 +104,14 @@
                 cache_info.ic_size/1024 );
         if (cache_info.dc_loop == 1)
                 snprintf(buf, 32, "%lu-way associative", 
cache_info.dc_loop);
-       seq_printf(m, "D-cache\t\t: %ld KB (%s%s, %s)\n",
+       seq_printf(m, "D-cache\t\t: %ld KB (stride = %lu, %s/%s%s, %s)\n",
                 cache_info.dc_size/1024,
+               cache_info.dc_stride,
+               (cache_info.dc_conf.cc_cst ? "CO":"NC"),
                 (cache_info.dc_conf.cc_wt ? "WT":"WB"),
                 (cache_info.dc_conf.cc_sh ? ", shared I/D":""),
-               ((cache_info.dc_loop == 1) ? "direct mapped" : buf));
+               ((cache_info.dc_loop == 1) ? "direct mapped" : buf)
+       );
         seq_printf(m, "ITLB entries\t: %ld\n" "DTLB entries\t: %ld%s\n",
                 cache_info.it_size,
                 cache_info.dt_size,
@@ -143,7 +146,7 @@
         if (pdc_cache_info(&cache_info) < 0)
                 panic("parisc_cache_init: pdc_cache_info failed");

-#if 0
+#if 1
         printk("ic_size %lx dc_size %lx it_size %lx\n",
                 cache_info.ic_size,
                 cache_info.dc_size,
@@ -155,13 +158,13 @@
                 cache_info.dc_count,
                 cache_info.dc_loop);

-       printk("dc_conf = 0x%lx  alias %d blk %d line %d shift %d\n",
+       printk("dc_conf = 0x%lx  alias %d blk %d line %d shift %d "
+               "wt %d sh %d cst %d assoc %d\n",
                 *(unsigned long *) (&cache_info.dc_conf),
                 cache_info.dc_conf.cc_alias,
                 cache_info.dc_conf.cc_block,
                 cache_info.dc_conf.cc_line,
-               cache_info.dc_conf.cc_shift);
-       printk("        wt %d sh %d cst %d hv %d\n",
+               cache_info.dc_conf.cc_shift,
                 cache_info.dc_conf.cc_wt,
                 cache_info.dc_conf.cc_sh,
                 cache_info.dc_conf.cc_cst,
@@ -173,31 +176,34 @@
                 cache_info.ic_count,
                 cache_info.ic_loop);

-       printk("ic_conf = 0x%lx  alias %d blk %d line %d shift %d\n",
+       printk("ic_conf = 0x%lx  alias %d blk %d line %d shift %d "
+               "wt %d sh %d cst %d assoc %d\n",
                 *(unsigned long *) (&cache_info.ic_conf),
                 cache_info.ic_conf.cc_alias,
                 cache_info.ic_conf.cc_block,
                 cache_info.ic_conf.cc_line,
-               cache_info.ic_conf.cc_shift);
-       printk("        wt %d sh %d cst %d hv %d\n",
+               cache_info.ic_conf.cc_shift,
                 cache_info.ic_conf.cc_wt,
                 cache_info.ic_conf.cc_sh,
                 cache_info.ic_conf.cc_cst,
                 cache_info.ic_conf.cc_hv);

-       printk("D-TLB conf: sh %d page %d cst %d aid %d pad1 %d \n",
+       printk("D-TLB conf: sh %d hv %d u %d cst %d pad1 %d hv1 %d\n",
                 cache_info.dt_conf.tc_sh,
-               cache_info.dt_conf.tc_page,
+               cache_info.dt_conf.tc_hv,
+               cache_info.dt_conf.tc_u,
                 cache_info.dt_conf.tc_cst,
-               cache_info.dt_conf.tc_aid,
-               cache_info.dt_conf.tc_pad1);
+               cache_info.dt_conf.tc_pad1,
+               cache_info.dt_conf.tc_hv1);

-       printk("I-TLB conf: sh %d page %d cst %d aid %d pad1 %d \n",
+       printk("I-TLB conf: sh %d hv %d page %d cst %d aid %d sr %d hv1 
%d\n",
                 cache_info.it_conf.tc_sh,
+               cache_info.dt_conf.tc_hv,
                 cache_info.it_conf.tc_page,
                 cache_info.it_conf.tc_cst,
                 cache_info.it_conf.tc_aid,
-               cache_info.it_conf.tc_pad1);
+               cache_info.it_conf.tc_sr,
+               cache_info.it_conf.tc_hv1);
  #endif

         split_tlb = 0;
=== <> ===
(but may be have got something more recent?)

I would just like to add those cache line size info:
--- arch/parisc/kernel/cache.c  2006-09-12 12:44:21.000000000 +0200
+++ arch/parisc/kernel/cache.c.New      2006-09-12 12:43:00.000000000 +0200
@@ -102,6 +102,8 @@

         seq_printf(m, "I-cache\t\t: %ld KB\n",
                 cache_info.ic_size/1024 );
+       seq_printf(m, "I-cache line\t: %d Byte\n",
+               cache_info.ic_conf.cc_line << 4 );
         if (cache_info.dc_loop == 1)
                 snprintf(buf, 32, "%lu-way associative", 
cache_info.dc_loop);
         seq_printf(m, "D-cache\t\t: %ld KB (stride = %lu, %s/%s%s, %s)\n",
@@ -112,6 +114,8 @@
                 (cache_info.dc_conf.cc_sh ? ", shared I/D":""),
                 ((cache_info.dc_loop == 1) ? "direct mapped" : buf)
         );
+       seq_printf(m, "D-cache line\t: %d Byte\n",
+               cache_info.dc_conf.cc_line << 4 );
         seq_printf(m, "ITLB entries\t: %ld\n" "DTLB entries\t: %ld%s\n",
                 cache_info.it_size,
                 cache_info.dt_size,
=== <> ===

Tested on my c110, it reports:
#  cat /proc/cpuinfo
processor       : 0
cpu family      : PA-RISC 1.1c
cpu             : PA7200 (PCX-T')
cpu MHz         : 120.000000
model           : 9000/777/C110
model name      : Raven 120 T'
hversion        : 0x000058e0
sversion        : 0x00000481
I-cache         : 256 KB
I-cache line    : 32 Byte
D-cache         : 258 KB (stride = 32, WBCO, direct mapped)
D-cache line    : 32 Byte
ITLB entries    : 120
DTLB entries    : 120 - shared with ITLB
BTLB fixed      : max. 16384 pages, pagesize=4096 (64MB)
BTLB fix-entr.  : 0 instruction, 0 data (16 combined)
BTLB var-entr.  : 0 instruction, 0 data (0 combined)
bogomips        : 119.29
software id     : 2011460976

Please fill free to commit if there are some interest ;-)

Tia,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
