Received: from opus.allegro.com (opus.allegro.com [209.10.39.50])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id OAA04036
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 14:06:29 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200011152108.NAA23252@opus.allegro.com>
Subject: Re: [parisc-linux] Single-stepping
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Wed, 15 Nov 2000 13:08:15 -0800 (PST)
Cc: rhirst@linuxcare.com (Richard Hirst), parisc-linux@puffin.external.hp.com
In-Reply-To: <200011151949.OAA22929@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 15, 2000 02:49:02 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> > The basic approach is to use the recovery counter to generate
> > a trap every instruction.  The scheme is complicated because a
...

> I really don't know enough to comment on the implementation choice.  Why
> did you decide on this approach as opposed to inserting breaks and

MPE/iX (which runs on PA-RISC hardware), has successfully used
the Recovery Counter to implement single step for many, many years.

BTW, in addition to single step, it's a great tool for counting the
number of instructions a procedure (or code path) takes,
assuming an adequately powerful debugger:

   1) stop (perhaps via a breakpoint) at the start of the code
      you want to count.

   2) set a breakpoint at the end of the code you want to count
      (e.g., if you're counting a procedure, set a breakpoint at
      the procedure exit)

   3) instead of "continue", do:   s 1000000

      (i.e., tell Debug/iX to "singlestep" 1000000 instructions)

   4) if you hit the breakpoint, enter:

          = 1000000 - rctr

      that's how many instructions your code took!  (Not counting
      instructions executed by interrupt handlers, of course.)

   5) if you *didn't* hit the breakpoint, then 1000000 wasn't
      enough instructions (and why are you trying to count so high?)

This works because MPE's debug "s" command sets the Recovery Counter
to the number of instructions you wanted to step.  Normally, that's 
one (for just "s").  If you said "s 3", it would set the Recovery Counter
to 3.  If you say "s 1000000", and then execute 123 instructions,
and then hit a breakpoint, Debug captures the entire register state
as of the breakpoint: including the Recovery Counter (which has 
1000000 - 123 in it).

Tip: if you're looking at instruction-level debugging, look at Debug/iX
to see how to do it right!


> It would appear that the recovery
> counter was intended to provide software recovery from hardware faults

The 1986 PA-RISC Instruction manual simply says "The Recovery
Counter (CR 0) can be used to provide software recovery of hardware
faults in fault tolerant systems".  (I.e., "can", not "must" ...
and there's no explanation of how one would use it for this.)


-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com        
