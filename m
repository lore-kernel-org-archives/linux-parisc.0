From: Helge Deller <deller@gmx.de>
Subject: [PATCH] [workqueue] check values of pwq and wq in
 print_worker_info() before use
Date: Tue, 1 Oct 2013 22:35:20 +0200
Message-ID: <20131001203520.GA8248@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Tejun Heo <tj@kernel.org>, Libin <huawei.libin@huawei.com>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

print_worker_info() includes no validity check on the pwq and wq
pointers before handing them over to the probe_kernel_read() functions.

It seems that most architectures don't care about that, but at least on
the parisc architecture this leads to a kernel crash since accesses to
page zero are protected by the kernel for security reasons.

Fix this problem by verifying the contents of pwq and wq before usage.
Even if probe_kernel_read() usually prevents such crashes by disabling
page faults, clean code should always include such checks. 

Without this fix issuing "echo t > /proc/sysrq-trigger" will immediately
crash the Linux kernel on the parisc architecture.

CC: Tejun Heo <tj@kernel.org>
CC: Libin <huawei.libin@huawei.com>
CC: linux-parisc@vger.kernel.org
CC: James.Bottomley@HansenPartnership.com
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 987293d..c03b47f 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -4512,8 +4512,10 @@ void print_worker_info(const char *log_lvl, struct task_struct *task)
 	 */
 	probe_kernel_read(&fn, &worker->current_func, sizeof(fn));
 	probe_kernel_read(&pwq, &worker->current_pwq, sizeof(pwq));
-	probe_kernel_read(&wq, &pwq->wq, sizeof(wq));
-	probe_kernel_read(name, wq->name, sizeof(name) - 1);
+	if (pwq)
+		probe_kernel_read(&wq, &pwq->wq, sizeof(wq));
+	if (wq)
+		probe_kernel_read(name, wq->name, sizeof(name) - 1);
 
 	/* copy worker description */
 	probe_kernel_read(&desc_valid, &worker->desc_valid, sizeof(desc_valid));
