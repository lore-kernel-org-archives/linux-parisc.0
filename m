Return-Path: <SRS0=+2mb=SG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A47C10F0E
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 19:14:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4999C2147C
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Apr 2019 19:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="LstuqLGM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730153AbfDDTOy (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 4 Apr 2019 15:14:54 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:50044 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730232AbfDDTOy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Apr 2019 15:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=LfWjEt0Qe2nwML9/DjeZe4w0rBX+L3/jpeDYoiMX050=; b=LstuqLGM+nTI/qr9cdDNMkqzUP
        j2fbtf4CoNO2kM0EyaskNTVIEGcG0yL4/iVGMGzyEg2oFB2JsfoCZDwDl/5WH0rWPoQwBvamh8/6z
        EUKq3qRRnDr31ZDggopSKokLh2z0W0ClhZCpvK79IfHT14g+39pKnMdsXUk82NQa8Z1c=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hC7p6-00012K-84; Thu, 04 Apr 2019 21:14:52 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v2 3/3] parisc: add KGDB support
Date:   Thu,  4 Apr 2019 21:14:10 +0200
Message-Id: <20190404191410.3444-4-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190404191410.3444-1-svens@stackframe.org>
References: <20190404191410.3444-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This patch add KGDB support to PA-RISC. It also implements
single-stepping utilizing the recovery counter.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/Kconfig            |   1 +
 arch/parisc/include/asm/kgdb.h |  68 +++++++++++
 arch/parisc/kernel/Makefile    |   1 +
 arch/parisc/kernel/kgdb.c      | 210 +++++++++++++++++++++++++++++++++
 arch/parisc/kernel/traps.c     |  17 +++
 5 files changed, 297 insertions(+)
 create mode 100644 arch/parisc/include/asm/kgdb.h
 create mode 100644 arch/parisc/kernel/kgdb.c

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
index 000000000000..f23e7f8f13a5
--- /dev/null
+++ b/arch/parisc/include/asm/kgdb.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * PA-RISC KGDB support
+ *
+ * Copyright (c) 2019 Sven Schnelle <svens@stackframe.org>
+ *
+ */
+
+#ifndef __PARISC_KGDB_H__
+#define __PARISC_KGDB_H__
+
+#define BREAK_INSTR_SIZE		4
+#define PARISC_KGDB_COMPILED_BREAK_INSN	0x3ffc01f
+#define PARISC_KGDB_BREAK_INSN		0x3ffa01f
+
+
+#define NUMREGBYTES			sizeof(struct parisc_gdb_regs)
+#define BUFMAX				4096
+
+#define CACHE_FLUSH_IS_SAFE		1
+
+#ifndef __ASSEMBLY__
+
+static inline void arch_kgdb_breakpoint(void)
+{
+	asm(".word %0" : : "i"(PARISC_KGDB_COMPILED_BREAK_INSN) : "memory");
+}
+
+struct parisc_gdb_regs {
+	unsigned long gpr[32];
+	unsigned long sar;
+	unsigned long iaoq_f;
+	unsigned long iasq_f;
+	unsigned long iaoq_b;
+	unsigned long iasq_b;
+	unsigned long eiem;
+	unsigned long iir;
+	unsigned long isr;
+	unsigned long ior;
+	unsigned long ipsw;
+	unsigned long __unused0;
+	unsigned long sr4;
+	unsigned long sr0;
+	unsigned long sr1;
+	unsigned long sr2;
+	unsigned long sr3;
+	unsigned long sr5;
+	unsigned long sr6;
+	unsigned long sr7;
+	unsigned long cr0;
+	unsigned long pid1;
+	unsigned long pid2;
+	unsigned long scrccr;
+	unsigned long pid3;
+	unsigned long pid4;
+	unsigned long cr24;
+	unsigned long cr25;
+	unsigned long cr26;
+	unsigned long cr27;
+	unsigned long cr28;
+	unsigned long cr29;
+	unsigned long cr30;
+
+	u64 fr[32];
+};
+
+#endif
+#endif
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index d29bbd1a73b2..5012da96c196 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -33,3 +33,4 @@ obj-$(CONFIG_64BIT)	+= perf.o perf_asm.o $(obj64-y)
 obj-$(CONFIG_PARISC_CPU_TOPOLOGY)	+= topology.o
 obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o
+obj-$(CONFIG_KGDB)			+= kgdb.o
diff --git a/arch/parisc/kernel/kgdb.c b/arch/parisc/kernel/kgdb.c
new file mode 100644
index 000000000000..30f6a7653356
--- /dev/null
+++ b/arch/parisc/kernel/kgdb.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
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
+#include <asm/patch.h>
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
+static int kgdb_notify(struct notifier_block *self,
+		       unsigned long cmd, void *ptr)
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
+	struct parisc_gdb_regs *gr = (struct parisc_gdb_regs *)gdb_regs;
+
+	memset(gr, 0, sizeof(struct parisc_gdb_regs));
+
+	memcpy(gr->gpr, regs->gr, sizeof(gr->gpr));
+	memcpy(gr->fr, regs->fr, sizeof(gr->fr));
+
+	gr->sr0 = regs->sr[0];
+	gr->sr1 = regs->sr[1];
+	gr->sr2 = regs->sr[2];
+	gr->sr3 = regs->sr[3];
+	gr->sr4 = regs->sr[4];
+	gr->sr5 = regs->sr[5];
+	gr->sr6 = regs->sr[6];
+	gr->sr7 = regs->sr[7];
+
+	gr->sar = regs->sar;
+	gr->iir = regs->iir;
+	gr->isr = regs->isr;
+	gr->ior = regs->ior;
+	gr->ipsw = regs->ipsw;
+	gr->cr27 = regs->cr27;
+
+	gr->iaoq_f = regs->iaoq[0];
+	gr->iasq_f = regs->iasq[0];
+
+	gr->iaoq_b = regs->iaoq[1];
+	gr->iasq_b = regs->iasq[1];
+}
+
+void gdb_regs_to_pt_regs(unsigned long *gdb_regs, struct pt_regs *regs)
+{
+	struct parisc_gdb_regs *gr = (struct parisc_gdb_regs *)gdb_regs;
+
+
+	memcpy(regs->gr, gr->gpr, sizeof(regs->gr));
+	memcpy(regs->fr, gr->fr, sizeof(regs->fr));
+
+	regs->sr[0] = gr->sr0;
+	regs->sr[1] = gr->sr1;
+	regs->sr[2] = gr->sr2;
+	regs->sr[3] = gr->sr3;
+	regs->sr[4] = gr->sr4;
+	regs->sr[5] = gr->sr5;
+	regs->sr[6] = gr->sr6;
+	regs->sr[7] = gr->sr7;
+
+	regs->sar = gr->sar;
+	regs->iir = gr->iir;
+	regs->isr = gr->isr;
+	regs->ior = gr->ior;
+	regs->ipsw = gr->ipsw;
+	regs->cr27 = gr->cr27;
+
+	regs->iaoq[0] = gr->iaoq_f;
+	regs->iasq[0] = gr->iasq_f;
+
+	regs->iaoq[1] = gr->iaoq_b;
+	regs->iasq[1] = gr->iasq_b;
+}
+
+void sleeping_thread_to_gdb_regs(unsigned long *gdb_regs,
+				struct task_struct *task)
+{
+	struct pt_regs *regs = task_pt_regs(task);
+	unsigned long gr30, iaoq;
+
+	gr30 = regs->gr[30];
+	iaoq = regs->iaoq[0];
+
+	regs->gr[30] = regs->ksp;
+	regs->iaoq[0] = regs->kpc;
+	pt_regs_to_gdb_regs(gdb_regs, regs);
+
+	regs->gr[30] = gr30;
+	regs->iaoq[0] = iaoq;
+
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
+	int ret = probe_kernel_read(bpt->saved_instr, (char *)bpt->bpt_addr,
+				BREAK_INSTR_SIZE);
+	if (ret)
+		return ret;
+
+	__patch_text((void *)bpt->bpt_addr,
+			*(unsigned int *)&arch_kgdb_ops.gdb_bpt_instr);
+	return ret;
+}
+
+int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
+{
+	__patch_text((void *)bpt->bpt_addr, *(unsigned int *)&bpt->saved_instr);
+	return 0;
+}
+
+int kgdb_arch_handle_exception(int trap, int signo,
+		int err_code, char *inbuf, char *outbuf,
+		struct pt_regs *regs)
+{
+	unsigned long addr;
+	char *p = inbuf + 1;
+
+	switch (inbuf[0]) {
+	case 'D':
+	case 'c':
+	case 'k':
+		kgdb_contthread = NULL;
+		kgdb_single_step = 0;
+
+		if (kgdb_hex2long(&p, &addr))
+			kgdb_arch_set_pc(regs, addr);
+		else if (trap == 9 && regs->iir ==
+				PARISC_KGDB_COMPILED_BREAK_INSN)
+			step_instruction_queue(regs);
+		return 0;
+	case 's':
+		kgdb_single_step = 1;
+		if (kgdb_hex2long(&p, &addr)) {
+			kgdb_arch_set_pc(regs, addr);
+		} else if (trap == 9 && regs->iir ==
+				PARISC_KGDB_COMPILED_BREAK_INSN) {
+			step_instruction_queue(regs);
+			mtctl(-1, 0);
+		} else {
+			mtctl(0, 0);
+		}
+		regs->gr[0] |= PSW_R;
+		return 0;
+
+	}
+	return -1;
+}
+
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 7e1ccafadf57..4a0516524f2a 100644
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
+	if (unlikely(iir == PARISC_KGDB_COMPILED_BREAK_INSN ||
+		iir == PARISC_KGDB_BREAK_INSN)) {
+		kgdb_handle_exception(9, SIGTRAP, 0, regs);
+		return;
+	}
+#endif
+
 	if (unlikely(iir != GDB_BREAK_INSN))
 		parisc_printk_ratelimited(0, regs,
 			KERN_DEBUG "break %d,%d: pid=%d command='%s'\n",
@@ -518,6 +527,14 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 	case  3:
 		/* Recovery counter trap */
 		regs->gr[0] &= ~PSW_R;
+
+#ifdef CONFIG_KGDB
+		if (kgdb_single_step) {
+			kgdb_handle_exception(0, SIGTRAP, 0, regs);
+			return;
+		}
+#endif
+
 		if (user_space(regs))
 			handle_gdb_break(regs, TRAP_TRACE);
 		/* else this must be the start of a syscall - just let it run */
-- 
2.20.1

