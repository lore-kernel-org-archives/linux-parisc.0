From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Fix TLB related boot crash on SMP machines
Date: Thu, 8 Dec 2016 21:00:46 +0100
Message-ID: <20161208200046.GA5248@ls3530>
References: <20161207205240.GA5917@ls3530>
 <20161207213414.hliciockser6d5da@raspberrypi-2.musicnaut.iki.fi>
 <53d038e2-a697-8e20-4225-48034af5aaf4@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <53d038e2-a697-8e20-4225-48034af5aaf4@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

At bootup we run measurements to calculate the best threshold for when we
should be using full TLB flushes instead of just flushing a specific amount of
TLB entries.  This performance test is run over the kernel text segment.

But running this TLB performance test on the kernel text segment turned out to
crash some SMP machines when the kernel text pages were mapped as huge pages.

To avoid those crashes this patch simply skips this test on some SMP machines
and calculates an optimal threshold based on the maximum number of available
TLB entries and number of online CPUs.

On a technical side, this seems to happen:
The TLB measurement code uses flush_tlb_kernel_range() to flush specific TLB
entries with a page size of 4k (pdtlb 0(sr1,addr)). On UP systems this purge
instruction seems to work without problems even if the pages were mapped as
huge pages.  But on SMP systems the TLB purge instruction is broadcasted to
other CPUs. Those CPUs then crash the machine because the page size is not as
expected.  C8000 machines with PA8800/PA8900 CPUs were not affected by this
problem, because the required cache coherency prohibits to use huge pages at
all.  Sadly I didn't found any documentation about this behaviour, so this
finding is purely based on testing with phyiscal SMP machines (A500-44 and
J5000, both were 2-way boxes).

Cc: <stable@vger.kernel.org> # v3.18+
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index c263301..977f0a4f 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -393,6 +393,15 @@ void __init parisc_setup_cache_timing(void)
 
 	/* calculate TLB flush threshold */
 
+	/* On SMP machines, skip the TLB measure of kernel text which
+	 * has been mapped as huge pages. */
+	if (num_online_cpus() > 1 && !parisc_requires_coherency()) {
+		threshold = max(cache_info.it_size, cache_info.dt_size);
+		threshold *= PAGE_SIZE;
+		threshold /= num_online_cpus();
+		goto set_tlb_threshold;
+	}
+
 	alltime = mfctl(16);
 	flush_tlb_all();
 	alltime = mfctl(16) - alltime;
@@ -411,6 +420,8 @@ void __init parisc_setup_cache_timing(void)
 		alltime, size, rangetime);
 
 	threshold = PAGE_ALIGN(num_online_cpus() * size * alltime / rangetime);
+
+set_tlb_threshold:
 	if (threshold)
 		parisc_tlb_flush_threshold = threshold;
 	printk(KERN_INFO "TLB flush threshold set to %lu KiB\n",
