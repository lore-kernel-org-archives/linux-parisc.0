From: tip-bot for Frederic Weisbecker <fweisbec@gmail.com>
Subject: [tip:core/rcu] parisc: Add missing RCU idle APIs on idle loop
Date: Wed, 26 Sep 2012 22:22:31 -0700
Message-ID: <tip-fbe752188d5589e7fcbb8e79824e560f77dccc92@git.kernel.org>
Reply-To: linux-kernel@vger.kernel.org, mingo@kernel.org, hpa@zytor.com,
	  paulmck@linux.vnet.ibm.com, fweisbec@gmail.com,
	  jejb@parisc-linux.org, josh@joshtriplett.org, tglx@linutronix.de,
	  linux-parisc@vger.kernel.org, deller@gmx.de
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: hpa@zytor.com, mingo@kernel.org, paulmck@linux.vnet.ibm.com,
	fweisbec@gmail.com, jejb@parisc-linux.org, josh@joshtriplett.org,
	tglx@linutronix.de, linux-parisc@vger.kernel.org, deller@gmx.de
To: linux-tip-commits@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit-ID:  fbe752188d5589e7fcbb8e79824e560f77dccc92
Gitweb:     http://git.kernel.org/tip/fbe752188d5589e7fcbb8e79824e560f77dccc92
Author:     Frederic Weisbecker <fweisbec@gmail.com>
AuthorDate: Wed, 22 Aug 2012 17:27:34 +0200
Committer:  Paul E. McKenney <paulmck@linux.vnet.ibm.com>
CommitDate: Sun, 23 Sep 2012 07:44:49 -0700

parisc: Add missing RCU idle APIs on idle loop

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
Cc: <stable@vger.kernel.org> # 3.3+
Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Reviewed-by: Josh Triplett <josh@joshtriplett.org>
---
 arch/parisc/kernel/process.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 2c05a92..8c6b6b6 100644
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
