Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id A94F0482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Sep 2001 15:28:17 -0600 (MDT)
Date: Mon, 17 Sep 2001 23:25:30 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: Getting up and running
In-Reply-To: <200109171012.EAA27443@udlkern.fc.hp.com>
Message-ID: <Pine.NEB.4.33.0109172318580.16734-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi John,

> I thought for a second that the patch might work anyway, since the
> unaligned fault handler has exception table support, so even though
> the instruction might be unecessarily emulated, it would still
> successfully bring the page in, but the unaligned fault handler
> uses ldb, which would just cause an infinite loop ...

init started:  BusyBox v0.51 (2001.06.27-21:43+0000) multi-call binary
rcS(14): unaligned access to 0x000411e5 at ip=0x0001a04f
Not-handled unaligned insn 0x60a0002a
Unaligned handler failed, ret = -1 #
# ps -ax
<4>sh(16): unaligned access to 0x000411e5 at ip=0x0001a04f
Not-handled unaligned insn 0x60a0002a
Unaligned handler failed, ret = -1 Bus error
# ls -la
<4>sh(17): unaligned access to 0x000411e5 at ip=0x0001a04f
Not-handled unaligned insn 0x60a0002a
Unaligned handler failed, ret = -1 Bus error

I had more success using the old suggested patch:

"Our" CPUs are very old. So there must be a line added in
the arch/parisc/kernel/trap.c file. In the handle_interruption()
you must add the line
        `case 18:'
where
        `case 15:'
        `case 26:'
is in the code, because these old CPUs use an older method of
"reporting" page faults, etc...

It looks like the expression "if (regs->ior & 3)" might be wrong here...

Cheers,
Jochen
