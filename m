Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA28847
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Dec 1999 14:56:00 -0700
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by atlrel1.hp.com (Postfix) with ESMTP id 73AEE140F7
	for <parisc-linux@thepuffingroup.com>; Fri,  3 Dec 1999 15:52:41 -0500 (EST)
Received: (from frowand@localhost) by xsvr4.cup.hp.com (8.7.6/8.7.3) id MAA02894 for parisc-linux@thepuffingroup.com; Fri, 3 Dec 1999 12:52:12 -0800 (PST)
From: Frank Rowand <frowand@cup.hp.com>
Message-Id: <199912032052.MAA02894@xsvr4.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Fri, 03 Dec 1999 12:52:12 PST
Subject: [parisc-linux] bad news, good news, unkown (Temp CR used as permanent storage)
List-ID: <linux-parisc.vger.kernel.org>

Philipp kindly documented the Control Register usage a while ago...

> register  today           soon
> CR24      unused          what CR26 is today (I thought CR2[45] were readable
> CR25      unused          what CR25 is today  from userspace. stupid prumpf)
> CR26      used in head.S  unused
> CR27      used in head.S  unused
> CR28      temporary usage in interruption handlers [GR1  saved here]
> CR29      temporary usage in interruption handlers [arg0 (for the interruption
>                   handler, NOT GR26) saved here]
> CR30      current, 0 if in kernel mode (this might not work for syscalls yet)
> CR31      temporary usage in interruption handlers [GR29 saved here]


THE BAD NEWS

The bad news is that the PA-RISC architecture allows PDC to modify the
contents of the "Temporary" Control Registers, CR 24 - 31 (see "PA-RISC
1.1 Firmware Architecture Reference Specification: Processor Dependent
Code (PDC) Procedures" at
http://thepuffingroup.com/parisc/documentation.html, the table and
Note 5 on page 1-4).  If PDC does change the contents of these registers
then they cannot be used for permanent storage by the kernel unless the
kernel saves the registers before calling PDC and restores them after
the return from PDC.


THE GOOD NEWS

I have started the process of changing the architecture to require PDC
to preserve the state of the "Temporary" Control Registers.  So far,
there have been no objections to the change, but there is still some
time left for HP engineers to object (like if a current PDC implementation
violates the new architecture).  This means that implementations of
PDC for *future* machines should preserve the state of the Temporary
Control Registers.


THE UNKNOWN

Even if no one in HP objects to the new constraint on PDC, there is no
guarantee that existing PDC doesn't modify the Temporary Control
Registers.  No one is checking all the PDC implementations that have
ever shipped to ensure that they meet the new restriction.

However, there is a chance that existing PDC does not modify the
Temporary Control Registers, based on conversations with some
relevent engineers, and some theorizing.

(Of course, the obvious exception is that the Temporary Control
Registers are undefined when the kernel's HPMC handler is called.)

HP-UX does use some Temporary Control Registers for permanent
storage.  It saves the values of these registers before calling
PDC, and restores them when PDC returns.  I would recommend that
Linux follow this practice.


-Frank
