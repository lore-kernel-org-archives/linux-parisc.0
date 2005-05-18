From: Kyle McMartin <kyle@there.is.no.cabal.ca>
Subject: [parisc-linux] [RFC] Make unaligned handling optional on a
	pre-process basis
Date: Wed, 18 May 2005 18:53:40 -0400
Message-ID: <20050518225340.GA8057@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: lamont@debian.org
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

Hi all,

LaMont wanted this for a Debian machine, so I bashed this out,
any objections?

 arch/parisc/kernel/unaligned.c |   16 ++++++++++------
 include/asm-parisc/processor.h |   19 +++++++++++++++++++
 kernel/sys.c                   |    1 +
 3 files changed, 30 insertions(+), 6 deletions(-)

kernel/sys.c :
	Add explicit include of processor.h since we're using macros that
	both hppa and ia64 use there.

arch/parisc/kernel/unaligned.c :
	Force a SIGBUS if desired on a per thread basis.

Index: arch/parisc/kernel/unaligned.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/unaligned.c,v
retrieving revision 1.14
diff -u -d -p -r1.14 unaligned.c
--- arch/parisc/kernel/unaligned.c	4 Oct 2004 19:12:49 -0000	1.14
+++ arch/parisc/kernel/unaligned.c	18 May 2005 22:50:12 -0000
@@ -513,15 +513,18 @@ void handle_unaligned(struct pt_regs *re
 	register int flop=0;	/* true if this is a flop */
 
 	/* log a message with pacing */
-	if (user_mode(regs))
-	{
-		if (unaligned_count > 5 && jiffies - last_time > 5*HZ)
-		{
+	if (user_mode(regs)) {
+                if (current->thread.flags & PARISC_UAC_SIGBUS) {
+                        goto force_sigbus;
+                }
+
+		if (unaligned_count > 5 && jiffies - last_time > 5*HZ) {
 			unaligned_count = 0;
 			last_time = jiffies;
 		}
-		if (++unaligned_count < 5)
-		{
+
+		if (!(current->thread.flags & PARISC_UAC_NOPRINT) 
+                    && ++unaligned_count < 5) {
 			char buf[256];
 			sprintf(buf, "%s(%d): unaligned access to 0x" RFMT " at ip=0x" RFMT "\n",
 				current->comm, current->pid, regs->ior, regs->iaoq[0]);
@@ -530,6 +533,7 @@ void handle_unaligned(struct pt_regs *re
 			show_regs(regs);
 #endif		
 		}
+
 		if (!unaligned_enabled)
 			goto force_sigbus;
 	}
Index: include/asm-parisc/processor.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/processor.h,v
retrieving revision 1.11
diff -u -d -p -r1.11 processor.h
--- include/asm-parisc/processor.h	12 Jan 2005 20:17:51 -0000	1.11
+++ include/asm-parisc/processor.h	18 May 2005 22:50:15 -0000
@@ -121,7 +121,26 @@ struct thread_struct {
 }; 
 
 /* Thread struct flags. */
+#define PARISC_UAC_NOPRINT	(1UL << 0)	/* see prctl and unaligned.c */
+#define PARISC_UAC_SIGBUS	(1UL << 1)
 #define PARISC_KERNEL_DEATH	(1UL << 31)	/* see die_if_kernel()... */
+
+#define PARISC_UAC_SHIFT	0
+#define PARISC_UAC_MASK		(PARISC_UAC_NOPRINT|PARISC_UAC_SIGBUS)
+
+#define SET_UNALIGN_CTL(task,value)                                       \
+        ({                                                                \
+        (task)->thread.flags = (((task)->thread.flags & ~PARISC_UAC_MASK) \
+                                | (((value) << PARISC_UAC_SHIFT) &        \
+                                   PARISC_UAC_MASK));                     \
+        0;                                                                \
+        })
+
+#define GET_UNALIGN_CTL(task,addr)                                        \
+        ({                                                                \
+        put_user(((task)->thread.flags & PARISC_UAC_MASK)                 \
+                 >> PARISC_UAC_SHIFT, (int __user *) (addr));             \
+        })
 
 #define INIT_THREAD { \
 	regs:	{	gr: { 0, }, \
Index: kernel/sys.c
===================================================================
RCS file: /var/cvs/linux-2.6/kernel/sys.c,v
retrieving revision 1.25
diff -u -d -p -r1.25 sys.c
--- kernel/sys.c	9 May 2005 02:01:00 -0000	1.25
+++ kernel/sys.c	18 May 2005 22:50:15 -0000
@@ -30,6 +30,7 @@
 #include <linux/compat.h>
 #include <linux/syscalls.h>
 
+#include <asm/processor.h>
 #include <asm/uaccess.h>
 #include <asm/io.h>
 #include <asm/unistd.h>
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
