From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 21/23] [PARISC] Refactor show_regs in traps.c
Date: Sun, 25 Jun 2006 19:34:49 -0400
Message-ID: <11512784933523-git-send-email-kyle@parisc-linux.org>
References: <20060625233123.GC2837@athena.road.mcmartin.ca>
Reply-To: Kyle McMartin <kyle@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060625233123.GC2837@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

show_regs() was one bloaty function. Split it into a few cleaner
functions and define a clean macro to print a line of registers.

[And from Thibaut, only print fprs on a usermode trap.]

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

 arch/parisc/kernel/traps.c |   84 +++++++++++++++++++++-----------------------
 1 files changed, 40 insertions(+), 44 deletions(-)

b91fba22eff9ce81d60b078d4c4f9973a31692dc
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index ff20060..348344a 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -66,57 +66,42 @@ #define RFMT "%016lx"
 #else
 #define RFMT "%08lx"
 #endif
+#define FFMT "%016llx"	/* fpregs are 64-bit always */
 
-void show_regs(struct pt_regs *regs)
+#define PRINTREGS(lvl,r,f,fmt,x)	\
+	printk("%s%s%02d-%02d  " fmt " " fmt " " fmt " " fmt "\n",	\
+		lvl, f, (x), (x+3), (r)[(x)+0], (r)[(x)+1],		\
+		(r)[(x)+2], (r)[(x)+3])
+
+static void print_gr(char *level, struct pt_regs *regs)
 {
 	int i;
-	char buf[128], *p;
-	char *level;
-	unsigned long cr30;
-	unsigned long cr31;
-	/* carlos says that gcc understands better memory in a struct,
-	 * and it makes our life easier with fpregs -- T-Bone */
-	struct { u32 sw[2]; } s;
-	
-	level = user_mode(regs) ? KERN_DEBUG : KERN_CRIT;
-
-	printk("%s\n", level); /* don't want to have that pretty register dump messed up */
+	char buf[64];
 
+	printk("%s\n", level);
 	printk("%s     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI\n", level);
 	printbinary(buf, regs->gr[0], 32);
 	printk("%sPSW: %s %s\n", level, buf, print_tainted());
 
-	for (i = 0; i < 32; i += 4) {
-		int j;
-		p = buf;
-		p += sprintf(p, "%sr%02d-%02d ", level, i, i + 3);
-		for (j = 0; j < 4; j++) {
-			p += sprintf(p, " " RFMT, (i+j) == 0 ? 0 : regs->gr[i + j]);
-		}
-		printk("%s\n", buf);
-	}
+	for (i = 0; i < 32; i += 4)
+		PRINTREGS(level, regs->gr, "r", RFMT, i);
+}
 
-	for (i = 0; i < 8; i += 4) {
-		int j;
-		p = buf;
-		p += sprintf(p, "%ssr%d-%d  ", level, i, i + 3);
-		for (j = 0; j < 4; j++) {
-			p += sprintf(p, " " RFMT, regs->sr[i + j]);
-		}
-		printk("%s\n", buf);
-	}
+static void print_fr(char *level, struct pt_regs *regs)
+{
+	int i;
+	char buf[64];
+	struct { u32 sw[2]; } s;
 
 	/* FR are 64bit everywhere. Need to use asm to get the content
 	 * of fpsr/fper1, and we assume that we won't have a FP Identify
 	 * in our way, otherwise we're screwed.
 	 * The fldd is used to restore the T-bit if there was one, as the
 	 * store clears it anyway.
-	 * BTW, PA2.0 book says "thou shall not use fstw on FPSR/FPERs". */ 
-	__asm__ (
-		"fstd %%fr0,0(%1)	\n\t"
-		"fldd 0(%1),%%fr0	\n\t"
-		: "=m" (s) : "r" (&s) : "%r0"
-		);
+	 * PA2.0 book says "thou shall not use fstw on FPSR/FPERs" - T-Bone */
+	asm volatile ("fstd %%fr0,0(%1)	\n\t"
+		      "fldd 0(%1),%%fr0	\n\t"
+		      : "=m" (s) : "r" (&s) : "r0");
 
 	printk("%s\n", level);
 	printk("%s      VZOUICununcqcqcqcqcqcrmunTDVZOUI\n", level);
@@ -125,14 +110,25 @@ void show_regs(struct pt_regs *regs)
 	printk("%sFPER1: %08x\n", level, s.sw[1]);
 
 	/* here we'll print fr0 again, tho it'll be meaningless */
-	for (i = 0; i < 32; i += 4) {
-		int j;
-		p = buf;
-		p += sprintf(p, "%sfr%02d-%02d ", level, i, i + 3);
-		for (j = 0; j < 4; j++)
-			p += sprintf(p, " %016llx", (i+j) == 0 ? 0 : regs->fr[i+j]);
-		printk("%s\n", buf);
-	}
+	for (i = 0; i < 32; i += 4)
+		PRINTREGS(level, regs->fr, "fr", FFMT, i);
+}
+
+void show_regs(struct pt_regs *regs)
+{
+	int i;
+	char *level;
+	unsigned long cr30, cr31;
+
+	level = user_mode(regs) ? KERN_DEBUG : KERN_CRIT;
+
+	print_gr(level, regs);
+
+	for (i = 0; i < 8; i += 4)
+		PRINTREGS(level, regs->sr, "sr", RFMT, i);
+
+	if (user_mode(regs))
+		print_fr(level, regs);
 
 	cr30 = mfctl(30);
 	cr31 = mfctl(31);
-- 
1.3.3

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
