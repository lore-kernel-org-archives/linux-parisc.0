Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: tag starvation 
In-Reply-To: Message from James Bottomley <James.Bottomley@HansenPartnership.com>
   of "Sat, 26 Jan 2002 12:23:40 EST." <200201261723.g0QHNeI02030@localhost.localdomain>
References: <200201261723.g0QHNeI02030@localhost.localdomain> 
Date: Sun, 27 Jan 2002 01:41:19 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020127084119.AB75A482A@dsl2.external.hp.com>
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

James Bottomley wrote:
> That's essentially it.  A driver is allowed to execute simple tagged commands
> in any order it chooses (since it knows its own internal platter topology, it

James,
thanks for the excellent explanation.
But did you mean device or drive?  (instead of "driver")

> ignore a pending tagged command for quite a period of time (this is what is 
> known as tag starvation).  If the command remains unprocessed for >2s, the 
> mid-layer will begin error recovery, which can cause all sorts of problems.

ah...that explains it. Most HP drives are expected to have 3s.

> One thing that irritates me about 
> this option is that it should be a global one (belonging to the whole SCSI 
> subsystem) not local to each driver.

It should also be *per drive*. Different drives implement
different numbers of queue tags (eg disk array vs simple mech).

> How to Counter Tag Starvation
> ==============================
> 
> Most of the maintained drivers in Linux do this by keeping a timer on the 
> outstanding tagged commands.  When they see the timer expire they switch from
>    
> simple tags to ordered tags (an ordered tag is like a marker in the 
> queue---you can't execute any command after an ordered tag untill all those 
> before it have completed).

AFAIK, HP does not test disk drives to verify ordered tags work
correctly. One reason is we didn't want to expose new bugs by mixing
ordered with simple tags. The other reason is we saw a 25% performance
hit. The 5400 rpm 2GB drives at the time could complete ~80 IO/s with
simple tags. This dropped to 60-65 IO/s for ordered tags. Ordered tags
was considered an unacceptable solution at that point.

> The driver detects tag starvation when the hands try to cross (i.e. the
> next tag to be
> allocated would be the same tag number as the oldest outstanding command).
> At that point, it prints the message and refuses to accept any further
> I/Os from the mid layer.

Well done - I like this solution too.

> The reason for this approach in the 53c700 is that it is driving much older 
> (and buggier) devices.  If the device messed up on the ordered queue tag we 
> could get into a whole heap of trouble.

Exactly. Best case is the drive gets confused and locks up.
Worst case is it looses the data.

> Obviously, since the SCSI mid-layer also keeps a timer on outstanding 
> commands, it is a complete waste to duplicate this inside the driver.  
> Unfortunately, the first the driver hears from the mid-layer about a problem 
> command is when the mid-layer wants it aborted, by which time it is a bit lat
>   e.

This is fun part about driver interactions in the error recovery path.
Could one avoid this mess if the SCSI interface driver could guarantee
the IO will complete (with or w/o error) with-in the time frame
specified by the device (eg tape or disk) driver?

grant
