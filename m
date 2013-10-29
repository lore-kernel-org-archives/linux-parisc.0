From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: check hardcoded value of SHMLBA against value
 reported by firmware
Date: Tue, 29 Oct 2013 22:05:44 +0100
Message-ID: <20131029210544.GA18167@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Our value of SHMLBA is hardcoded to 4MB on parisc due to aliasing restrictions
of the platform. The firmware function PDC_CACHE does return the machine
dependend value of this aliasing requirement.
So, if there is a difference between those two - which we don't expect - let's
report it at least.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index c035673..3523e20 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -142,6 +142,15 @@ parisc_cache_init(void)
 	if (pdc_cache_info(&cache_info) < 0)
 		panic("parisc_cache_init: pdc_cache_info failed");
 
+	/*
+	 * The alias field returned by PDC_CACHE specifies the aliasing
+	 * boundaries for virtual addresses.  So, let's verify if our hardcoded
+	 * value of SHMLBA (4 MB) is correct for this machine.
+	 */
+	if ((4096UL << (cache_info.dc_conf.cc_alias-1)) != SHMLBA)
+		pr_warn("WARNING: PDC_CACHE returns aliasing of %lu kB.\n",
+			(4UL << (cache_info.dc_conf.cc_alias-1)));
+
 #if 0
 	printk("ic_size %lx dc_size %lx it_size %lx\n",
 		cache_info.ic_size,
