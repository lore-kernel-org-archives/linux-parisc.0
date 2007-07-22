From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] [PATCH] [PARISC] Clean up syslog output of
Date: Sun, 22 Jul 2007 12:01:33 +0000
Message-ID: <46A3471D.6030704__42171.8076024719$1416624416$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
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

Hello Helge,

Just try your patch against latest 2.6.22-pa1 and it seems that:
@@ -303,7 +301,7 @@ static void handle_break(struct pt_regs *regs)
  	if (unlikely(iir == PARISC_BUG_BREAK_INSN && !user_mode(regs))) {
  		/* check if a BUG() or WARN() trapped here.  */
  		enum bug_trap_type tt;
-		tt = report_bug(regs->iaoq[0] & ~3, regs);
+		tt = report_bug(instruction_pointer(regs), regs);

should be
+		tt = report_bug(instruction_pointer(regs));

Hth,
	J.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
