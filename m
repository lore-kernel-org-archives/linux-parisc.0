From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: improve SIGBUS/SIGSEGV error reporting
Date: Mon, 18 Nov 2013 22:12:11 +0100
Message-ID: <20131118211211.GA2552@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch fixes most of the Linux Test Project testcases, e.g. fstat05.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 7584a5d..13ff454 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -282,16 +282,31 @@ bad_area:
 #endif
 		switch (code) {
 		case 15:	/* Data TLB miss fault/Data page fault */
+			/* Outside of vma area? -> send SIGSEGV */
+			if (!vma ||
+			    address < vma->vm_start || address > vma->vm_end)
+				goto send_sigsegv;
+
+			/* Wrong permissions? -> send SIGSEGV */
+			if ((vma->vm_flags & acc_type) != acc_type) {
+				si.si_signo = SIGSEGV;
+				si.si_code = SEGV_ACCERR;
+				break;
+			}
+
+			/* permissions & location OK, but end of mapped file? */
+			/* fall through */
 		case 17:	/* NA data TLB miss / page fault */
 		case 18:	/* Unaligned access - PCXS only */
-			si.si_signo = SIGBUS;
-			si.si_code = BUS_ADRERR;
+send_sigbus:		si.si_signo = SIGBUS;
+			si.si_code = (code == 18) ? BUS_ADRALN : BUS_ADRERR;
 			break;
 		case 16:	/* Non-access instruction TLB miss fault */
 		case 26:	/* PCXL: Data memory access rights trap */
 		default:
-			si.si_signo = SIGSEGV;
-			si.si_code = SEGV_MAPERR;
+send_sigsegv:		si.si_signo = SIGSEGV;
+			si.si_code = (code == 26) ? SEGV_ACCERR : SEGV_MAPERR;
+			break;
 		}
 		si.si_errno = 0;
 		si.si_addr = (void __user *) address;
