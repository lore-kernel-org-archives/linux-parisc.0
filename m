From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: signal fixup - SIGBUS vs. SIGSEGV
Date: Thu, 7 Nov 2013 17:25:47 +0100
Message-ID: <20131107162547.GA12336@ls3530.dhcp.wdf.sap.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Clean up code to send correct signal on invalid memory accesses:
Send SIGBUS instead of SIGSEGV for memory accesses outside of mmap'ed areas

This fixes the mmap13 testcase from the Linux Test Project.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 0293588..6ab70d7 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -274,12 +274,22 @@ bad_area:
 		}
 		show_regs(regs);
 #endif
-		/* FIXME: actually we need to get the signo and code correct */
-		si.si_signo = SIGSEGV;
+		switch (code) {
+		case 15:	/* Data TLB miss fault/Data page fault */
+		case 17:	/* NA data TLB miss / page fault */
+		case 18:	/* Unaligned access - PCXS only */
+			si.si_signo = SIGBUS;
+			si.si_code = BUS_ADRERR;
+			break;
+		case 16:	/* Non-access instruction TLB miss fault */
+		case 26:	/* PCXL: Data memory access rights trap */
+		default:
+			si.si_signo = SIGSEGV;
+			si.si_code = SEGV_MAPERR;
+		}
 		si.si_errno = 0;
-		si.si_code = SEGV_MAPERR;
 		si.si_addr = (void __user *) address;
-		force_sig_info(SIGSEGV, &si, current);
+		force_sig_info(si.si_signo, &si, current);
 		return;
 	}
 
