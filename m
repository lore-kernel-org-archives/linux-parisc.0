Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 27 Jun 2003 16:41:13 +0200
Message-ID: <3ED70CF10000AD97@ocpmta2.freegates.net>
In-Reply-To: <20030626170628.GO451@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] warning: minor abi change
To: "Matthew Wilcox" <willy@debian.org>
Cc: "Matthew Wilcox" <willy@debian.org>,
	parisc-linux@parisc-linux.org, "Randolph Chung" <tausq@debian.org>,
	"Grant Grundler" <grundler@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> they're irrelevant if you use them via /proc/sys to access the feature.
> they're really important if you use them via sysctl(3).

The relevant good pratice would be to use named const as ERR :-)

But mainly, as promise I co 2.4.21-p0 and copare with my merge and notice
some requested add patch:

diff -NaurX dontdiff linux-2.4.21-pa0/drivers/ide/pci/ns87415.c linux-2.4.21-rc8-pa35/drivers/ide/pci/ns87415.c
--- linux-2.4.21-pa0/drivers/ide/pci/ns87415.c	2003-06-26 17:07:20.000000000
+0200
+++ linux-2.4.21-rc8-pa35/drivers/ide/pci/ns87415.c	2003-02-28 18:43:45.000000000
+0100
@@ -27,6 +27,10 @@
 
 #include "ns87415.h"
 
+#if defined(__hppa__) && defined(CONFIG_SUPERIO)
+#include <asm/superio.h>
+#endif
+
 static unsigned int ns87415_count = 0, ns87415_control[MAX_HWIFS] = { 0
};
 
 /*
@@ -200,7 +204,11 @@
 	}
 
 	if (!using_inta)
+#if defined(__hppa__) && defined(CONFIG_SUPERIO)
+		hwif->irq = superio_get_ide_irq();	/* legacy mode */
+#else
 		hwif->irq = hwif->channel ? 15 : 14;	/* legacy mode */
+#endif
 	else if (!hwif->irq && hwif->mate && hwif->mate->irq)
 		hwif->irq = hwif->mate->irq;	/* share IRQ with mate */
 
diff -NaurX dontdiff linux-2.4.21-pa0/include/asm-parisc/system_irqsave.h
linux-2.4.21-rc8-pa35/include/asm-parisc/system_irqsave.h
--- linux-2.4.21-pa0/include/asm-parisc/system_irqsave.h	2003-06-27 07:49:56.000000000
+0200
+++ linux-2.4.21-rc8-pa35/include/asm-parisc/system_irqsave.h	2003-06-27
15:52:10.000000000 +0200
@@ -7,6 +7,9 @@
 #define __cli()	__asm__ __volatile__("rsm %0,%%r0\n" : : "i" (PSW_I) : "memory"
)
 #define __sti()	__asm__ __volatile__("ssm %0,%%r0\n" : : "i" (PSW_I) : "memory"
)
 
+#define __save_and_cli(x)  do { __save_flags(x); __cli(); } while(0);
+#define __save_and_sti(x)  do { __save_flags(x); __sti(); } while(0);
+
 #define local_irq_save(x) \
 	__asm__ __volatile__("rsm %1,%0" : "=r" (x) :"i" (PSW_I) : "memory" )
 #define local_irq_restore(x) \
=================================================================================
btw I also test following stuff which seems to works too:
diff -NaurX dontdiff linux-2.4.21-pa0/include/asm-parisc/system_irqsave.h.mine
linux-2.4.21-rc8-pa35/include/asm-parisc/system_irqsave.h.mine
--- linux-2.4.21-pa0/include/asm-parisc/system_irqsave.h.mine	1970-01-01
01:00:00.000000000 +0100
+++ linux-2.4.21-rc8-pa35/include/asm-parisc/system_irqsave.h.mine	2003-06-27
15:50:11.000000000 +0200
@@ -0,0 +1,21 @@
+#ifndef __PARISC_SYSTEM_IRQSAVE_H
+#define __PARISC_SYSTEM_IRQSAVE_H
+
+/* interrupt control */
+#define __save_flags(x)	__asm__ __volatile__("ssm 0, %0" : "=r" (x) : :
"memory")
+#define __restore_flags(x) __asm__ __volatile__("mtsm %0" : : "r" (x) :
"memory")
+#define __cli()	__asm__ __volatile__("rsm %0,%%r0\n" : : "i" (PSW_I) : "memory"
)
+#define __sti()	__asm__ __volatile__("ssm %0,%%r0\n" : : "i" (PSW_I) : "memory"
)
+
+#define __save_and_cli(x)  do { __save_flags(x); __cli(); } while(0);
+#define __save_and_sti(x)  do { __save_flags(x); __sti(); } while(0);
+
+/* For spinlocks etc */
+#define local_irq_save(x)  __save_and_cli(x)
+#define local_irq_set(x)   __save_and_sti(x)
+
+#define local_irq_restore(x) __restore_flags(x)
+#define local_irq_disable() __cli()
+#define local_irq_enable()  __sti()
+
+#endif /* __PARISC_SYSTEM_IRQSAVE_H */
=================================================================================

And also some various stuff as:

- a clean up (just put in comment for remind):

diff -NaurX dontdiff linux-2.4.21-pa0/arch/parisc/kernel/parisc_ksyms.c linux-2.4.21-rc8-pa35/arch/parisc/kernel/parisc_ksyms.c
--- linux-2.4.21-pa0/arch/parisc/kernel/parisc_ksyms.c	2003-03-17 08:14:55.000000000
+0100
+++ linux-2.4.21-rc8-pa35/arch/parisc/kernel/parisc_ksyms.c	2003-05-23 13:31:18.000000000
+0200
@@ -167,7 +167,7 @@
 extern void $$remI(void);
 extern void $$remU(void);
 extern void $$mulI(void);
-extern void $$mulU(void);
+/* extern void $$mulU(void); */
 extern void $$divU_3(void);
 extern void $$divU_5(void);
 extern void $$divU_6(void);
@@ -193,7 +193,7 @@
 EXPORT_SYMBOL_NOVERS($$remU);
 EXPORT_SYMBOL_NOVERS($$mulI);
 #ifndef __LP64__
-EXPORT_SYMBOL_NOVERS($$mulU);
+/* EXPORT_SYMBOL_NOVERS($$mulU); */
 #endif
 EXPORT_SYMBOL_NOVERS($$divU_3);
 EXPORT_SYMBOL_NOVERS($$divU_5);
diff -NaurX dontdiff linux-2.4.21-pa0/arch/parisc/kernel/processor.c linux-2.4.21-rc8-pa35/arch/parisc/kernel/processor.c
--- linux-2.4.21-pa0/arch/parisc/kernel/processor.c	2003-06-27 07:35:56.000000000
+0200
+++ linux-2.4.21-rc8-pa35/arch/parisc/kernel/processor.c	2002-12-20 15:56:19.000000000
+0100
@@ -77,8 +77,6 @@
 	unsigned long txn_addr;
 	unsigned long cpuid;
 	struct cpuinfo_parisc *p;
-	extern struct irq_region_ops cpu_irq_ops; /* arch/parisc...irq.c */
-	extern struct irqaction cpu_irq_actions[]; /* arch/parisc...irq.c */
 
 #ifndef CONFIG_SMP
 	if (boot_cpu_data.cpu_count > 0) {

- a small typo :-)

diff -NaurX dontdiff linux-2.4.21-pa0/drivers/char/genrtc.c linux-2.4.21-rc8-pa35/drivers/char/genrtc.c
--- linux-2.4.21-pa0/drivers/char/genrtc.c	2003-01-13 08:38:36.000000000
+0100
+++ linux-2.4.21-rc8-pa35/drivers/char/genrtc.c	2003-05-08 22:10:52.000000000
+0200
@@ -99,7 +99,7 @@
 static void gen_rtc_interrupt(unsigned long arg);
 
 /*
- * Routine to poll RTC seconds field for change as often as posible,
+ * Routine to poll RTC seconds field for change as often as possible,
  * after first RTC_UIE use timer to reduce polling
  */
 static void genrtc_troutine(void *data)

- a work-around for gcc-3.3 awaiting final fix:

--- linux-2.4.21-pa0/drivers/net/tun.c	2002-08-07 07:50:51.000000000 +0200
+++ linux-2.4.21-rc8-pa35/drivers/net/tun.c	2003-06-27 12:34:17.000000000
+0200
@@ -359,7 +359,9 @@
 		/* Device exist */
 		tun = dev->priv;
 
-		if (dev->init != tun_net_init || tun->attached)
+                /* (void*) is a temporary w-a because of
+                   hppa gcc-3.3 __canonicalize_funcptr_for_compare() */
+		if (dev->init != (void*)tun_net_init || tun->attached)
 			return -EBUSY;
 
 		/* Check permissions */

- Grant what do you think about this:

diff -NaurX dontdiff linux-2.4.21-pa0/drivers/sound/ad1889.c linux-2.4.21-rc8-pa35/drivers/sound/ad1889.c
--- linux-2.4.21-pa0/drivers/sound/ad1889.c	2003-06-27 07:46:37.000000000
+0200
+++ linux-2.4.21-rc8-pa35/drivers/sound/ad1889.c	2003-05-08 22:43:44.000000000
+0200
@@ -24,7 +24,7 @@
 <jsm> tausq: Anyway, to set up sample rates for D to A, you just use the
sample rate on the codec. For A to D, you need to set the codec always to
48K (using the split sample rate feature on the codec) and then set the resampler
on the AD1889 to the sample rate you want.
 <jsm> Also, when changing the sample rate on the codec you need to power
it down and re power it up for the change to take effect!
  *
- * $Id: ad1889.c,v 1.2 2002/10/16 04:14:12 grundler Exp $
+ * $Id: ad1889.c,v 1.3 2002/10/19 21:31:44 grundler Exp $
  */
 #include <linux/config.h>
 #include <linux/module.h>
@@ -816,7 +816,7 @@
 	ad1889_dev_t *dev = ac97->private_data;
 
 	//DBG("Writing 0x%x to 0x%lx\n", val, dev->regbase + 0x100 + reg);
-	return AD1889_WRITEW(dev, 0x100 + reg, val);
+	AD1889_WRITEW(dev, 0x100 + reg, val);
 }
 
 static u16 ad1889_codec_read(struct ac97_codec *ac97, u8 reg)
@@ -1059,7 +1059,7 @@
 	name:		DEVNAME,
 	id_table:	ad1889_id_tbl,
 	probe:		ad1889_probe,
-	remove:		ad1889_remove,
+	remove:		__devexit_p(ad1889_remove),
 };
 
 static int __init ad1889_init_module(void)

- another cleanup (don't remember why :-?)

diff -NaurX dontdiff linux-2.4.21-pa0/include/asm-parisc/ide.h linux-2.4.21-rc8-pa35/include/asm-parisc/ide.h
--- linux-2.4.21-pa0/include/asm-parisc/ide.h	2003-06-27 07:49:55.000000000
+0200
+++ linux-2.4.21-rc8-pa35/include/asm-parisc/ide.h	2003-06-05 16:55:22.000000000
+0200
@@ -20,8 +20,6 @@
 #define MAX_HWIFS	2
 #endif
 
-#define ide__sti()      __sti()
-
 static __inline__ int ide_default_irq(ide_ioreg_t base)
 {
 	switch (base) {

- and last (please see comments below, thanks)

diff -NaurX dontdiff linux-2.4.21-pa0/include/asm-parisc/uaccess.h linux-2.4.21-rc8-pa35/include/asm-parisc/uaccess.h
--- linux-2.4.21-pa0/include/asm-parisc/uaccess.h	2002-10-28 08:05:18.000000000
+0100
+++ linux-2.4.21-rc8-pa35/include/asm-parisc/uaccess.h	2003-06-11 14:39:12.000000000
+0200
@@ -28,6 +28,11 @@
  * that put_user is the same as __put_user, etc.
  */
 
+extern int __get_kernel_bad(void);
+extern int __get_user_bad(void);
+extern int __put_kernel_bad(void);
+extern int __put_user_bad(void);
+
 #define access_ok(type,addr,size)   (1)
 #define verify_area(type,addr,size) (0)
 
@@ -35,8 +40,12 @@
 #define get_user __get_user
 
 #if BITS_PER_LONG == 32
-#define LDD_KERNEL(ptr)		BUG()
-#define LDD_USER(ptr)		BUG()
+#define LDD_KERNEL(ptr)		__get_kernel_bad();
+#define LDD_USER(ptr)		__get_user_bad();
+/*
+#define STD_KERNEL(x, ptr)	__put_kernel_bad();
+#define STD_USER(x, ptr)	__put_user_bad();
+*/
 #define STD_KERNEL(x, ptr) __put_kernel_asm64(x,ptr)
 #define STD_USER(x, ptr) __put_user_asm64(x,ptr)
 #else
@@ -75,7 +84,7 @@
 	    case 2: __get_kernel_asm("ldh",ptr); break; \
 	    case 4: __get_kernel_asm("ldw",ptr); break; \
 	    case 8: LDD_KERNEL(ptr); break;		\
-	    default: BUG(); break;                      \
+	    default: __get_kernel_bad(); break;         \
 	    }                                           \
 	}                                               \
 	else {                                          \
@@ -84,7 +93,7 @@
 	    case 2: __get_user_asm("ldh",ptr); break;   \
 	    case 4: __get_user_asm("ldw",ptr); break;   \
 	    case 8: LDD_USER(ptr);  break;		\
-	    default: BUG(); break;                      \
+	    default: __get_user_bad(); break;           \
 	    }                                           \
 	}                                               \
 							\
@@ -144,7 +153,7 @@
 	    case 2: __put_kernel_asm("sth",x,ptr); break;       \
 	    case 4: __put_kernel_asm("stw",x,ptr); break;       \
 	    case 8: STD_KERNEL(x,ptr); break;			\
-	    default: BUG(); break;                              \
+	    default: __put_kernel_bad(); break;			\
 	    }                                                   \
 	}                                                       \
 	else {                                                  \
@@ -153,7 +162,7 @@
 	    case 2: __put_user_asm("sth",x,ptr); break;         \
 	    case 4: __put_user_asm("stw",x,ptr); break;         \
 	    case 8: STD_USER(x,ptr); break;			\
-	    default: BUG(); break;                              \
+	    default: __put_user_bad(); break;			\
 	    }                                                   \
 	}                                                       \
 								\
@@ -211,45 +220,36 @@
 		: "=r"(__pu_err)                            \
 		: "r"(ptr), "r"(x), "0"(__pu_err))
 
-static inline void __put_kernel_asm64(u64 x, void *ptr)
-{
-	u32 hi = x>>32;
-	u32 lo = x&0xffffffff;
-	__asm__ __volatile__ (
-		"\n1:\tstw %1,0(%0)\n"
-		"\n2:\tstw %2,4(%0)\n"
-		"3:\n"
-		"\t.section __ex_table,\"a\"\n"
-		 "\t.word\t1b\n"
-		 "\t.word\t(3b-1b)+1\n"
-		 "\t.word\t2b\n"
-		 "\t.word\t(3b-2b)+1\n"
-		 "\t.previous"
-		: : "r"(ptr), "r"(hi), "r"(lo));
-
-}
-
-static inline void __put_user_asm64(u64 x, void *ptr)
-{
-	u32 hi = x>>32;
-	u32 lo = x&0xffffffff;
-	__asm__ __volatile__ (
-		"\n1:\tstw %1,0(%%sr3,%0)\n"
-		"\n2:\tstw %2,4(%%sr3,%0)\n"
-		"3:\n"
-		"\t.section __ex_table,\"a\"\n"
-		 "\t.word\t1b\n"
-		 "\t.word\t(3b-1b)+1\n"
-		 "\t.word\t2b\n"
-		 "\t.word\t(3b-2b)+1\n"
-		 "\t.previous"
-		: : "r"(ptr), "r"(hi), "r"(lo));
+#define __put_kernel_asm64(x, ptr)		\
+	__asm__ __volatile__ (			\
+		"\n1:\tstw\t%2,0(%1)\n"		\
+		"2:\tstw\t%R2,4(%1)\n"		\
+		"3:\n"				\
+		"\t.section __ex_table,\"a\"\n"	\
+		 "\t.word\t1b\n"		\
+		 "\t.word\t(3b-1b)+1\n"		\
+		 "\t.word\t2b\n"		\
+		 "\t.word\t(3b-2b)+1\n"		\
+		 "\t.previous"			\
+		: "=r"(__pu_err)		\
+		: "r"(ptr), "r"(x), "0"(__pu_err))
 
-}
+#define __put_user_asm64(x, ptr)		\
+	__asm__ __volatile__ (			\
+		"\n1:\tstw\t%2,0(%%sr3,%1)\n"	\
+		"2:\tstw\t%R2,4(%%sr3,%1)\n"	\
+		"3:\n"				\
+		"\t.section __ex_table,\"a\"\n"	\
+		 "\t.word\t1b\n"		\
+		 "\t.word\t(3b-1b)+1\n"		\
+		 "\t.word\t2b\n"		\
+		 "\t.word\t(3b-2b)+1\n"		\
+		 "\t.previous"			\
+		: "=r"(__pu_err)		\
+		: "r"(ptr), "r"(x), "0"(__pu_err))
 
 #endif
 
-
 /*
  * Complex access routines -- external declarations
  */

================================================================================
Comments:

- The first changes (xxx_bad(void)) was agreed earlier by Randolph but never
comited (?). The goal is to breack the build of the kernel and so avoid the
risk to boot one (as I do when I test evms or [xj]fs which required __put_XXX_asm64)
which can unexpected damages

- The second replace Randolph __put_XXX_asm64(); it does the same job and
avoid severall warning at compile time as:
[...]
binfmt_elf.c:225: warning: passing arg 1 of `__put_kernel_asm64' makes integer
from pointer without a cast
binfmt_elf.c:225: warning: passing arg 1 of `__put_user_asm64' makes integer
from pointer without a cast
binfmt_elf.c:226: warning: passing arg 1 of `__put_kernel_asm64' makes integer
from pointer without a cast
binfmt_elf.c:226: warning: passing arg 1 of `__put_user_asm64' makes integer
from pointer without a cast
binfmt_elf.c:236: warning: passing arg 1 of `__put_kernel_asm64' makes integer
from pointer without a cast
binfmt_elf.c:236: warning: passing arg 1 of `__put_user_asm64' makes integer
from pointer without a cast
[...]

Thanks in advance for your attention,
    Joel




---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be
