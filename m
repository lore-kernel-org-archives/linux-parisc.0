Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id D207F483E
	for <parisc-linux@parisc-linux.org>; Sat,  1 Nov 2003 09:32:41 -0700 (MST)
Message-ID: <3FA3E027.3030409@tiscali.be>
Date: Sat, 01 Nov 2003 16:32:39 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Randolph Chung <randolph@tausq.org>,
	parisc-linux@parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] backport unaligned.c Randolph patch
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Randolph,

Here is the backport of your unaligned.c patch:

=====
--- unaligned.c.SAV     2003-11-01 15:26:14.000000000 +0000
+++ unaligned.c 2003-11-01 15:26:04.000000000 +0000
@@ -24,24 +24,6 @@
  #include <linux/config.h>
  #include <linux/sched.h>
  #include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/errno.h>
-#include <linux/ptrace.h>
-#include <linux/timer.h>
-#include <linux/mm.h>
-#include <linux/smp.h>
-#include <linux/smp_lock.h>
-#include <linux/spinlock.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <asm/system.h>
-#include <asm/uaccess.h>
-#include <asm/io.h>
-#include <asm/irq.h>
-#include <asm/atomic.h>
-
-#include <asm/smp.h>
-#include <asm/pdc.h>

  /* #define DEBUG_UNALIGNED 1 */

@@ -493,37 +475,6 @@
         struct siginfo si;
         register int flop=0;    /* true if this is a flop */

-       /* if the unaligned access is inside the kernel:
-        *   if the access is caused by a syscall, then we fault the calling
-        *     user process
-        */
-       if (!user_mode(regs))
-       {
-               const struct exception_table_entry *fix;
-
-               /* see if the offending code have its own
-                * exception handler
-                */
-
-               fix = search_exception_table(regs->iaoq[0]);
-               if (fix)
-               {
-                       /* lower bits of fix->skip are flags
-                        * upper bits are the handler addr
-                        */
-                       if (fix->skip & 1)
-                               regs->gr[8] = -EFAULT;
-                       if (fix->skip & 2)
-                               regs->gr[9] = 0;
-
-                       regs->iaoq[0] += ((fix->skip) & ~3);
-                       regs->iaoq[1] = regs->iaoq[0] + 4;
-                       regs->gr[0] &= ~PSW_B;
-
-                       return;
-               }
-       }
-
         /* log a message with pacing */
         if (user_mode(regs))
         {
=====

I check on my b2k: it compiles and boot well.

hth,
	Joel
