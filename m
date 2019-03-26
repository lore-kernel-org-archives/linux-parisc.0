Return-Path: <SRS0=ADlx=R5=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF586C43381
	for <linux-parisc@archiver.kernel.org>; Tue, 26 Mar 2019 08:48:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D11120856
	for <linux-parisc@archiver.kernel.org>; Tue, 26 Mar 2019 08:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="MfYdQZO3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730559AbfCZIsP (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 26 Mar 2019 04:48:15 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:35994 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbfCZIsP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 26 Mar 2019 04:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:
        To:From:Date; bh=LwD1tX8cwWi2EuklZWrsYJDvVATp+go4GxBHK/pTagc=; b=MfYdQZO3UblN
        B4S4MZV8K5dY92ac0fDAgeLHpmSruxPMBRJb7c7y9jB1iRjFYRruvnSH6EMcxt3DrRd8HhbccBzYd
        zjhJEQclLagLMb0LE1D1Thj2kYl25V2YVXMEjp81Svo+T4PuCtVB/geHb7u0stTMkOzm52qxAIQug
        V+Miw=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1h8hkh-0004PJ-Mk; Tue, 26 Mar 2019 09:48:11 +0100
Date:   Tue, 26 Mar 2019 09:48:09 +0100
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc@vger.kernel.org
Cc:     deller@gmx.de, Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>
Subject: [svens@stackframe.org: kgdb for parisc]
Message-ID: <20190326084808.GB17214@t470p.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi List,

i'm working on improving PA-RISC emulation on QEMU. To make it a bit easier
to test things on real Hardware, i've started implementing kgdb support for
PA-RISC. Most of the things work, however the kgdb test suite is giving me
a hard time with testing single stepping.

The log output looks like this:

[    3.942626] kgdb_arch_remove_breakpoint: 40ab6898, restoring insn 08030241
[    3.949518] kgdb_arch_set_breakpoint: 40ab6898
[    3.953967] kgdb_arch_set_breakpoint: saved insn 08030241
[    3.959374] kgdb_arch_handle_exception: trap 9 inbuf c iaoq 402ab520 iir 03ffc01f
[    3.966919] handle_break: 40ab6898
[    3.970419] kgdb_arch_remove_breakpoint: 40ab6898, restoring insn 08030241

[    3.977590] gdb_regs_to_pt_regs: iaoq F 40ab6898 B 40ab689c

KGDB setting front of Instruction queue to 40ab6898

[    3.983178] kgdb_arch_handle_exception: trap 9 inbuf  iaoq 40ab6898 iir 03ffa01f
[    3.990584] kgdb_arch_handle_exception: trap 9 inbuf s iaoq 40ab6898 iir 03ffa01f

It singlesteps...

[    3.998130] handle_interruption: 40ab689c
[    4.002510] gdb_regs_to_pt_regs: iaoq F 40ab689c B 40ab68a0
[    4.008351] gdb_regs_to_pt_regs: iaoq F 40ab689c B 40ab68a0
[    4.013923] kgdbts: BP mismatch 40ab689c expected 40ab6898

And is expecting the old address?!

I'm using the recovery counter of the CPU, and i'm not sure whether i'm missing some
detail of the Recovery counter, or some detail of kgdb tests.

If i single step with kdb in normal mode, it looks fine.

Can anyone give me a helping hand with this? I'm attaching the current (unfinished)
version of the patch i'm using.

Another thing is that for software breakpoints we would need to modify kernel text.
Currently it's EXEC only (which is good) but that doesn't work with kgdb for obvious
reasons. Would it be ok to set it to RWX when KGDB is enabled? I'm not feeling
comfortable messing with the TLB right now. Maybe later when i know a bit more
of the linux parisc implementation ;-)

Thanks
Sven


commit 12f66c180e5b15a8ce02c5053484541fe46cf62a
Author: Sven Schnelle <svens@stackframe.org>
Date:   Fri Mar 22 11:23:18 2019 +0100

    parisc: add KGDB support
    
    Signed-off-by: Sven Schnelle <svens@stackframe.org>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index c8e621296092..a80c19c7fc0e 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -54,6 +54,7 @@ config PARISC
 	select CPU_NO_EFFICIENT_FFS
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
+	select HAVE_ARCH_KGDB
 
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
diff --git a/arch/parisc/include/asm/kgdb.h b/arch/parisc/include/asm/kgdb.h
new file mode 100644
index 000000000000..cc4bbdb40027
--- /dev/null
+++ b/arch/parisc/include/asm/kgdb.h
@@ -0,0 +1,100 @@
+/* PA-RISC KGDB support
+ *
+ * Copyright (c) 2019 Sven Schnelle <svens@stackframe.org>
+ *
+ */
+
+#ifndef __PARISC_KGDB_H__
+#define __PARISC_KGDB_H__
+
+#define BREAK_INSTR_SIZE	4
+#define PARISC_KGDB_COMPILED_BREAK_INSN 0x3ffc01f
+#define PARISC_KGDB_BREAK_INSN 0x3ffa01f
+
+
+#define GDB_MAX_REGS		128
+#define NUMREGBYTES		(GDB_MAX_REGS << 2)
+#define BUFMAX			2048
+
+#define CACHE_FLUSH_IS_SAFE	1 /* TODO: check */
+
+#ifndef __ASSEMBLY__
+
+static inline void arch_kgdb_breakpoint(void)
+{
+
+	asm(".word 0x3ffc01f");
+}
+
+typedef enum {
+	GDB_PSW,
+	GDB_GPR1,
+	GDB_GPR2,
+	GDB_GPR3,
+	GDB_GPR4,
+	GDB_GPR5,
+	GDB_GPR6,
+	GDB_GPR7,
+	GDB_GPR8,
+	GDB_GPR9,
+	GDB_GPR10,
+	GDB_GPR11,
+	GDB_GPR12,
+	GDB_GPR13,
+	GDB_GPR14,
+	GDB_GPR15,
+	GDB_GPR16,
+	GDB_GPR17,
+	GDB_GPR18,
+	GDB_GPR19,
+	GDB_GPR20,
+	GDB_GPR21,
+	GDB_GPR22,
+	GDB_GPR23,
+	GDB_GPR24,
+	GDB_GPR25,
+	GDB_GPR26,
+	GDB_GPR27,
+	GDB_GPR28,
+	GDB_GPR29,
+	GDB_GPR30,
+	GDB_GPR31,
+
+	GDB_SAR,
+	GDB_IAOQ_F,
+	GDB_IASQ_F,
+	GDB_IAOQ_B,
+	GDB_IASQ_B,
+	GDB_EIEM,
+	GDB_IIR,
+	GDB_ISR,
+	GDB_IOR,
+	GDB_IPSW,
+	/* 42 is not used */
+	GDB_SR4 = 43,
+	GDB_SR0,
+	GDB_SR1,
+	GDB_SR2,
+	GDB_SR3,
+	GDB_SR5,
+	GDB_SR6,
+	GDB_SR7,
+	GDB_RC,
+	GDB_PID1,
+	GDB_PID2,
+	GDB_SCRCCR,
+	GDB_PID3,
+	GDB_PID4,
+	GDB_CR24,
+	GDB_CR25,
+	GDB_CR26,
+	GDB_CR27,
+	GDB_CR28,
+	GDB_CR29,
+	GDB_CR30,
+
+	/* TODO: FP regs */
+} hppa_gdb_regs_t;
+
+#endif
+#endif
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 8e5f1ab65c68..b1a69e3c91cd 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -32,3 +32,4 @@ obj-$(CONFIG_64BIT)	+= perf.o perf_asm.o $(obj64-y)
 obj-$(CONFIG_PARISC_CPU_TOPOLOGY)	+= topology.o
 obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o
+obj-$(CONFIG_KGDB)			+= kgdb.o
diff --git a/arch/parisc/kernel/kgdb.c b/arch/parisc/kernel/kgdb.c
new file mode 100644
index 000000000000..a004584541ba
--- /dev/null
+++ b/arch/parisc/kernel/kgdb.c
@@ -0,0 +1,242 @@
+/*
+ * PA-RISC KGDB support
+ *
+ * Copyright (c) 2019 Sven Schnelle <svens@stackframe.org>
+ *
+ */
+
+#include <linux/kgdb.h>
+#include <linux/string.h>
+#include <linux/sched.h>
+#include <linux/notifier.h>
+#include <linux/kdebug.h>
+#include <linux/uaccess.h>
+#include <asm/ptrace.h>
+#include <asm/traps.h>
+#include <asm/processor.h>
+#include <asm/cacheflush.h>
+
+const struct kgdb_arch arch_kgdb_ops = {
+	.gdb_bpt_instr = { 0x03, 0xff, 0xa0, 0x1f }
+};
+
+static int __kgdb_notify(struct die_args *args, unsigned long cmd)
+{
+	struct pt_regs *regs = args->regs;
+
+	if (kgdb_handle_exception(1, args->signr, cmd, regs))
+		return NOTIFY_DONE;
+	return NOTIFY_STOP;
+}
+
+static int kgdb_notify(struct notifier_block *self, unsigned long cmd, void *ptr)
+{
+	unsigned long flags;
+	int ret;
+
+	local_irq_save(flags);
+	ret = __kgdb_notify(ptr, cmd);
+	local_irq_restore(flags);
+
+	return ret;
+}
+
+static struct notifier_block kgdb_notifier = {
+	.notifier_call	= kgdb_notify,
+	.priority	= -INT_MAX,
+};
+
+int kgdb_arch_init(void)
+{
+	return register_die_notifier(&kgdb_notifier);
+}
+
+void kgdb_arch_exit(void)
+{
+	unregister_die_notifier(&kgdb_notifier);
+}
+
+void pt_regs_to_gdb_regs(unsigned long *gdb_regs, struct pt_regs *regs)
+{
+	int i;
+
+	memset(gdb_regs, 0, GDB_MAX_REGS * sizeof(unsigned long));
+
+	gdb_regs[GDB_PSW] = regs->gr[0]; /* PSW is in GR0 */
+
+	for(i = 0; i < 31; i++)
+		gdb_regs[GDB_GPR1 + i] = regs->gr[i + 1];
+
+	/* We can't use a loop here as registers are not in order */
+	gdb_regs[GDB_SR0] = regs->sr[0];
+	gdb_regs[GDB_SR1] = regs->sr[1];
+	gdb_regs[GDB_SR2] = regs->sr[2];
+	gdb_regs[GDB_SR3] = regs->sr[3];
+	gdb_regs[GDB_SR4] = regs->sr[4];
+	gdb_regs[GDB_SR5] = regs->sr[5];
+	gdb_regs[GDB_SR6] = regs->sr[6];
+	gdb_regs[GDB_SR7] = regs->sr[7];
+
+	gdb_regs[GDB_SAR] = regs->sar;
+	gdb_regs[GDB_IIR] = regs->iir;
+	gdb_regs[GDB_ISR] = regs->isr;
+	gdb_regs[GDB_IOR] = regs->ior;
+	gdb_regs[GDB_IPSW] = regs->ipsw;
+	gdb_regs[GDB_CR27] = regs->cr27;
+
+	gdb_regs[GDB_IAOQ_F] = regs->iaoq[0];
+	gdb_regs[GDB_IASQ_F] = regs->iasq[0];
+
+	gdb_regs[GDB_IAOQ_B] = regs->iaoq[1];
+	gdb_regs[GDB_IASQ_B] = regs->iasq[1];
+}
+
+void gdb_regs_to_pt_regs(unsigned long *gdb_regs, struct pt_regs *regs)
+{
+	int i;
+
+	regs->gr[0] = gdb_regs[GDB_PSW];
+
+	for(i = 0; i < 31; i++)
+		regs->gr[i + 1] = gdb_regs[GDB_GPR1 + i];
+
+	/* We can't use a loop here as registers are not in order */
+	regs->sr[0] = gdb_regs[GDB_SR0];
+	regs->sr[1] = gdb_regs[GDB_SR1];
+	regs->sr[2] = gdb_regs[GDB_SR2];
+	regs->sr[3] = gdb_regs[GDB_SR3];
+	regs->sr[4] = gdb_regs[GDB_SR4];
+	regs->sr[5] = gdb_regs[GDB_SR5];
+	regs->sr[6] = gdb_regs[GDB_SR6];
+	regs->sr[7] = gdb_regs[GDB_SR7];
+
+	regs->sar = gdb_regs[GDB_SAR];
+	regs->iir = gdb_regs[GDB_IIR];
+	regs->isr = gdb_regs[GDB_ISR];
+	regs->ior = gdb_regs[GDB_IOR];
+	regs->ipsw = gdb_regs[GDB_IPSW];
+	regs->cr27 = gdb_regs[GDB_CR27];
+
+	regs->iaoq[0] = gdb_regs[GDB_IAOQ_F];
+	regs->iasq[0] = gdb_regs[GDB_IASQ_F];
+
+	regs->iaoq[1] = gdb_regs[GDB_IAOQ_B];
+	regs->iasq[1] = gdb_regs[GDB_IASQ_B];
+}
+
+void sleeping_thread_to_gdb_regs(unsigned long *gdb_regs,
+				struct task_struct *task)
+{
+	int i;
+
+	struct pt_regs *regs = task_pt_regs(task);
+
+	memset(gdb_regs, 0, GDB_MAX_REGS * sizeof(unsigned long));
+
+	gdb_regs[GDB_PSW] = regs->gr[0]; /* PSW is in GR0 */
+	for(i = 0; i < 31; i++)
+		gdb_regs[GDB_GPR1 + i] = regs->gr[i + 1];
+
+	/* We can't use a loop here as registers are not in order */
+	regs->sr[0] = gdb_regs[GDB_SR0];
+	regs->sr[1] = gdb_regs[GDB_SR1];
+	regs->sr[2] = gdb_regs[GDB_SR2];
+	regs->sr[3] = gdb_regs[GDB_SR3];
+	regs->sr[4] = gdb_regs[GDB_SR4];
+	regs->sr[5] = gdb_regs[GDB_SR5];
+	regs->sr[6] = gdb_regs[GDB_SR6];
+	regs->sr[7] = gdb_regs[GDB_SR7];
+
+	gdb_regs[GDB_SAR] = regs->sar;
+	gdb_regs[GDB_IIR] = regs->iir;
+	gdb_regs[GDB_ISR] = regs->isr;
+	gdb_regs[GDB_IOR] = regs->ior;
+	gdb_regs[GDB_IPSW] = regs->ipsw;
+	gdb_regs[GDB_CR27] = regs->cr27;
+
+	gdb_regs[GDB_IAOQ_F] = regs->iaoq[0];
+	gdb_regs[GDB_IASQ_F] = regs->iasq[0];
+	gdb_regs[GDB_IAOQ_B] = regs->iaoq[1];
+	gdb_regs[GDB_IASQ_B] = regs->iaoq[1];
+}
+
+static void step_instruction_queue(struct pt_regs *regs)
+{
+	regs->iaoq[0] = regs->iaoq[1];
+	regs->iaoq[1] += 4;
+}
+
+void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long ip)
+{
+	regs->iaoq[0] = ip;
+	regs->iaoq[1] = ip + 4;
+}
+
+int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
+{
+	int ret;
+
+	ret = probe_kernel_read(bpt->saved_instr, (char *)bpt->bpt_addr,
+				BREAK_INSTR_SIZE);
+	if (ret)
+		return ret;
+
+	ret = probe_kernel_write((void *)bpt->bpt_addr,
+				arch_kgdb_ops.gdb_bpt_instr,
+				BREAK_INSTR_SIZE);
+	if (!ret)
+		flush_icache_range(bpt->bpt_addr, bpt->bpt_addr+4);
+	return ret;
+}
+
+int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
+{
+	int ret;
+
+	ret = probe_kernel_write((void *)bpt->bpt_addr,
+				bpt->saved_instr,
+				BREAK_INSTR_SIZE);
+	if (!ret)
+		flush_icache_range(bpt->bpt_addr, bpt->bpt_addr+4);
+	return ret;
+}
+
+int kgdb_arch_handle_exception(int trap, int signo,
+		int err_code, char *inbuf, char *outbuf,
+		struct pt_regs *regs)
+{
+	unsigned long addr;
+	char *p = inbuf + 1;
+
+	switch(inbuf[0]) {
+		case 'D':
+		case 'c':
+			kgdb_contthread = NULL;
+			kgdb_single_step = 0;
+
+			if (kgdb_hex2long(&p, &addr)) {
+				kgdb_arch_set_pc(regs, addr);
+			} else if (trap == 9 && regs->iir == PARISC_KGDB_COMPILED_BREAK_INSN) {
+				step_instruction_queue(regs);
+			}
+			return 0;
+		case 's':
+			kgdb_single_step = 1;
+
+			if (kgdb_hex2long(&p, &addr)) {
+				kgdb_arch_set_pc(regs, addr);
+			} else if (trap == 9 && regs->iir == PARISC_KGDB_COMPILED_BREAK_INSN) {
+				step_instruction_queue(regs);
+				mtctl(-1, 0);
+			} else {
+				mtctl(0, 0);
+			}
+			regs->gr[0] |= PSW_R;
+			return 0;
+		case 'k':
+			panic("killed by kgdb");
+			return 0;
+	}
+	return -1;
+}
+
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 7e1ccafadf57..ac0c4360d76a 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -42,6 +42,7 @@
 #include <asm/unwind.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
+#include <linux/kgdb.h>
 
 #include "../math-emu/math-emu.h"	/* for handle_fpe() */
 
@@ -293,6 +294,14 @@ static void handle_break(struct pt_regs *regs)
 			(tt == BUG_TRAP_TYPE_NONE) ? 9 : 0);
 	}
 
+#ifdef CONFIG_KGDB
+	if (unlikely(iir == PARISC_KGDB_COMPILED_BREAK_INSN) ||
+		unlikely(iir == PARISC_KGDB_BREAK_INSN)) {
+			kgdb_handle_exception(9, SIGTRAP, 0, regs);
+			return;
+	}
+#endif
+
 	if (unlikely(iir != GDB_BREAK_INSN))
 		parisc_printk_ratelimited(0, regs,
 			KERN_DEBUG "break %d,%d: pid=%d command='%s'\n",
@@ -518,6 +527,11 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 	case  3:
 		/* Recovery counter trap */
 		regs->gr[0] &= ~PSW_R;
+		if (kgdb_single_step) {
+			kgdb_handle_exception(3, SIGTRAP, 0, regs);
+			return;
+		}
+
 		if (user_space(regs))
 			handle_gdb_break(regs, TRAP_TRACE);
 		/* else this must be the start of a syscall - just let it run */
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index d0b166256f1a..39dbf0a31f8b 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -459,14 +459,22 @@ static void __init map_pages(unsigned long start_vaddr,
 				if (force)
 					pte =  __mk_pte(address, pgprot);
 				else if (parisc_text_address(vaddr)) {
+#ifdef CONFIG_KGDB
+					pte = __mk_pte(address, PAGE_KERNEL_RWX);
+#else
 					pte = __mk_pte(address, PAGE_KERNEL_EXEC);
+#endif
 					if (address >= ro_start && address < kernel_end)
 						pte = pte_mkhuge(pte);
 				}
 				else
 #if defined(CONFIG_PARISC_PAGE_SIZE_4KB)
 				if (address >= ro_start && address < ro_end) {
+#ifdef CONFIG_KGDB
+					pte = __mk_pte(address, PAGE_KERNEL_RWX);
+#else
 					pte = __mk_pte(address, PAGE_KERNEL_EXEC);
+#endif
 					pte = pte_mkhuge(pte);
 				} else
 #endif

----- End forwarded message -----
