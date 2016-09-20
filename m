From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Check return value of smp_boot_one_cpu()
Date: Tue, 20 Sep 2016 17:29:32 +0200
Message-ID: <20160920152932.GA5245@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Check return value of smp_boot_one_cpu() whether CPU could be brought up.

Reported-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index c2a9cc5..75dab28 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -412,8 +412,8 @@ void smp_cpus_done(unsigned int cpu_max)
 
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
-	if (cpu != 0 && cpu < parisc_max_cpus)
-		smp_boot_one_cpu(cpu, tidle);
+	if (cpu != 0 && cpu < parisc_max_cpus && smp_boot_one_cpu(cpu, tidle))
+		return -ENOSYS;
 
 	return cpu_online(cpu) ? 0 : -ENOSYS;
 }
