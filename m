From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add wrapper for pdc_instr() firmware function
Date: Sun, 17 Sep 2017 21:15:09 +0200
Message-ID: <20170917191509.GA8511@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index 26b4455..510341f 100644
--- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -280,6 +280,7 @@ void setup_pdc(void);		/* in inventory.c */
 /* wrapper-functions from pdc.c */
 
 int pdc_add_valid(unsigned long address);
+int pdc_instr(unsigned int *instr);
 int pdc_chassis_info(struct pdc_chassis_info *chassis_info, void *led_info, unsigned long len);
 int pdc_chassis_disp(unsigned long disp);
 int pdc_chassis_warn(unsigned long *warn);
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index ab80e5c..6d471c0 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -233,6 +233,26 @@ int pdc_add_valid(unsigned long address)
 EXPORT_SYMBOL(pdc_add_valid);
 
 /**
+ * pdc_instr - Get instruction that invokes PDCE_CHECK in HPMC handler.
+ * @instr: Pointer to variable which will get instruction opcode.
+ *
+ * The return value is PDC_OK (0) in case call succeeded.
+ */
+int __init pdc_instr(unsigned int *instr)
+{
+	int retval;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	retval = mem_pdc_call(PDC_INSTR, 0UL, __pa(pdc_result));
+	convert_to_wide(pdc_result);
+	*instr = pdc_result[0];
+	spin_unlock_irqrestore(&pdc_lock, flags);
+
+	return retval;
+}
+
+/**
  * pdc_chassis_info - Return chassis information.
  * @result: The return buffer.
  * @chassis_info: The memory buffer address.
