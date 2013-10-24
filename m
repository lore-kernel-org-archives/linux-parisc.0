From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: correctly display number of active CPUs
Date: Thu, 24 Oct 2013 21:45:42 +0200
Message-ID: <20131024194542.GA3530@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

In case we fail to power up other CPUs in a SMP system, the kernel
currently shows a wrong number of online CPUs. This change makes the
output more verbose on how many of the CPUs are online. Example:

CPU(s): 1 out of 2 PA8800 (Mako) at 900.000000 MHz online.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 7349a3f..16a1fb9 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -318,8 +318,8 @@ static int __init parisc_init(void)
 	pdc_stable_write(0x40, &osid, sizeof(osid));
 	
 	processor_init();
-	printk(KERN_INFO "CPU(s): %d x %s at %d.%06d MHz\n",
-			num_present_cpus(),
+	pr_info("CPU(s): %d out of %d %s at %d.%06d MHz online.\n",
+			num_online_cpus(), num_present_cpus(),
 			boot_cpu_data.cpu_name,
 			boot_cpu_data.cpu_hz / 1000000,
 			boot_cpu_data.cpu_hz % 1000000	);
