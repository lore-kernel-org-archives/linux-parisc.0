From: Kyle McMartin <kyle@infradead.org>
Subject: [PATCH] export length of os_hpmc vector
Date: Fri, 2 Jan 2009 20:35:40 -0500
Message-ID: <20090103013540.GG5181@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, gmsoft@tuxicoman.be
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index 2cbf13b..5595a2f 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -80,6 +80,7 @@ END(hpmc_pim_data)
 
 	.import intr_save, code
 ENTRY(os_hpmc)
+.os_hpmc:
 
 	/*
 	 * registers modified:
@@ -295,5 +296,10 @@ os_hpmc_6:
 	b .
 	nop
 ENDPROC(os_hpmc)
-ENTRY(os_hpmc_end)	/* this label used to compute os_hpmc checksum */
+.os_hpmc_end:
 	nop
+.data
+.align 4
+	.export os_hpmc_size
+os_hpmc_size:
+	.word .os_hpmc_end-.os_hpmc
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 4c771cd..cbf4794 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -821,8 +852,8 @@ void handle_interruption(int code, struct pt_regs *regs)
 
 int __init check_ivt(void *iva)
 {
-	extern const u32 os_hpmc[];
-	extern const u32 os_hpmc_end[];
+	extern u32 os_hpmc_size;
+	extern const u32 os_hpmc[];
 
 	int i;
 	u32 check = 0;
@@ -839,8 +870,7 @@ int __init check_ivt(void *iva)
 	    *ivap++ = 0;
 
 	/* Compute Checksum for HPMC handler */
