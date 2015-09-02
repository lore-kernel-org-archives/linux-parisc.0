From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: additionally check for in_atomic() in page fault
 handler
Date: Wed, 2 Sep 2015 18:18:48 +0200
Message-ID: <20150902161848.GB2444@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Craig Estey <cae370@gmail.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Craig Estey noticed that we didn't checked for in_atomic() in our page fault
handler like other architectures. This commit adds this check by using
faulthandler_disabled() which includes a check for pagefault_disabled() and
in_atomic().

Reported-by: Craig Estey <cae370@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 15503ad..ac6f174 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -207,7 +207,7 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 	int fault;
 	unsigned int flags;
 
-	if (pagefault_disabled())
+	if (faulthandler_disabled())
 		goto no_context;
 
 	tsk = current;
