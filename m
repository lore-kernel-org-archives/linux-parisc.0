Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA08011
	for <parisc-linux@puffin.external.hp.com>; Tue, 6 Jul 1999 15:03:27 -0600
Received: from Galois.suse.de (Galois.suse.de [194.112.123.130])
	by Cantor.suse.de (Postfix) with ESMTP id 834A232CE1
	for <parisc-linux@thepuffingroup.com>; Tue, 06 Jul 1999 23:03:41 +0200 (MEST)
Received: from Wotan.suse.de (Wotan.suse.de [10.10.0.1])
	by Galois.suse.de (Postfix) with ESMTP id 5CFA19412
	for <parisc-linux@thepuffingroup.com>; Tue,  6 Jul 1999 23:03:41 +0200 (MEST)
Date: Tue, 6 Jul 1999 23:03:40 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990706230340.B29058@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Interrupt[ion]s
List-ID: <linux-parisc.vger.kernel.org>

The basic code to take interruptions and return from them now is there. (I'd
like to hear if it works on machines other than the A180 though). The next
step is to make sure we don't clobber all registers in this process, which
I think should not be a big problem.

I think we should have the following types of interruption handlers:

a) save all registers into the current task_struct, call interruption handler
   (this would be used for interruptions that might change the running task)

b) save caller-saved registers to stack, call interruption handler
   (this would be the faster, normal kind of interruption)

c) hand-written handlers that use the shadow registers

d) a hand-written handler for external interrupts, which I think I'll write
   soon (this handler will either do a)-style or b)-style register saving
   depending on the interrupt handler.

e) the firmware-supplied HPMC handler

Any comments ?

	Philipp Rumpf
