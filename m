From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] [PARISC] Fix kernel panic in check_ivt
Date: Mon, 4 Jun 2007 02:23:15 -0400
Message-ID: <20070604062315.GA12848__21925.7360826761$1416624387$gmane$org@fattire.cabal.ca>
References: <20070604054954.GA12289@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070604054954.GA12289@fattire.cabal.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 04, 2007 at 01:49:54AM -0400, Kyle McMartin wrote:
> From: Kyle McMartin <kyle@parisc-linux.org>
> 
> check_ivt had some seriously broken code wrt function pointers on
> parisc64. Instead of referencing the hpmc code via a function pointer,
> export symbols and reference it as a const array.
> 
> Thanks to jda for pointing out the broken 64-bit func ptr handling.
> 

Better(*) patch below...

[ Well, simpler is better, right? ]

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index d8baa15..43b41df 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -295,8 +295,5 @@ os_hpmc_6:
 	b .
 	nop
 ENDPROC(os_hpmc)
-
-	/* this label used to compute os_hpmc checksum */
-ENTRY(os_hpmc_end)
-
+ENTRY(os_hpmc_end)	/* this label used to compute os_hpmc checksum */
 	nop
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 0ba1d3d..c3ec9f1 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -802,13 +802,14 @@ void handle_interruption(int code, struct pt_regs *regs)
 
 int __init check_ivt(void *iva)
 {
+	extern const u32 os_hpmc[];
+	extern const u32 os_hpmc_end[];
+
 	int i;
 	u32 check = 0;
 	u32 *ivap;
 	u32 *hpmcp;
 	u32 length;
-	extern void os_hpmc(void);
-	extern void os_hpmc_end(void);
 
 	if (strcmp((char *)iva, "cows can fly"))
 		return -1;
@@ -820,7 +821,7 @@ int __init check_ivt(void *iva)
 
 	/* Compute Checksum for HPMC handler */
 
-	length = (u32)((unsigned long)os_hpmc_end - (unsigned long)os_hpmc);
+	length = os_hpmc_end - os_hpmc;
 	ivap[7] = length;
 
 	hpmcp = (u32 *)os_hpmc;
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
