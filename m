Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id F14B24881
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Oct 2001 08:28:47 -0600 (MDT)
Date: Wed, 3 Oct 2001 10:28:48 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: John Marvin <jsm@udlkern.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Delayed branching explanation
Message-ID: <20011003102848.C18841@megatonmonkey.net>
References: <200110031004.EAA15528@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200110031004.EAA15528@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Wed, Oct 03, 2001 at 04:04:31AM -0600
List-ID: <linux-parisc.vger.kernel.org>

> 
> One more step:
> 
>     pc[0] -> target2
>     pc[1] -> target2 + 4
> 
> the "cool" thing about the above sequence is that the instruction at
> target1 gets executed, and then immediately we jump somewhere else, i.e.
> we can execute one instruction somewhere and then immediately go somewhere
> else (without having a branch at target1).  If you follow this example,
> then you really understand delayed branching.
> 
> Note that the above example is the whole reason we must have a "B" bit in
> the PSW (processor status word).  The B bit is set by any taken branch,
> and is cleared by any other instruction.  The "gate" instruction, which is
> used for privilege promotion, will fault if the B bit is set when the gate
> instruction is executed.  The reason is that even though the gate
> instruction can only be located on a execute only page (i.e. you can't
> change the instruction sequence), you could use the above trick to execute
> only the gate instruction and then return to your own code with increased
> privilege if the "B" bit didn't exist.
> 
>

This is very very similar to the the Sparc.
Delayed branches are an interesting compiler optimization.

I think I see what you mean about "B" being in the PSW, though
I'm not clear on the semantics of an execute only page.

Time to hit the books again!

Thanks for the interesting explanation John!

c.
