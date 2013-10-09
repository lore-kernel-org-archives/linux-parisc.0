From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: remove unused syscall_ipi() function.
Date: Wed, 9 Oct 2013 23:56:17 +0200
Message-ID: <20131009215617.GA30177@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 04e47c6..ebc877c 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -291,11 +291,6 @@ void die_if_kernel(char *str, struct pt_regs *regs, long err)
 	do_exit(SIGSEGV);
 }
 
-int syscall_ipi(int (*syscall) (struct pt_regs *), struct pt_regs *regs)
-{
-	return syscall(regs);
-}
