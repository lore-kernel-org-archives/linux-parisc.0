From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Subject: [RESEND PATCH 1/2] parisc/CPU hotplug: Add missing call to
 notify_cpu_starting()
Date: Wed, 16 May 2012 00:32:17 +0530
Message-ID: <20120515190157.22459.91924.stgit@srivatsabhat>
References: <20120515190115.22459.93544.stgit@srivatsabhat>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: akpm@linux-foundation.org, mingo@kernel.org,
	a.p.zijlstra@chello.nl, mpatocka@redhat.com,
	stepanm@codeaurora.org, tglx@linutronix.de,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	dhowells@redhat.com, yasutake.koichi@jp.panasonic.com,
	eike-kernel@sf-tec.de, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, srivatsa.bhat@linux.vnet.ibm.com,
	linux-am33-list@redhat.com
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20120515190115.22459.93544.stgit@srivatsabhat>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The scheduler depends on receiving the CPU_STARTING notification, without
which we end up into a lot of trouble. So add the missing call to
notify_cpu_starting() in the bringup code.

Signed-off-by: Srivatsa S. Bhat <srivatsa.bhat@linux.vnet.ibm.com>
Acked-and-Tested-by: Mikulas Patocka <mpatocka@redhat.com>
Acked-and-Tested-by: Tobias Ulmer <tobiasu@tmux.org>
Tested-by: John David Anglin <dave.anglin@bell.net>
---

 arch/parisc/kernel/smp.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 0bb1d63..4dc7b79 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -31,6 +31,7 @@
 #include <linux/delay.h>
 #include <linux/bitops.h>
 #include <linux/ftrace.h>
+#include <linux/cpu.h>
 
 #include <linux/atomic.h>
 #include <asm/current.h>
@@ -295,8 +296,13 @@ smp_cpu_init(int cpunum)
 
 		printk(KERN_CRIT "CPU#%d already initialized!\n", cpunum);
 		machine_halt();
-	}  
+	}
+
+	notify_cpu_starting(cpunum);
+
+	ipi_call_lock();
 	set_cpu_online(cpunum, true);
+	ipi_call_unlock();
 
 	/* Initialise the idle task for this CPU */
 	atomic_inc(&init_mm.mm_count);

