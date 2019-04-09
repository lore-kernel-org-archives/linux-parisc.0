Return-Path: <SRS0=WYTU=SL=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC4FC282CE
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 17:30:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D7D720857
	for <linux-parisc@archiver.kernel.org>; Tue,  9 Apr 2019 17:30:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="c0/BSZ/6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfDIRak (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 9 Apr 2019 13:30:40 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:59506 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfDIRak (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 9 Apr 2019 13:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=ZZ5RSNT7eP+pb8KpD87L9Auodw91/8eHVYgP6WqTJ5k=; b=c0/BSZ/6pTloultIBwtpw/YpFW
        NdeAUBtnNr/wPN2qCoYVtBbznL4oxnNpc/CF42bUOUc+VG2kH9eFsASmobvBo114abothEw4OVmzB
        EPM94M5hM0lmsMGW2PQyj8fMKHNFl797pYm53hsCoZqQtgcv5uswNdbw3eoJFf+OT0XM=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hDuZy-0002co-NW; Tue, 09 Apr 2019 19:30:38 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 2/4] parisc: Implement kretprobes
Date:   Tue,  9 Apr 2019 19:30:28 +0200
Message-Id: <20190409173030.26234-3-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190409173030.26234-1-svens@stackframe.org>
References: <20190409173030.26234-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Implement kretprobes on parisc, parts stolen from powerpc.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/Kconfig          |   1 +
 arch/parisc/kernel/kprobes.c | 110 ++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 7712688608f4..c8038165b81f 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -56,6 +56,7 @@ config PARISC
 	select NEED_SG_DMA_LENGTH
 	select HAVE_ARCH_KGDB
 	select HAVE_KPROBES
+	select HAVE_KRETPROBES
 
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
diff --git a/arch/parisc/kernel/kprobes.c b/arch/parisc/kernel/kprobes.c
index 8b1977cd3eb9..d58960b33bda 100644
--- a/arch/parisc/kernel/kprobes.c
+++ b/arch/parisc/kernel/kprobes.c
@@ -172,6 +172,112 @@ int __kprobes parisc_kprobe_ss_handler(struct pt_regs *regs)
 	return 1;
 }
 
+static inline void kretprobe_trampoline(void)
+{
+	asm volatile("nop");
+	asm volatile("nop");
+}
+
+static int __kprobes trampoline_probe_handler(struct kprobe *p,
+					      struct pt_regs *regs);
+
+static struct kprobe trampoline_p = {
+	.pre_handler = trampoline_probe_handler
+};
+
+static int __kprobes trampoline_probe_handler(struct kprobe *p,
+					      struct pt_regs *regs)
+{
+	struct kretprobe_instance *ri = NULL;
+	struct hlist_head *head, empty_rp;
+	struct hlist_node *tmp;
+	unsigned long flags, orig_ret_address = 0;
+	unsigned long trampoline_address = (unsigned long)trampoline_p.addr;
+	kprobe_opcode_t *correct_ret_addr = NULL;
+
+	INIT_HLIST_HEAD(&empty_rp);
+	kretprobe_hash_lock(current, &head, &flags);
+
+	/*
+	 * It is possible to have multiple instances associated with a given
+	 * task either because multiple functions in the call path have
+	 * a return probe installed on them, and/or more than one return
+	 * probe was registered for a target function.
+	 *
+	 * We can handle this because:
+	 *     - instances are always inserted at the head of the list
+	 *     - when multiple return probes are registered for the same
+	 *       function, the first instance's ret_addr will point to the
+	 *       real return address, and all the rest will point to
+	 *       kretprobe_trampoline
+	 */
+	hlist_for_each_entry_safe(ri, tmp, head, hlist) {
+		if (ri->task != current)
+			/* another task is sharing our hash bucket */
+			continue;
+
+		orig_ret_address = (unsigned long)ri->ret_addr;
+
+		if (orig_ret_address != trampoline_address)
+			/*
+			 * This is the real return address. Any other
+			 * instances associated with this task are for
+			 * other calls deeper on the call stack
+			 */
+			break;
+	}
+
+	kretprobe_assert(ri, orig_ret_address, trampoline_address);
+
+	correct_ret_addr = ri->ret_addr;
+	hlist_for_each_entry_safe(ri, tmp, head, hlist) {
+		if (ri->task != current)
+			/* another task is sharing our hash bucket */
+			continue;
+
+		orig_ret_address = (unsigned long)ri->ret_addr;
+		if (ri->rp && ri->rp->handler) {
+			__this_cpu_write(current_kprobe, &ri->rp->kp);
+			get_kprobe_ctlblk()->kprobe_status = KPROBE_HIT_ACTIVE;
+			ri->ret_addr = correct_ret_addr;
+			ri->rp->handler(ri, regs);
+			__this_cpu_write(current_kprobe, NULL);
+		}
+
+		recycle_rp_inst(ri, &empty_rp);
+
+		if (orig_ret_address != trampoline_address)
+			/*
+			 * This is the real return address. Any other
+			 * instances associated with this task are for
+			 * other calls deeper on the call stack
+			 */
+			break;
+	}
+
+	kretprobe_hash_unlock(current, &flags);
+
+	hlist_for_each_entry_safe(ri, tmp, &empty_rp, hlist) {
+		hlist_del(&ri->hlist);
+		kfree(ri);
+	}
+	instruction_pointer_set(regs, orig_ret_address);
+	return 1;
+}
+
+void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
+				      struct pt_regs *regs)
+{
+	ri->ret_addr = (kprobe_opcode_t *)regs->gr[2];
+
+	/* Replace the return addr with trampoline addr. */
+	regs->gr[2] = (unsigned long)trampoline_p.addr;
+}
+
+int __kprobes arch_trampoline_kprobe(struct kprobe *p)
+{
+	return p->addr == trampoline_p.addr;
+}
 bool arch_kprobe_on_func_entry(unsigned long offset)
 {
 	return !offset;
@@ -179,5 +285,7 @@ bool arch_kprobe_on_func_entry(unsigned long offset)
 
 int __init arch_init_kprobes(void)
 {
-	return 0;
+	trampoline_p.addr = (kprobe_opcode_t *)
+		dereference_function_descriptor(kretprobe_trampoline);
+	return register_kprobe(&trampoline_p);
 }
-- 
2.20.1

