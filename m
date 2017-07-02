From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Report SIGSEGV instead of SIGBUS when running out of
 stack
Date: Sun, 2 Jul 2017 22:00:41 +0200
Message-ID: <20170702200041.GA15902@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

When a process runs out of stack the parisc kernel wrongly faults with SIGBUS
instead of the expected SIGSEGV signal.

This example shows how the kernel faults:
do_page_fault() command='a.out' type=15 address=0xfaac2000 in libc-2.24.so[f8308000+16c000]
trap #15: Data TLB miss fault, vm_start = 0xfa2c2000, vm_end = 0xfaac2000

The vma->vm_end value is the first address which does not belong to the vma, so
adjust the check to include vma->vm_end to the range for which to send the
SIGSEGV signal.

This patch unbreaks building the debian libsegv package.

Cc: stable@vger.kernel.org
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 32ec221..9fd95fe 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -367,7 +367,7 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 		case 15:	/* Data TLB miss fault/Data page fault */
 			/* send SIGSEGV when outside of vma */
 			if (!vma ||
-			    address < vma->vm_start || address > vma->vm_end) {
+			    address < vma->vm_start || address >= vma->vm_end) {
 				si.si_signo = SIGSEGV;
 				si.si_code = SEGV_MAPERR;
 				break;
