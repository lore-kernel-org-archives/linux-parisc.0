From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Show DIMM slot number which holds broken memory
 module
Date: Tue, 25 Jul 2017 20:12:25 +0200
Message-ID: <20170725181225.GA22332@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The Page Deallocation Table (PDT) holds the physical addresses of all broken
memory addresses. With the physical address we now are able to show which DIMM
slot (e.g. 1a, 3c) actually holds the broken memory module so that users are
able to replace it.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
index 040d49b..fab374c 100644
--- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -133,11 +133,18 @@ void __init pdc_pdt_init(void)
 	}
 
 	for (i = 0; i < pdt_status.pdt_entries; i++) {
-		if (i < 20)
-			pr_warn("PDT: BAD PAGE #%d at 0x%08lx (error_type = %lu)\n",
-				i,
-				pdt_entry[i] & PAGE_MASK,
-				pdt_entry[i] & 1);
+		struct pdc_pat_mem_phys_mem_location loc;
+
+		/* get DIMM slot number */
+		loc.dimm_slot = 0xff;
+		pdc_pat_mem_get_dimm_phys_location(&loc, pdt_entry[i]);
+
+		pr_warn("PDT: BAD PAGE #%d at 0x%08lx, "
+			"DIMM slot %02x (error_type = %lu)\n",
+			i,
+			pdt_entry[i] & PAGE_MASK,
+			loc.dimm_slot,
+			pdt_entry[i] & 1);
 
 		/* mark memory page bad */
 		memblock_reserve(pdt_entry[i] & PAGE_MASK, PAGE_SIZE);
