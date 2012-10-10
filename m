From: <gregkh@linuxfoundation.org>
Subject: Patch "parisc: Add missing RCU idle APIs on idle loop" has been added to the 3.6-stable tree
Date: Wed, 10 Oct 2012 09:24:48 +0900
Message-ID: <13498286884028@kroah.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ASCII
Cc: <stable@vger.kernel.org>, <stable-commits@vger.kernel.org>
To: fweisbec@gmail.com, deller@gmx.de, gregkh@linuxfoundation.org,
	jejb@parisc-linux.org, josh@joshtriplett.org,
	linux-parisc@vger.kernel.org, paulmck@linux.vnet.ibm.com
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


This is a note to let you know that I've just added the patch titled

    parisc: Add missing RCU idle APIs on idle loop

to the 3.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     parisc-add-missing-rcu-idle-apis-on-idle-loop.patch
and it can be found in the queue-3.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From fbe752188d5589e7fcbb8e79824e560f77dccc92 Mon Sep 17 00:00:00 2001
From: Frederic Weisbecker <fweisbec@gmail.com>
Date: Wed, 22 Aug 2012 17:27:34 +0200
Subject: parisc: Add missing RCU idle APIs on idle loop

From: Frederic Weisbecker <fweisbec@gmail.com>

commit fbe752188d5589e7fcbb8e79824e560f77dccc92 upstream.

In the old times, the whole idle task was considered
as an RCU quiescent state. But as RCU became more and
more successful overtime, some RCU read side critical
section have been added even in the code of some
architectures idle tasks, for tracing for example.

So nowadays, rcu_idle_enter() and rcu_idle_exit() must
be called by the architecture to tell RCU about the part
in the idle loop that doesn't make use of rcu read side
critical sections, typically the part that puts the CPU
in low power mode.

This is necessary for RCU to find the quiescent states in
idle in order to complete grace periods.

Add this missing pair of calls in the parisc's idle loop.

Reported-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
Cc: James E.J. Bottomley <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Parisc <linux-parisc@vger.kernel.org>
Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Reviewed-by: Josh Triplett <josh@joshtriplett.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/parisc/kernel/process.c |    3 +++
 1 file changed, 3 insertions(+)

--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -48,6 +48,7 @@
 #include <linux/unistd.h>
 #include <linux/kallsyms.h>
 #include <linux/uaccess.h>
+#include <linux/rcupdate.h>
 
 #include <asm/io.h>
 #include <asm/asm-offsets.h>
@@ -69,8 +70,10 @@ void cpu_idle(void)
 
 	/* endless idle loop with no priority at all */
 	while (1) {
+		rcu_idle_enter();
 		while (!need_resched())
 			barrier();
+		rcu_idle_exit();
 		schedule_preempt_disabled();
 		check_pgt_cache();
 	}


Patches currently in stable-queue which might be from fweisbec@gmail.com are

queue-3.6/frv-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.6/cris-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.6/m68k-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.6/alpha-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.6/h8300-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.6/parisc-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.6/m32r-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.6/score-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.6/mn10300-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.6/xtensa-add-missing-rcu-idle-apis-on-idle-loop.patch
