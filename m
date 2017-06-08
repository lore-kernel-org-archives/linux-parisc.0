From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Avoid zeroing register 0 in fixup_exception()
Date: Thu, 8 Jun 2017 22:06:54 +0200
Message-ID: <20170608200654.GA26051@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Register gr[0] holds the PSW in interrupt context. It's absolutely
unlikely that the compiler will use register zero in a get_user() call,
but better BUG on such a case in fixup_exception() anyway.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 32ec221..e683b7f 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -163,6 +163,7 @@ int fixup_exception(struct pt_regs *regs)
 			/* zero target register for get_user() */
 			if (parisc_acctyp(0, regs->iir) == VM_READ) {
 				int treg = regs->iir & 0x1f;
+				BUG_ON(treg == 0);
 				regs->gr[treg] = 0;
 			}
 		}
