Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA06327
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Dec 1999 13:56:35 -0700
Date: Sat, 4 Dec 1999 21:26:23 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Frank Rowand <frowand@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] bad news, good news, unkown (Temp CR used as permanent storage)
Message-Id: <19991204212623.B19280@mathe.stud.uni-erlangen.de>
References: <199912032052.MAA02894@xsvr4.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199912032052.MAA02894@xsvr4.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> The bad news is that the PA-RISC architecture allows PDC to modify the
> contents of the "Temporary" Control Registers, CR 24 - 31 (see "PA-RISC
> 1.1 Firmware Architecture Reference Specification: Processor Dependent
> Code (PDC) Procedures" at
> http://thepuffingroup.com/parisc/documentation.html, the table and
> Note 5 on page 1-4).  If PDC does change the contents of these registers
> then they cannot be used for permanent storage by the kernel unless the
> kernel saves the registers before calling PDC and restores them after
> the return from PDC.

Right, we should save/restore them.

> THE GOOD NEWS
> 
> I have started the process of changing the architecture to require PDC
> to preserve the state of the "Temporary" Control Registers.  So far,
> there have been no objections to the change, but there is still some
> time left for HP engineers to object (like if a current PDC implementation
> violates the new architecture).  This means that implementations of
> PDC for *future* machines should preserve the state of the Temporary
> Control Registers.

How much of the PDC code actually uses interruptions ?

> THE UNKNOWN
> 
> Even if no one in HP objects to the new constraint on PDC, there is no
> guarantee that existing PDC doesn't modify the Temporary Control
> Registers.  No one is checking all the PDC implementations that have
> ever shipped to ensure that they meet the new restriction.
> 
> However, there is a chance that existing PDC does not modify the
> Temporary Control Registers, based on conversations with some
> relevent engineers, and some theorizing.
> 
> (Of course, the obvious exception is that the Temporary Control
> Registers are undefined when the kernel's HPMC handler is called.)

How is that obvious ?  I would have expected the firmware HPMC handler
to use some sort of temporary storage in the 0xffffe000 - 0xffffffff
range (which can be accessed using an immediate offset and GR0), in
the debug registers or something similar (probably it could even use
undefined spots in page zero).

> HP-UX does use some Temporary Control Registers for permanent
> storage.  It saves the values of these registers before calling
> PDC, and restores them when PDC returns.  I would recommend that
> Linux follow this practice.

Agreed.


	Philipp Rumpf
