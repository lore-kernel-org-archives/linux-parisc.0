Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id E3A7A4842
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 08:42:30 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id KAA14125
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 10:42:25 -0400
Message-Id: <200109271442.KAA14125@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 27 Sep 2001 10:42:25 -0400
Sender: jurij@mail.lokmail.net
List-ID: <linux-parisc.vger.kernel.org>

Hi!

I hope I've got it right. It only emulates MFCTL and only when the
source control register is 27. It turns out, that pt_regs does not
have a member for cr26 and adding one does not look like an easy
task. 

Jurij.

--- linux-2.4.9-pa24/arch/parisc/kernel/traps.c Wed Sep 19 12:02:30 2001
+++ linux/arch/parisc/kernel/traps.c    Thu Sep 27 16:16:54 2001
@@ -273,6 +273,7 @@
 {
        unsigned long fault_address = 0;
        unsigned long fault_space = 0;
+       int fromcr,togr;
        struct siginfo si;
 #ifdef CONFIG_KWDB
        struct save_state ssp;
@@ -363,6 +364,17 @@
                si.si_code = ILL_PRVOPC;
                goto give_sigill;
        case 11:
+               if(!(regs->iir & 0xfc000000) && (((regs->iir & 0x1fe0)>>5) == 0x45)) {
+                 /* This is MFCTL instruction */
+                 fromcr = (regs->iir & 0x03e00000)>>21;
+                 togr = (regs->iir & 0x1f);
+                 /* Emulate the instruction if the read is from cr27 */
+                 if(fromcr == 27) {
+                   regs->gr[togr] = regs->cr27;
+                   return;
+                 }
+               }
+               /* Something else is wrong */
                die_if_kernel("Privileged register - shouldn't happen!", regs, code);
                si.si_code = ILL_PRVREG;
        give_sigill:
