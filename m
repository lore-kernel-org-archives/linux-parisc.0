Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id B50DA482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Apr 2001 15:50:17 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id F3C8611FA
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Apr 2001 17:50:16 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id PAA17555
	for parisc-linux@lists.parisc-linux.org; Fri, 20 Apr 2001 15:50:16 -0600 (MDT)
Date: Fri, 20 Apr 2001 15:50:16 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200104202150.PAA17555@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel panic using cpio from cdrom to disk.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> Unexpected Interruption!: Code=0 regs=1027a080 (Addr=00000000)

Oops. It looks like you are getting an HPMC, however, when I recently
changed the interruption handlers to use shadow registers rather than
temporary control registers, I changed the convention for passing in
the trap "code". It looks like I missed changing the appropriate
code in the hpmc handler, so code got passed as 0, instead of
transferring the real hpmc trap data from pim, it reported what
was in the ipr's at the time the Q bit was last turned off.

> Like Ryans crash, PSW has only the Q bit set - data translation is
> turned off.  I guess that means the IAOQ values are real addresses, so I
> added 0x10000000 before looking them up in System.map.  In my case, it
> died on the "rsm 8,r0" under os_hpmc_5 in arch/parisc/kernel/hpmc.S.

It didn't die there. The Q bit was turned off there, so that was the
last place that the ipr's (iasq/iaoq/ipsw etc) tracked what was going
on. In fact the hpmc handler worked properly with the exception of
passing in a "1" for code, so you got some output. If the hpmc handler
hadn't worked, you would not have gotten anything.

Try applying the following patch to hpmc.S and you should get a little
more useful output:

--- hpmc.S.old	Fri Apr 20 15:22:02 2001
+++ hpmc.S	Fri Apr 20 15:24:13 2001
@@ -264,8 +264,7 @@ os_hpmc_5:
 	tovirt_r1 %r30      /* make sp virtual */
 
 	rsm 8,%r0           /* Clear Q bit */
-	ldi     1,%r1
-	mtctl   %r1,%cr29   /* Set trap code to "1" for HPMC */
+	ldi     1,%r8       /* Set trap code to "1" for HPMC */
 	mtctl   %r0,%cr30   /* Force interruptions to use hpmc stack */
 	ldil    L%PA(intr_save), %r1
 	ldo     R%PA(intr_save)(%r1), %r1

Let me know if the patch fixes the hpmc handler bug.

Note, your real problem is that you got an hpmc. Also note that the
hpmc handler only reports the hpmc pim information that is common to
all machines. There is a lot of machine specific hpmc information that
you can get once you reboot and type "ser pim 0 hpmc" at the boot
console prompt. Of course, decoding it can be difficult.

John
