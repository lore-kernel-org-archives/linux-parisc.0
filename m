From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add PDCE_CHECK instruction to HPMC handler
Date: Sun, 17 Sep 2017 21:28:11 +0200
Message-ID: <20170917192811.GA8688@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

According to the programming note at page 1-31 of the PA 1.1 Firmware
Architecture document, one should use the PDC_INSTR firmware function to
get the instruction that invokes a PDCE_CHECK in the HPMC handler.  This
patch follows this note and sets the instruction which has been a nop up
until now.
Testing on a C3000 and C8000 showed that this firmware call isn't
implemented on those machines, so maybe it's only needed on older ones.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 991654c..23033315 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -817,7 +817,7 @@ void __init initialize_ivt(const void *iva)
 	u32 check = 0;
 	u32 *ivap;
 	u32 *hpmcp;
-	u32 length;
+	u32 length, instr;
 
 	if (strcmp((const char *)iva, "cows can fly"))
 		panic("IVT invalid");
@@ -827,6 +827,14 @@ void __init initialize_ivt(const void *iva)
 	for (i = 0; i < 8; i++)
 	    *ivap++ = 0;
 
+	/*
+	 * Use PDC_INSTR firmware function to get instruction that invokes
+	 * PDCE_CHECK in HPMC handler.  See programming note at page 1-31 of
+	 * the PA 1.1 Firmware Architecture document.
+	 */
+	if (pdc_instr(&instr) == PDC_OK)
+		ivap[0] = instr;
+
 	/* Compute Checksum for HPMC handler */
 	length = os_hpmc_size;
 	ivap[7] = length;
