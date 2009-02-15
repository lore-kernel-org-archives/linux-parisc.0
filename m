From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: oops_enter()/oops_exit() in die().
Date: Sun, 15 Feb 2009 23:03:11 +0100
Message-ID: <4998911F.7080705@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

As pointed out by Russell in http://marc.info/?l=linux-arch&m=118208089204630&w=2

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 7bf122a..c32f5d6 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -247,6 +247,8 @@ void die_if_kernel(char *str, struct pt_regs *regs, long err)
 
 	oops_in_progress = 1;
 
+	oops_enter();
+
 	/* Amuse the user in a SPARC fashion */
 	if (err) printk(
 KERN_CRIT "      _______________________________ \n"
@@ -293,6 +295,7 @@ KERN_CRIT "                     ||     ||\n");
 		panic("Fatal exception");
 	}
 
+	oops_exit();
 	do_exit(SIGSEGV);
 }
 
