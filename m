From: Helge Deller <deller@gmx.de>
Subject: [PATCH] fix crash when trying to unwind user space
Date: Sun, 24 Aug 2008 20:45:04 +0200
Message-ID: <200808242045.04499.deller@gmx.de>
References: <200808242026.06295.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200808242026.06295.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix kernel to not to try to unwind functions when crash
happens in userspace.
Without this patch kernel may needlessly crash for userspace faults.

Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 675f1d0..12276c8 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -121,18 +121,19 @@ static void print_fr(char *level, struct pt_regs *regs)
 
 void show_regs(struct pt_regs *regs)
 {
-	int i;
+	int i, user;
 	char *level;
 	unsigned long cr30, cr31;
 
-	level = user_mode(regs) ? KERN_DEBUG : KERN_CRIT;
+	user = user_mode(regs);
+	level = user ? KERN_DEBUG : KERN_CRIT;
 
 	print_gr(level, regs);
 
 	for (i = 0; i < 8; i += 4)
 		PRINTREGS(level, regs->sr, "sr", RFMT, i);
 
-	if (user_mode(regs))
+	if (user)
 		print_fr(level, regs);
 
 	cr30 = mfctl(30);
@@ -152,7 +153,8 @@ void show_regs(struct pt_regs *regs)
 	printk(level);
 	print_symbol(" RP(r2): %s\n", regs->gr[2]);
 
-	parisc_show_stack(current, NULL, regs);
+	if (!user)
+		parisc_show_stack(current, NULL, regs);
 }
 
 
