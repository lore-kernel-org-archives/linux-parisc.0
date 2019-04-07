Return-Path: <SRS0=zQSf=SJ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6457DC282DD
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 18:11:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2ABE320896
	for <linux-parisc@archiver.kernel.org>; Sun,  7 Apr 2019 18:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="bU9znWOL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbfDGSLK (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 7 Apr 2019 14:11:10 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:42072 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbfDGSLJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 7 Apr 2019 14:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=F2BKsXac9AOYatfgmWo+5hj2M9pvMLOWGGqIVzIfJ6A=; b=bU9znWOLNZE4GXq5BL38EHaARI
        XizMRh+oZn9MB3wxGttzzLjZaUfQatAssQw1LbNQkjVrXd/F40M/Y6ArkTapZW5cdl66ChgPQmwa7
        OqZx4YzgG+/pn+/4wPUYZgJor6kI+bmEAAgbG3z/yf7KaHHwp1qH3ttmC2qJ0mjAerbA=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hDCG3-0000mt-KH; Sun, 07 Apr 2019 20:11:07 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     linux-parisc@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 2/2] parisc: Implement kprobes
Date:   Sun,  7 Apr 2019 20:10:58 +0200
Message-Id: <20190407181058.29728-3-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190407181058.29728-1-svens@stackframe.org>
References: <20190407181058.29728-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Implement kprobes support for PA-RISC.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/Kconfig               |   1 +
 arch/parisc/include/asm/kprobes.h |  55 +++++++++
 arch/parisc/kernel/Makefile       |   1 +
 arch/parisc/kernel/kprobes.c      | 183 ++++++++++++++++++++++++++++++
 arch/parisc/kernel/traps.c        |  14 +++
 5 files changed, 254 insertions(+)
 create mode 100644 arch/parisc/include/asm/kprobes.h
 create mode 100644 arch/parisc/kernel/kprobes.c

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index a80c19c7fc0e..7712688608f4 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -55,6 +55,7 @@ config PARISC
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
 	select HAVE_ARCH_KGDB
+	select HAVE_KPROBES
 
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
diff --git a/arch/parisc/include/asm/kprobes.h b/arch/parisc/include/asm/kprobes.h
new file mode 100644
index 000000000000..e09cf2deeafe
--- /dev/null
+++ b/arch/parisc/include/asm/kprobes.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * arch/parisc/include/asm/kprobes.h
+ *
+ * PA-RISC kprobes implementation
+ *
+ * Copyright (c) 2019 Sven Schnelle <svens@stackframe.org>
+ */
+
+#ifndef _PARISC_KPROBES_H
+#define _PARISC_KPROBES_H
+
+#ifdef CONFIG_KPROBES
+
+#include <asm-generic/kprobes.h>
+#include <linux/types.h>
+#include <linux/ptrace.h>
+#include <linux/notifier.h>
+
+#define PARISC_KPROBES_BREAK_INSN	0x3ff801f
+#define  __ARCH_WANT_KPROBES_INSN_SLOT
+#define MAX_INSN_SIZE 1
+
+typedef u32 kprobe_opcode_t;
+struct kprobe;
+
+void arch_remove_kprobe(struct kprobe *p);
+
+#define flush_insn_slot(p) \
+	flush_icache_range((unsigned long)&(p)->ainsn.insn[0], \
+			   (unsigned long)&(p)->ainsn.insn[0] + \
+			   sizeof(kprobe_opcode_t))
+
+#define kretprobe_blacklist_size    0
+
+struct arch_specific_insn {
+	kprobe_opcode_t *insn;
+};
+
+struct prev_kprobe {
+	struct kprobe *kp;
+	unsigned long status;
+};
+
+struct kprobe_ctlblk {
+	unsigned int kprobe_status;
+	struct prev_kprobe prev_kprobe;
+	unsigned long iaoq[2];
+};
+
+int __kprobes parisc_kprobe_break_handler(struct pt_regs *regs);
+int __kprobes parisc_kprobe_ss_handler(struct pt_regs *regs);
+
+#endif /* CONFIG_KPROBES */
+#endif /* _PARISC_KPROBES_H */
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 5012da96c196..b818b28c8a99 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -34,3 +34,4 @@ obj-$(CONFIG_PARISC_CPU_TOPOLOGY)	+= topology.o
 obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o
 obj-$(CONFIG_KGDB)			+= kgdb.o
+obj-$(CONFIG_KPROBES)			+= kprobes.o
diff --git a/arch/parisc/kernel/kprobes.c b/arch/parisc/kernel/kprobes.c
new file mode 100644
index 000000000000..8b1977cd3eb9
--- /dev/null
+++ b/arch/parisc/kernel/kprobes.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * arch/parisc/kernel/kprobes.c
+ *
+ * PA-RISC kprobes implementation
+ *
+ * Copyright (c) 2019 Sven Schnelle <svens@stackframe.org>
+ */
+
+#include <linux/types.h>
+#include <linux/kprobes.h>
+#include <linux/slab.h>
+#include <asm/cacheflush.h>
+#include <asm/patch.h>
+
+DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
+DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
+
+int __kprobes arch_prepare_kprobe(struct kprobe *p)
+{
+	if ((unsigned long)p->addr & 3UL)
+		return -EINVAL;
+
+	p->ainsn.insn = get_insn_slot();
+	if (!p->ainsn.insn)
+		return -ENOMEM;
+
+	memcpy(p->ainsn.insn, p->addr,
+		MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
+	p->opcode = *p->addr;
+	flush_insn_slot(p);
+	return 0;
+}
+
+void __kprobes arch_remove_kprobe(struct kprobe *p)
+{
+	if (!p->ainsn.insn)
+		return;
+
+	free_insn_slot(p->ainsn.insn, 0);
+	p->ainsn.insn = NULL;
+}
+
+void __kprobes arch_arm_kprobe(struct kprobe *p)
+{
+	patch_text(p->addr, PARISC_KPROBES_BREAK_INSN);
+}
+
+void __kprobes arch_disarm_kprobe(struct kprobe *p)
+{
+	patch_text(p->addr, p->opcode);
+}
+
+static void __kprobes save_previous_kprobe(struct kprobe_ctlblk *kcb)
+{
+	kcb->prev_kprobe.kp = kprobe_running();
+	kcb->prev_kprobe.status = kcb->kprobe_status;
+}
+
+static void __kprobes restore_previous_kprobe(struct kprobe_ctlblk *kcb)
+{
+	__this_cpu_write(current_kprobe, kcb->prev_kprobe.kp);
+	kcb->kprobe_status = kcb->prev_kprobe.status;
+}
+
+static inline void __kprobes set_current_kprobe(struct kprobe *p)
+{
+	__this_cpu_write(current_kprobe, p);
+}
+
+static void __kprobes setup_singlestep(struct kprobe *p,
+		struct kprobe_ctlblk *kcb, struct pt_regs *regs)
+{
+	kcb->iaoq[0] = regs->iaoq[0];
+	kcb->iaoq[1] = regs->iaoq[1];
+	regs->iaoq[0] = (unsigned long)p->ainsn.insn;
+	mtctl(0, 0);
+	regs->gr[0] |= PSW_R;
+}
+
+int __kprobes parisc_kprobe_break_handler(struct pt_regs *regs)
+{
+	struct kprobe *p;
+	struct kprobe_ctlblk *kcb;
+
+	preempt_disable();
+
+	kcb = get_kprobe_ctlblk();
+	p = get_kprobe((unsigned long *)regs->iaoq[0]);
+
+	if (!p) {
+		preempt_enable_no_resched();
+		return 0;
+	}
+
+	if (kprobe_running()) {
+		/*
+		 * We have reentered the kprobe_handler, since another kprobe
+		 * was hit while within the handler, we save the original
+		 * kprobes and single step on the instruction of the new probe
+		 * without calling any user handlers to avoid recursive
+		 * kprobes.
+		 */
+		save_previous_kprobe(kcb);
+		set_current_kprobe(p);
+		kprobes_inc_nmissed_count(p);
+		setup_singlestep(p, kcb, regs);
+		kcb->kprobe_status = KPROBE_REENTER;
+		return 1;
+	}
+
+	set_current_kprobe(p);
+	kcb->kprobe_status = KPROBE_HIT_ACTIVE;
+
+	/* If we have no pre-handler or it returned 0, we continue with
+	 * normal processing. If we have a pre-handler and it returned
+	 * non-zero - which means user handler setup registers to exit
+	 * to another instruction, we must skip the single stepping.
+	 */
+
+	if (!p->pre_handler || !p->pre_handler(p, regs)) {
+		setup_singlestep(p, kcb, regs);
+		kcb->kprobe_status = KPROBE_HIT_SS;
+	} else {
+		reset_current_kprobe();
+		preempt_enable_no_resched();
+	}
+	return 1;
+}
+
+int __kprobes parisc_kprobe_ss_handler(struct pt_regs *regs)
+{
+	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
+	struct kprobe *p = kprobe_running();
+
+	if (regs->iaoq[0] != (unsigned long)p->ainsn.insn+4)
+		return 0;
+
+	/* restore back original saved kprobe variables and continue */
+	if (kcb->kprobe_status == KPROBE_REENTER) {
+		restore_previous_kprobe(kcb);
+		return 1;
+	}
+
+	/* for absolute branch instructions we can copy iaoq_b. for relative
+	 * branch instructions we need to calculate the new address based on the
+	 * difference between iaoq_f and iaoq_b. We cannot use iaoq_b without
+	 * modificationt because it's based on our ainsn.insn address.
+	 */
+
+	if (p->post_handler)
+		p->post_handler(p, regs, 0);
+
+	switch (regs->iir >> 26) {
+	case 0x38: /* BE */
+	case 0x39: /* BE,L */
+	case 0x3a: /* BV */
+	case 0x3b: /* BVE */
+		/* for absolute branches, regs->iaoq[1] has already the right
+		 * address
+		 */
+		regs->iaoq[0] = kcb->iaoq[1];
+		break;
+	default:
+		regs->iaoq[1] = kcb->iaoq[0];
+		regs->iaoq[1] += (regs->iaoq[1] - regs->iaoq[0]) + 4;
+		regs->iaoq[0] = kcb->iaoq[1];
+		break;
+	}
+	kcb->kprobe_status = KPROBE_HIT_SSDONE;
+	reset_current_kprobe();
+	return 1;
+}
+
+bool arch_kprobe_on_func_entry(unsigned long offset)
+{
+	return !offset;
+}
+
+int __init arch_init_kprobes(void)
+{
+	return 0;
+}
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 4a0516524f2a..096e319adeb3 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -43,6 +43,7 @@
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <linux/kgdb.h>
+#include <linux/kprobes.h>
 
 #include "../math-emu/math-emu.h"	/* for handle_fpe() */
 
@@ -294,6 +295,14 @@ static void handle_break(struct pt_regs *regs)
 			(tt == BUG_TRAP_TYPE_NONE) ? 9 : 0);
 	}
 
+#ifdef CONFIG_KPROBES
+	if (unlikely(iir == PARISC_KPROBES_BREAK_INSN)) {
+		parisc_kprobe_break_handler(regs);
+		return;
+	}
+
+#endif
+
 #ifdef CONFIG_KGDB
 	if (unlikely(iir == PARISC_KGDB_COMPILED_BREAK_INSN ||
 		iir == PARISC_KGDB_BREAK_INSN)) {
@@ -528,6 +537,11 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 		/* Recovery counter trap */
 		regs->gr[0] &= ~PSW_R;
 
+#ifdef CONFIG_KPROBES
+		if (parisc_kprobe_ss_handler(regs))
+			return;
+#endif
+
 #ifdef CONFIG_KGDB
 		if (kgdb_single_step) {
 			kgdb_handle_exception(0, SIGTRAP, 0, regs);
-- 
2.20.1

