From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix crash when calling PDC_PAT_MEM PDT firmware
 function
Date: Tue, 25 Jul 2017 18:20:54 +0200
Message-ID: <20170725162054.GA12452@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit c9c2877d08d9 ("parisc: Add Page Deallocation Table (PDT) support")
introduced the pdc_pat_mem_read_pd_pdt() firmware helper function, which
crashed the system because it trashed the stack if the
pdc_pat_mem_read_pd_retinfo struct was located on the stack (and which is
in size less than the required 32 64-bit values).

Fix it by using the pdc_result struct instead when calling firmware and copy
the return values back into the result struct when finished sucessfully.

While debugging this code I noticed that the pdc_type wasn't set correctly
either, so let's fix that too.

Fixes: c9c2877d08d9 ("parisc: Add Page Deallocation Table (PDT) support")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 9819025..526ed90 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1481,12 +1481,19 @@ int pdc_pat_mem_read_pd_pdt(struct pdc_pat_mem_read_pd_retinfo *pret,
 		unsigned long offset)
 {
 	int retval;
-	unsigned long flags;
+	unsigned long flags, entries;
 
 	spin_lock_irqsave(&pdc_lock, flags);
 	retval = mem_pdc_call(PDC_PAT_MEM, PDC_PAT_MEM_PD_READ,
-		__pa(&pret), __pa(pdt_entries_ptr),
+		__pa(&pdc_result), __pa(pdt_entries_ptr),
 		count, offset);
+
+	if (retval == PDC_OK) {
+		entries = min(pdc_result[0], count);
+		pret->actual_count_bytes = entries;
+		pret->pdt_entries = entries / sizeof(unsigned long);
+	}
+
 	spin_unlock_irqrestore(&pdc_lock, flags);
 
 	return retval;
diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
index f3a797e..be8bed60 100644
--- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -112,10 +112,12 @@ void __init pdc_pdt_init(void)
 #ifdef CONFIG_64BIT
 		struct pdc_pat_mem_read_pd_retinfo pat_pret;
 
+		/* try old obsolete PAT firmware function first */
+		pdt_type = PDT_PAT_OLD;
 		ret = pdc_pat_mem_read_cell_pdt(&pat_pret, pdt_entry,
 			MAX_PDT_ENTRIES);
 		if (ret != PDC_OK) {
-			pdt_type = PDT_PAT_OLD;
+			pdt_type = PDT_PAT_NEW;
 			ret = pdc_pat_mem_read_pd_pdt(&pat_pret, pdt_entry,
 				MAX_PDT_TABLE_SIZE, 0);
 		}
