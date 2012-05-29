From: Yong Zhang <yong.zhang0@gmail.com>
Subject: [RFC PATCH 03/10] parisc: smp: remove call to ipi_call_lock()/ipi_call_unlock()
Date: Tue, 29 May 2012 15:15:58 +0800
Message-ID: <1338275765-3217-4-git-send-email-yong.zhang0@gmail.com>
References: <1338275765-3217-1-git-send-email-yong.zhang0@gmail.com>
Cc: ralf@linux-mips.org, sshtylyov@mvista.com, david.daney@cavium.com,
	nikunj@linux.vnet.ibm.com, paulmck@linux.vnet.ibm.com,
	axboe@kernel.dk, mingo@kernel.org, tglx@linutronix.de,
	peterz@infradead.org, akpm@linux-foundation.org,
	srivatsa.bhat@linux.vnet.ibm.com,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1338275765-3217-1-git-send-email-yong.zhang0@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Yong Zhang <yong.zhang@windriver.com>

1) call_function.lock used in smp_call_function_many() is just to protect
   call_function.queue and &data->refs, cpu_online_mask is outside of the
   lock. And it's not necessary to protect cpu_online_mask,
   because data->cpumask is pre-calculate and even if a cpu is brougt up
   when calling arch_send_call_function_ipi_mask(), it's harmless because
   validation test in generic_smp_call_function_interrupt() will take care
   of it.

2) For cpu down issue, stop_machine() will guarantee that no concurrent
   smp_call_fuction() is processing.

Signed-off-by: Yong Zhang <yong.zhang0@gmail.com>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/smp.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index a47828d..6266730 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -300,9 +300,7 @@ smp_cpu_init(int cpunum)
 
 	notify_cpu_starting(cpunum);
 
-	ipi_call_lock();
 	set_cpu_online(cpunum, true);
-	ipi_call_unlock();
 
 	/* Initialise the idle task for this CPU */
 	atomic_inc(&init_mm.mm_count);
-- 
1.7.5.4

