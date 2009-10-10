From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: remove unused IRQSTAT_SIRQ_PEND and IRQSTAT_SZ
	defines
Date: Sat, 10 Oct 2009 13:01:30 +0200
Message-ID: <20091010110130.GA31864@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


-- 
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index fcd3c70..ec787b4 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -244,9 +244,6 @@ int main(void)
 	DEFINE(THREAD_SZ, sizeof(struct thread_info));
 	DEFINE(THREAD_SZ_ALGN, align(sizeof(struct thread_info), 64));
 	BLANK();
-	DEFINE(IRQSTAT_SIRQ_PEND, offsetof(irq_cpustat_t, __softirq_pending));
-	DEFINE(IRQSTAT_SZ, sizeof(irq_cpustat_t));
-	BLANK();
 	DEFINE(ICACHE_BASE, offsetof(struct pdc_cache_info, ic_base));
 	DEFINE(ICACHE_STRIDE, offsetof(struct pdc_cache_info, ic_stride));
 	DEFINE(ICACHE_COUNT, offsetof(struct pdc_cache_info, ic_count));
