Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DC514836
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Jun 2002 16:11:10 -0600 (MDT)
Message-Id: <200206172211.g5HMB37o013874@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Unaligned access failures with apt-get on SMP
To: rbradetich@uswest.net (Ryan Bradetich)
Date: Mon, 17 Jun 2002 18:11:03 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, richard_hirst@linuxcare.com
In-Reply-To: <1024346629.27050.52.camel@beavis> from "Ryan Bradetich" at Jun 17, 2002 02:43:49 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> (gdb) n
> 263	   return Result/ItemSize;
> 
> (gdb) n
> 
> 260	   I->Count--;
> (gdb) n
> 
> Program received signal SIGBUS, Bus error.
> DynamicMMap::Allocate(unsigned long) (this=0x4c900, ItemSize=56) at
> contrib/mmap.cc:263
> 263	   return Result/ItemSize;
> 
> 
> It looks like the the function gets exited twice.... but I do not see
> any recursion in the function, and the function is not listed twice
> in the origional back trace I posted.  Do we have a corrupt stack?
> or can you think of anything else?  I would be glad to provide any

I don't think the function exits twice.  The duplication in lines as
you step through the function is caused by optimisation.  A similar
effect is observable in the value for ItemSize printed at the
initial break.  If you print r25 at the break, you should see the
value 56.  The initial printout is wrong because the break is before
the point where the argument register is copied to the register or
stack slot for ItemSize.  It's also possible that the register of
stack slot used for ItemSize may get reused later in the function.
The fun and games of debugging!

If you put a break on line 263 and single step from that point you
should find the exact assembly insn causing the bus error and be able
to determine what's causing the bus error.

If the problem looks like a compilation error as opposed to a coding
problem, send me offline the preprocessed source, the assembly output for
DynamicMMap::Allocate(unsigned long) from your compiler, and the
compilation command.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
