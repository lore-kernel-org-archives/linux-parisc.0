From: Kyle McMartin <kyle@infradead.org>
Subject: dumping pid registers on panic
Date: Thu, 18 Dec 2008 11:44:04 -0500
Message-ID: <20081218164404.GB8535@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/assembly.h
index ffb2088..b152733 100644
--- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -447,6 +447,11 @@
 	mtctl	 %r0,	%cr18
 	SAVE_CR  (%cr18, PT_IAOQ1(\regs))
 
+	SAVE_CR	 (%cr8,  PT_PID0(\regs))
+	SAVE_CR	 (%cr9,  PT_PID1(\regs))
+	SAVE_CR	 (%cr12, PT_PID2(\regs))
+	SAVE_CR	 (%cr13, PT_PID3(\regs))
+
 #ifdef CONFIG_64BIT
 	/* cr11 (sar) is a funny one.  5 bits on PA1.1 and 6 bit on PA2.0
 	 * For PA2.0 mtsar or mtctl always write 6 bits, but mfctl only
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index 699cf8e..f3990fb 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -220,6 +220,10 @@ int main(void)
 	DEFINE(PT_SR5, offsetof(struct pt_regs, sr[ 5]));
 	DEFINE(PT_SR6, offsetof(struct pt_regs, sr[ 6]));
 	DEFINE(PT_SR7, offsetof(struct pt_regs, sr[ 7]));
+	DEFINE(PT_PID0, offsetof(struct pt_regs, protid[0]));
+	DEFINE(PT_PID1, offsetof(struct pt_regs, protid[1]));
+	DEFINE(PT_PID2, offsetof(struct pt_regs, protid[2]));
+	DEFINE(PT_PID3, offsetof(struct pt_regs, protid[3]));
 	DEFINE(PT_IASQ0, offsetof(struct pt_regs, iasq[0]));
 	DEFINE(PT_IASQ1, offsetof(struct pt_regs, iasq[1]));
 	DEFINE(PT_IAOQ0, offsetof(struct pt_regs, iaoq[0]));
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 4c771cd..e3effd9 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -91,6 +91,34 @@ static void print_gr(char *level, struct pt_regs *regs)
 		PRINTREGS(level, regs->gr, "r", RFMT, i);
 }
 
+static u32 __get_pid_from_cr(struct pt_regs *regs, int i)
+{
+#ifdef CONFIG_64BIT
+	return (regs->protid[(i&1?i^1:i)>>1] >> (i&1?32:0)) & 0xffffffff;
+#else
+	return regs->cr[pid_cr[i]];
+#endif /*CONFIG_64BIT*/
+}
+
+#ifdef CONFIG_64BIT
+# define MAX_PROT_IDS	8
+#else
+# define MAX_PROT_IDS	4
+#endif /*CONFIG_64BIT*/
+
+static void print_pids(char *level, struct pt_regs *regs)
+{
+	int i;
+
+#define PROTID(x)	__get_pid_from_cr(regs, x)
+	for (i = 0; i < MAX_PROT_IDS; i += 4) {
+		printk("%sprot_id%d-%d    %08x %08x %08x %08x\n",
+			level, i, i+3, PROTID(i), PROTID(i+1), PROTID(i+2),
+			PROTID(i+3));
+	}
+#undef PROTID
+}
+
 static void print_fr(char *level, struct pt_regs *regs)
 {
 	int i;
@@ -281,6 +309,7 @@ KERN_CRIT "                     ||     ||\n");
 	current->thread.flags |= PARISC_KERNEL_DEATH;
 
 	show_regs(regs);
+	print_pids(KERN_CRIT, regs);
 	dump_stack();
 	add_taint(TAINT_DIE);
 
