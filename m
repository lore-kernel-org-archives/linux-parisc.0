Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id MAA04273
	for <hppa-linux@sod.res.cmu.edu>; Mon, 22 Mar 1999 12:05:26 -0500
Received: from mailhost.rsn.hp.com (root@idiot.rsn.hp.com [15.99.200.11])
	by palrel3.hp.com (8.8.6 (PHNE_14041)/8.8.5tis) with ESMTP id JAA07108
	for <hppa-linux@thepuffingroup.com>; Mon, 22 Mar 1999 09:05:35 -0800 (PST)
Received: from helgaaspc.rsn.hp.com (root@helgaaspc.rsn.hp.com [15.99.148.145])
	by mailhost.rsn.hp.com (8.8.6 (PHNE_14041)/8.8.6) with ESMTP id LAA26138
	for <hppa-linux@thepuffingroup.com>; Mon, 22 Mar 1999 11:05:09 -0600 (CST)
Received: from helgaaspc.rsn.hp.com (helgaas@localhost [127.0.0.1])
	by helgaaspc.rsn.hp.com (8.8.7/8.8.7) with ESMTP id LAA01108
	for <hppa-linux@thepuffingroup.com>; Mon, 22 Mar 1999 11:05:09 -0600
Message-Id: <199903221705.LAA01108@helgaaspc.rsn.hp.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Picky details of TLB fault handlers 
Date: Mon, 22 Mar 1999 11:05:09 -0600
From: Bjorn Helgaas <helgaas@rsn.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Christopher Neufeld wrote
>
>The PA-RISC 2.0 documentation says that a (software) TLB miss fault handler
>cannot use virtual addressing. OK, what constitutes an exit from the
>handler? Can you use virtual addressing after the last modification the
>handler makes to the TLB (perhaps after executing several instructions
>which don't require virtual addressing to load the pipeline), or do you
>have to execute an explicit return from interrupt?

I think you just have to make sure that you can recover from all the
TLB miss faults you might encounter.  In order to recover, you need the
program counter at the time the trap occurred.  If the PSW Q-bit was set
at the time of interruption, the PSW and program counter are captured in
the IPSW and IIA queues, and the PSW Q-bit is cleared.  When you do the
RFI to "return from interrupt", the PSW and program counter with which
to resume are taken from from the IPSW and IIA queues.

So the software TLB miss handler runs with the Q-bit off.  If another
interruption occurred with the Q-bit off, the IPSW and IIA queues
would still reflect the point of the original TLB miss, *not* the point
where the second interruption occurred, and you would have to think very
carefully about whether this is what you want.  If the second interruption
happened to be another TLB miss, you would not get the ISR/IOR (because
the Q-bit was off), so it would be pretty tough to handle it.

You can certainly save the IPSW and IIA queues somewhere, then turn on
the Q-bit, go virtual, and do your interrupt handling in virtual mode.
In this case, you will execute an RFI just in order to turn on the Q-bit,
but the program counter at which to resume will be somewhere in the
interrupt handler, not the point where the original interruption occurred.
When you eventually finish the interrupt handler, you look up your saved
IPSW and IIA queues and do another RFI to return "for real".

HP-UX does exactly this sort of thing for handling many traps and
interrupts.  It is fairly expensive, though, since you have to have
a stack on which to save the IPSW/IIAQ and probably a bunch of other
registers, and it's too much messing around for a TLB miss.

-------------
Bjorn Helgaas   helgaas@rsn.hp.com  telnet 1-497-3069  (972)497-3069
