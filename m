From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add line-break when printing segfault info
Date: Mon, 2 Jan 2017 17:43:15 +0100
Message-ID: <20170102164315.GA17815@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add a leading line break else printed line gets too long.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: <stable@vger.kernel.org> # v4.9

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 8ff9253..1a0b4f6 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -234,7 +234,7 @@ show_signal_msg(struct pt_regs *regs, unsigned long code,
 	    tsk->comm, code, address);
 	print_vma_addr(KERN_CONT " in ", regs->iaoq[0]);
 
-	pr_cont(" trap #%lu: %s%c", code, trap_name(code),
+	pr_cont("\ntrap #%lu: %s%c", code, trap_name(code),
 		vma ? ',':'\n');
 
 	if (vma)
