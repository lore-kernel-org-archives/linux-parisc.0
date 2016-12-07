From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix TLB related boot crash with PA8000-PA8700 CPUs
Date: Wed, 7 Dec 2016 21:52:40 +0100
Message-ID: <20161207205240.GA5917@ls3530>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Machines with PA8000-PA8700 CPUs crash during startup while we measure
and calculate a good threshold for the TLB flush.

Avoid this crash by simply skipping the test until we figure out what
really triggers the crash.

Cc: <stable@vger.kernel.org> # v3.18+
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index c263301..63c10ea 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -393,6 +393,14 @@ void __init parisc_setup_cache_timing(void)
 
 	/* calculate TLB flush threshold */
 
+	/* skip TLB measure on PA8000-PA8700 CPUs */
+	if (boot_cpu_data.cpu_type >= pcxu &&
+	    boot_cpu_data.cpu_type <= pcxw2) {
+		threshold = max(cache_info.it_size, cache_info.dt_size);
+		threshold *= PAGE_SIZE;
+		goto set_tlb_threshold;
+	}
+
 	alltime = mfctl(16);
 	flush_tlb_all();
 	alltime = mfctl(16) - alltime;
@@ -411,6 +419,8 @@ void __init parisc_setup_cache_timing(void)
 		alltime, size, rangetime);
 
 	threshold = PAGE_ALIGN(num_online_cpus() * size * alltime / rangetime);
+
+set_tlb_threshold:
 	if (threshold)
 		parisc_tlb_flush_threshold = threshold;
 	printk(KERN_INFO "TLB flush threshold set to %lu KiB\n",
