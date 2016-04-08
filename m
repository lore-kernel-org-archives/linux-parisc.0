From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix kernel crash with reversed copy_from_user()
Date: Fri, 8 Apr 2016 21:28:49 +0200
Message-ID: <20160408192849.GC4225@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kees Cook <keescook@chromium.org>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The kernel module testcase (lib/test_user_copy.c) exhibited a kernel
crash on parisc if the parameters for copy_from_user were reversed
("illegal reversed copy_to_user" testcase).

Fix this potential crash by checking the fault handler if the faulting
address is in the exception table.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 16e0735..97d6b20 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -795,6 +795,9 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 
 	    if (fault_space == 0 && !faulthandler_disabled())
 	    {
+		/* Clean up and return if in exception table. */
+		if (fixup_exception(regs))
+			return;
 		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
 		parisc_terminate("Kernel Fault", regs, code, fault_address);
 	    }
