Return-Path: <SRS0=JaZV=NT=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B5AECDE47
	for <linux-parisc@archiver.kernel.org>; Thu,  8 Nov 2018 22:04:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30B49208E3
	for <linux-parisc@archiver.kernel.org>; Thu,  8 Nov 2018 22:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30B49208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbeKIHlj (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 9 Nov 2018 02:41:39 -0500
Received: from mout.gmx.net ([212.227.15.19]:45499 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731329AbeKIHli (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 9 Nov 2018 02:41:38 -0500
Received: from ls3530.dellerweb.de ([92.116.147.201]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MhiTL-1g8YJw0K8J-00MqcI; Thu, 08 Nov 2018 23:03:59 +0100
Date:   Thu, 8 Nov 2018 23:03:56 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Improve alternative live patching
Message-ID: <20181108220356.GA16610@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Provags-ID: V03:K1:MvZ6mYnNGHqkofy+eAtHPxYYQ+/IsS43jkvJuiS4fBUp8EsBMyC
 1bTstrEDiFWM1PCZ9OYeQFmfi+euGR2kzg+dhNBdnFqbuS0YXNJ6NFjNdyoproSNsJzJDeR
 HiCP9mDSdnjf0VJMzI4sfQsVTdH9Bs6aSqMKMDEd98gEhBp2y5yguvA1yT6tgOG0yVRz2ba
 ZqL7/a+fMEvWE0ikGRu3w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:vf2NnkFuFto=:iJd7Gg/YYnVJOSVNGqzrRJ
 gWSXbrvKBnynnX9mGEA/F7sg6ncrl2OUXZ5DAGw7QV/3a0jdKPI/T+Xs2e/jcV1m6IAWCF0V7
 UfgS2edcTfkEaRys/X9dAmDEhUH+C4f9wS0bUrH+LWTot7Lg/ctMWqp3KKNIH/lrd+/rhSZiu
 lVqhUAW/j4hXGbpbTdvG4rwvyiclQbbwQdBssspsa8obrXOow5xbRjP/hU5V52itXCnfihL65
 yM7sIZzHw+2u1GUGHyFL5+2fcK8BZvzu69vnB4V03259q2p1eBzQipsnxa/jQHjmDufgdnbaD
 wIMit4uAlXnN8ZwUtvHOYcz4orNzVp13d6+Ggdkn4q60tHfkVqwWPbHfceHOCqioC9PWu8LuO
 NDdCwI88hU8p9ulrnsxVDfbJFjzUaEOkOrqC/ORBV57MltKeXcSiXa45N7XU1PbRaiNVYcgAr
 LAMph2Uf+jyfj/zhsPbjFVw6/wIL2XfZbjGWciwv9iehtcGrE4HsiarnVNWigKeP8+Z+Pev6F
 riQRa0subftzdUpsD6uBx1Z4obaMGIoq6wjc6uRzOW69iy1B88x/4i2OuLoq4srUBb3E5lbkQ
 S18Eg2A3RzQoh3sFaIYb/6BL8z4tsXDYHZM84LotfxQZ9klO9U6IJdxioGLNw/+tC7uRVqkUk
 rlJd73wmE8tes79NztMcZemjYiwP6ItC9vEtYg+h47O7GTBUMvxsgBfzcQmRyWwr4GD5ovKhu
 qLSCLno+dXqQ8WXHrdoDlPlzvjZfczsKFBjehGaxVrb2eL2GakRMhBAwLGDaba67M40wlJXas
 BMot69bRy23IQlIbvGlkEH1qjNqD+fn/7NTwhEBL5ebNVU3tjqw/X7b3mY2OlOJEqk7ivq/it
 H46TCb/CVrSyfgKlJBY2csrgbIIeF3vlV7FI2USFI=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Move the alternative implemenation coding to alternative.c, add code to
patch modules when loaded and improve internal arch spinlocks when
running UP.

Suggested-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/alternative.h b/arch/parisc/include/asm/alternative.h
index bf485a94d0b4..a3630442111d 100644
--- a/arch/parisc/include/asm/alternative.h
+++ b/arch/parisc/include/asm/alternative.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_PARISC_ALTERNATIVE_H
 #define __ASM_PARISC_ALTERNATIVE_H
 
+#define ALT_COND_ALWAYS		0x80	/* always replace instruction */
 #define ALT_COND_NO_SMP		0x01	/* when running UP instead of SMP */
 #define ALT_COND_NO_DCACHE	0x02	/* if system has no d-cache  */
 #define ALT_COND_NO_ICACHE	0x04	/* if system has no i-cache  */
@@ -9,6 +10,7 @@
 #define ALT_COND_NO_IOC_FDC	0x10	/* if I/O cache does not need flushes */
 
 #define INSN_PxTLB	0x02		/* modify pdtlb, pitlb */
+#define INSN_LDI_CPUs	0x34000000	/* ldi val,%reg */
 #define INSN_NOP	0x08000240	/* nop */
 
 #ifndef __ASSEMBLY__
@@ -26,6 +28,9 @@ struct alt_instr {
 };
 
 void set_kernel_text_rw(int enable_read_write);
+void apply_alternatives_all(void);
+void apply_alternatives(struct alt_instr *start, struct alt_instr *end,
+	const char *module_name);
 
 /* Alternative SMP implementation. */
 #define ALTERNATIVE(cond, replacement)		"!0:"	\
diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cache.h
index 006fb939cac8..4b6eb5a702f5 100644
--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -61,6 +61,15 @@ void parisc_setup_cache_timing(void);
 			ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
 			ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) :: )
 
+#if CONFIG_SMP
+#define asm_online_cpus() ({ unsigned long __num;	\
+			asm volatile("ldi 0,%0"  /* 0 means yet unknown. */ \
+			ALTERNATIVE(ALT_COND_ALWAYS, INSN_LDI_CPUs) \
+			: "=r" (__num));	\
+			__num; })
+#else
+#define asm_online_cpus() (1)
+#endif
 #endif /* ! __ASSEMBLY__ */
 
 /* Classes of processor wrt: disabling space register hashing */
diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/asm/spinlock.h
index 8a63515f03bf..e70c15ca0886 100644
--- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -4,12 +4,18 @@
 
 #include <asm/barrier.h>
 #include <asm/ldcw.h>
+#include <asm/cache.h>
 #include <asm/processor.h>
 #include <asm/spinlock_types.h>
 
 static inline int arch_spin_is_locked(arch_spinlock_t *x)
 {
-	volatile unsigned int *a = __ldcw_align(x);
+	volatile unsigned int *a;
+
+	if (asm_online_cpus() == 1)
+		return 1;
+
+	a = __ldcw_align(x);
 	return *a == 0;
 }
 
@@ -20,6 +26,9 @@ static inline void arch_spin_lock_flags(arch_spinlock_t *x,
 {
 	volatile unsigned int *a;
 
+	if (asm_online_cpus() == 1)
+		return;
+
 	a = __ldcw_align(x);
 	while (__ldcw(a) == 0)
 		while (*a == 0)
@@ -36,6 +45,9 @@ static inline void arch_spin_unlock(arch_spinlock_t *x)
 {
 	volatile unsigned int *a;
 
+	if (asm_online_cpus() == 1)
+		return;
+
 	a = __ldcw_align(x);
 	mb();
 	*a = 1;
@@ -46,6 +58,9 @@ static inline int arch_spin_trylock(arch_spinlock_t *x)
 	volatile unsigned int *a;
 	int ret;
 
+	if (asm_online_cpus() == 1)
+		return 1;
+
 	a = __ldcw_align(x);
         ret = __ldcw(a) != 0;
 
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index e5de34d00b1a..8e5f1ab65c68 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -7,7 +7,7 @@ extra-y			:= head.o vmlinux.lds
 
 obj-y	     	:= cache.o pacache.o setup.o pdt.o traps.o time.o irq.o \
 		   pa7300lc.o syscall.o entry.o sys_parisc.o firmware.o \
-		   ptrace.o hardware.o inventory.o drivers.o \
+		   ptrace.o hardware.o inventory.o drivers.o alternative.o \
 		   signal.o hpmc.o real2.o parisc_ksyms.o unaligned.o \
 		   process.o processor.o pdc_cons.o pdc_chassis.o unwind.o
 
diff --git a/arch/parisc/kernel/alternative.c b/arch/parisc/kernel/alternative.c
new file mode 100644
index 000000000000..1a8383f22094
--- /dev/null
+++ b/arch/parisc/kernel/alternative.c
@@ -0,0 +1,106 @@
+/*
+ *    Alternative live-patching for parisc.
+ *    Copyright (C) 2018 Helge Deller <deller@gmx.de>
+ *
+ *    SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <asm/processor.h>
+#include <asm/sections.h>
+#include <asm/alternative.h>
+
+#include <linux/module.h>
+
+static int no_alternatives;
+static int __init setup_no_alternatives(char *str)
+{
+	no_alternatives = 1;
+	return 1;
+}
+__setup("no-alternatives", setup_no_alternatives);
+
+void __init_or_module apply_alternatives(struct alt_instr *start,
+		 struct alt_instr *end, const char *module_name)
+{
+	struct alt_instr *entry;
+	int index = 0, applied = 0;
+	int num_cpus = num_online_cpus();
+
+	for (entry = start; entry < end; entry++, index++) {
+
+		u32 *from, len, cond, replacement;
+
+		from = (u32 *)((ulong)&entry->orig_offset + entry->orig_offset);
+		len = entry->len;
+		cond = entry->cond;
+		replacement = entry->replacement;
+
+		WARN_ON(!cond);
+
+		if (cond != ALT_COND_ALWAYS && no_alternatives)
+			continue;
+
+		pr_debug("Check %d: Cond 0x%x, Replace %02d instructions @ 0x%px with 0x%08x\n",
+			index, cond, len, from, replacement);
+
+		if ((cond & ALT_COND_NO_SMP) && (num_cpus != 1))
+			continue;
+		if ((cond & ALT_COND_NO_DCACHE) && (cache_info.dc_size != 0))
+			continue;
+		if ((cond & ALT_COND_NO_ICACHE) && (cache_info.ic_size != 0))
+			continue;
+
+		/*
+		 * If the PDC_MODEL capabilities has Non-coherent IO-PDIR bit
+		 * set (bit #61, big endian), we have to flush and sync every
+		 * time IO-PDIR is changed in Ike/Astro.
+		 */
+		if ((cond & ALT_COND_NO_IOC_FDC) &&
+			(boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC))
+			continue;
+
+		/* Want to replace pdtlb by a pdtlb,l instruction? */
+		if (replacement == INSN_PxTLB) {
+			replacement = *from;
+			if (boot_cpu_data.cpu_type >= pcxu) /* >= pa2.0 ? */
+				replacement |= (1 << 10); /* set el bit */
+		}
+
+		/* Replace ldi num_cpus,%reg */
+		if (replacement == INSN_LDI_CPUs) {
+			replacement = *from;
+			replacement &= ~(31 << 1); /* mask out old values */
+			replacement |= (num_cpus << 1);
+		}
+
+		/*
+		 * Replace instruction with NOPs?
+		 * For long distance insert a branch instruction instead.
+		 */
+		if (replacement == INSN_NOP && len > 1)
+			replacement = 0xe8000002 + (len-2)*8; /* "b,n .+8" */
+
+		pr_debug("Do    %d: Cond 0x%x, Replace %02d instructions @ 0x%px with 0x%08x\n",
+			index, cond, len, from, replacement);
+
+		/* Replace instruction */
+		*from = replacement;
+		applied++;
+	}
+
+	pr_info("%s%salternatives: applied %d out of %d patches\n",
+		module_name ? : "", module_name ? " " : "",
+		applied, index);
+}
+
+
+void __init apply_alternatives_all(void)
+{
+	set_kernel_text_rw(1);
+
+	apply_alternatives((struct alt_instr *) &__alt_instructions,
+		(struct alt_instr *) &__alt_instructions_end, NULL);
+
+	set_kernel_text_rw(0);
+}
+
diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index b5b3cb00f1fb..43778420614b 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -877,6 +877,8 @@ int module_finalize(const Elf_Ehdr *hdr,
 	int i;
 	unsigned long nsyms;
 	const char *strtab = NULL;
+	const Elf_Shdr *s;
+	char *secstrings;
 	Elf_Sym *newptr, *oldptr;
 	Elf_Shdr *symhdr = NULL;
 #ifdef DEBUG
@@ -948,6 +950,18 @@ int module_finalize(const Elf_Ehdr *hdr,
 	nsyms = newptr - (Elf_Sym *)symhdr->sh_addr;
 	DEBUGP("NEW num_symtab %lu\n", nsyms);
 	symhdr->sh_size = nsyms * sizeof(Elf_Sym);
+
+	/* find .altinstructions section */
+	secstrings = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
+	for (s = sechdrs; s < sechdrs + hdr->e_shnum; s++) {
+		void *aseg = (void *) s->sh_addr;
+		char *secname = secstrings + s->sh_name;
+
+		if (!strcmp(".altinstructions", secname))
+			/* patch .altinstructions */
+			apply_alternatives(aseg, aseg + s->sh_size, me->name);
+	}
+
 	return 0;
 }
 
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index cd227f1cf629..2b108ee3b217 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -305,86 +305,6 @@ static int __init parisc_init_resources(void)
 	return 0;
 }
 
-static int no_alternatives __initdata;
-static int __init setup_no_alternatives(char *str)
-{
-	no_alternatives = 1;
-	return 1;
-}
-__setup("no-alternatives", setup_no_alternatives);
-
-static void __init apply_alternatives_all(void)
-{
-	struct alt_instr *entry;
-	int index = 0, applied = 0;
-
-
-	pr_info("alternatives: %spatching kernel code\n",
-		no_alternatives ? "NOT " : "");
-	if (no_alternatives)
-		return;
-
-	set_kernel_text_rw(1);
-
-	for (entry = (struct alt_instr *) &__alt_instructions;
-		entry < (struct alt_instr *) &__alt_instructions_end;
-		entry++, index++) {
-
-		u32 *from, len, cond, replacement;
-
-		from = (u32 *)((ulong)&entry->orig_offset + entry->orig_offset);
-		len = entry->len;
-		cond = entry->cond;
-		replacement = entry->replacement;
-
-		WARN_ON(!cond);
-		pr_debug("Check %d: Cond 0x%x, Replace %02d instructions @ 0x%px with 0x%08x\n",
-			index, cond, len, from, replacement);
-
-		if ((cond & ALT_COND_NO_SMP) && (num_online_cpus() != 1))
-			continue;
-		if ((cond & ALT_COND_NO_DCACHE) && (cache_info.dc_size != 0))
-			continue;
-		if ((cond & ALT_COND_NO_ICACHE) && (cache_info.ic_size != 0))
-			continue;
-
-		/*
-		 * If the PDC_MODEL capabilities has Non-coherent IO-PDIR bit
-		 * set (bit #61, big endian), we have to flush and sync every
-		 * time IO-PDIR is changed in Ike/Astro.
-		 */
-		if ((cond & ALT_COND_NO_IOC_FDC) &&
-			(boot_cpu_data.pdc.capabilities & PDC_MODEL_IOPDIR_FDC))
-			continue;
-
-		/* Want to replace pdtlb by a pdtlb,l instruction? */
-		if (replacement == INSN_PxTLB) {
-			replacement = *from;
-			if (boot_cpu_data.cpu_type >= pcxu) /* >= pa2.0 ? */
-				replacement |= (1 << 10); /* set el bit */
-		}
-
-		/*
-		 * Replace instruction with NOPs?
-		 * For long distance insert a branch instruction instead.
-		 */
-		if (replacement == INSN_NOP && len > 1)
-			replacement = 0xe8000002 + (len-2)*8; /* "b,n .+8" */
-
-		pr_debug("Do    %d: Cond 0x%x, Replace %02d instructions @ 0x%px with 0x%08x\n",
-			index, cond, len, from, replacement);
-
-		/* Replace instruction */
-		*from = replacement;
-		applied++;
-	}
-
-	pr_info("alternatives: applied %d out of %d patches\n", applied, index);
-
-	set_kernel_text_rw(0);
-}
-
-
 extern void gsc_init(void);
 extern void processor_init(void);
 extern void ccio_init(void);
