From: Zwane Mwaikambo <zwane@holomorphy.com>
Subject: [parisc-linux] [PATCH][2.5] smp_call_function_on_cpu for PARISC
Date: Fri, 17 Jan 2003 04:51:11 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0301170440560.24250-100000__7495.7248908051$1416622130$gmane$org@montezuma.mastecende.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Andrew Morton <akpm@digeo.com>,
	<parisc-linux@lists.parisc-linux.org>, <willy@debian.org>
To: Linux Kernel <linux-kernel@vger.kernel.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

This patch adds an smp_call_function which accepts a cpu bitmask instead 
of only doing a broadcast. One thing though, where is hweight64 on parisc?

	Zwane

Index: linux-2.5.58-cpu_hotplug/arch/parisc/kernel/smp.c
===================================================================
RCS file: /build/cvsroot/linux-2.5.58/arch/parisc/kernel/smp.c,v
retrieving revision 1.1.1.1
diff -u -r1.1.1.1 smp.c
--- linux-2.5.58-cpu_hotplug/arch/parisc/kernel/smp.c	14 Jan 2003 07:00:30 -0000	1.1.1.1
+++ linux-2.5.58-cpu_hotplug/arch/parisc/kernel/smp.c	17 Jan 2003 09:47:58 -0000
@@ -371,7 +371,89 @@
 	return 0;
 }
 
+/*
+ * smp_call_function_on_cpu - Runs func on all processors in the mask
+ *
+ * @func: The function to run. This must be fast and non-blocking.
+ * @info: An arbitrary pointer to pass to the function.
+ * @nonatomic: currently unused.
+ * @wait: If true, wait (atomically) until function has completed on other CPUs.
+ * @mask The bitmask of CPUs to call the function
+ * 
+ * Returns 0 on success, else a negative status code. Does not return until
+ * remote CPUs are nearly ready to execute func or have executed it.
+ *
+ */
 
+int
+smp_call_function_on_cpu (void (*func) (void *info), void *info, int retry, int wait,
+			  unsigned long mask)
+{
+	struct smp_call_struct data;
+	long timeout;
+	static spinlock_t lock = SPIN_LOCK_UNLOCKED;
+	int num_cpus = hweight32(mask), cpu, i, ret;
+	
+	cpu = get_cpu();
+	if ((1UL << cpu) & mask) {
+		ret = -EINVAL
+		goto out;
+	}
+
+	data.func = func;
+	data.info = info;
+	data.wait = wait;
+	atomic_set(&data.unstarted_count, num_cpus);
+	atomic_set(&data.unfinished_count, num_cpus);
+
+	if (retry) {
+		spin_lock (&lock);
+		while (smp_call_function_data != 0)
+			barrier();
+	}
+	else {
+		spin_lock (&lock);
+		if (smp_call_function_data) {
+			spin_unlock (&lock);
+			ret = -EBUSY;
+			goto out;
+		}
+	}
+
+	smp_call_function_data = &data;
+	spin_unlock (&lock);
+	
+	/*  Send a message to the target CPUs and wait */
+	for (i = 0; i < NR_CPUS; i++) {
+		if (!cpu_online(i) || !(mask & (1UL << i)))
+			continue;
+		send_IPI_single(i, IPI_CALL_FUNC);
+	}
+
+	/*  Wait for response  */
+	timeout = jiffies + HZ;
+	while ( (atomic_read (&data.unstarted_count) > 0) &&
+		time_before (jiffies, timeout) )
+		barrier ();
+
+	/* We either got one or timed out. Release the lock */
+
+	mb();
+	smp_call_function_data = NULL;
+	if (atomic_read (&data.unstarted_count) > 0) {
+		printk(KERN_CRIT "SMP CALL FUNCTION TIMED OUT! (cpu=%d)\n",
+		      cpu);
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	while (wait && atomic_read (&data.unfinished_count) > 0)
+			barrier ();
+	ret = 0;
+out:
+	put_cpu_no_resched();
+	return ret;
+}
 
 /*
  *	Setup routine for controlling SMP activation
-- 
function.linuxpower.ca
