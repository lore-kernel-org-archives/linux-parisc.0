From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] [PARISC] Clean up syslog output of crashing
	userspace apps.
Date: Sun, 15 Jul 2007 15:00:58 +0200
Message-ID: <200707151500.59050.deller__1925.526923924$1416624413$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Clean up syslog output of crashing userspace apps.
With this patch the syslog will print:
  portmap(1480): invalid access to 0x8232b578 at ip=0x41192af3 (segfault code 15)
which is consistent with outher output like:
  hald-probe-stor(1672): unaligned access to 0xfafcbd26 at ip=0x00014013

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index f6f6755..8d6ddf8 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -208,14 +208,9 @@ bad_area:
 		struct siginfo si;
 
 #ifdef PRINT_USER_FAULTS
-		printk(KERN_DEBUG "\n");
-		printk(KERN_DEBUG "do_page_fault() pid=%d command='%s' type=%lu address=0x%08lx\n",
-		    tsk->pid, tsk->comm, code, address);
-		if (vma) {
-			printk(KERN_DEBUG "vm_start = 0x%08lx, vm_end = 0x%08lx\n",
-					vma->vm_start, vma->vm_end);
-		}
-		show_regs(regs);
+		printk(KERN_DEBUG "%s(%d): invalid access to 0x%08lx at ip=0x%08lx" 
+				  " (segfault code %lu)\n",
+		    tsk->comm, tsk->pid, address, regs->iaoq[0], code);
 #endif
 		/* FIXME: actually we need to get the signo and code correct */
 		si.si_signo = SIGSEGV;
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
