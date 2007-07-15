From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] add __noreturn annotation
Date: Sun, 15 Jul 2007 14:53:45 +0200
Message-ID: <200707151453.45973.deller__35014.4989359707$1416624413$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Add __noreturn to parisc_terminate() as it does not return to caller.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index c3ec9f1..aebbfbc 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -414,7 +414,7 @@ void transfer_pim_to_trap_frame(struct pt_regs *regs)
  * has gone clearly wrong. We get called for faults in kernel space,
  * and HPMC's.
  */
-void parisc_terminate(char *msg, struct pt_regs *regs, int code, unsigned long offset)
+void __noreturn parisc_terminate(char *msg, struct pt_regs *regs, int code, unsigned long offset)
 {
 	static DEFINE_SPINLOCK(terminate_lock);
 
diff --git a/include/asm-parisc/traps.h b/include/asm-parisc/traps.h
index 1945f99..9dae13a 100644
--- a/include/asm-parisc/traps.h
+++ b/include/asm-parisc/traps.h
@@ -5,7 +5,7 @@
 struct pt_regs;
 
 /* traps.c */
-void parisc_terminate(char *msg, struct pt_regs *regs,
+void __noreturn parisc_terminate(char *msg, struct pt_regs *regs,
 		int code, unsigned long offset);
 
 /* mm/fault.c */

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
