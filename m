Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflashcom (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0567948CA
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 12:37:25 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@pflash.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress
Date: Sat, 29 Sep 2001 13:36:16 -0500
References: <200109271442.KAA14125@mail.lokmail.net> <20010928095420.A16748@parcelfarce.linux.theplanet.co.uk> <20010929080006.A25136@dogbert.localdomain>
In-Reply-To: <20010929080006.A25136@dogbert.localdomain>
MIME-Version: 1.0
Cc: Albert Strasheim <fullung@ilink.nis.za>
Message-Id: <01092913361601.00620@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

On Saturday 29 September 2001 01:00 am, Albert Strasheim wrote:
> regs->iaoq[0] = regs->iaoq[1];
> regs->iaoq[1] = regs->iaoq[0] + 4;
>
> Is this right, or should I leave Jurij's code?
>
Hello Albert,

An observation:
regs->iaoq[1] is the "following instruction" - where "following" means "in 
execution order".  So replacing the emulated instruction with this seems the 
obvious thing to do.

BUT...
Without examining the instruction (which was at iaoq[1] and is now at 
iaog[0]) I don't think it is safe to assume that the instruction following 
that one in execution order is at iaoq[1]+4 !!  (Branches, nullified 
instructions, conditional instructions, etc).

Perhaps...
Instead of trying to compute (determine) what is the next instruction in 
execution order following iaoq[1] ; iaoq[1] could be set to a value that 
would cause the hardware pipeline to fetch the correct following instruction.

Or perhaps...
A way could be found to use whatever "single step" controls are available to 
get the return made to iaoq[1] instead of iaoq[0] and leave the queues along.

Also...
What about the space register queue?  Might these instructions be in a 
different address space?

Mike
