Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (unknown [64.109.89.110])
	by dsl2.external.hp.com (Postfix) with ESMTP id 387EA482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Jan 2002 10:24:09 -0700 (MST)
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id g0QHNeI02030;
	Sat, 26 Jan 2002 12:23:40 -0500
Message-Id: <200201261723.g0QHNeI02030@localhost.localdomain>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 26 Jan 2002 12:23:40 -0500
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [parisc-linux] Re: tag starvation
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

> > Normally you shouldn't see this *if* the device supports tagged
> > commands.

> I used to get this a lot, until James changed the driver to only
> report the first occurance of it.  Don't remember the exact details,
> but iirc it is for info only, and non-fatal.  From the code it looks
> like it means some cmnd has been sitting in the drive unprocessed for
> too long, and the code rejects new cmds until those older ones have
> been processed or timed out.

That's essentially it.  A driver is allowed to execute simple tagged commands 
in any order it chooses (since it knows its own internal platter topology, it 
is supposed to order the execution to be the fastest and most efficient 
possible).  However, the queuing algorithm on some drives can be inherently 
unfair; usually if you have a steady stream of I/Os to one part of the platter 
and a single I/O waiting for a different one.  An unfair algorithm may simply 
ignore a pending tagged command for quite a period of time (this is what is 
known as tag starvation).  If the command remains unprocessed for >2s, the 
mid-layer will begin error recovery, which can cause all sorts of problems.

Almost every good driver that implements tagged commands has some sort of 
algorithm to detect this situation and correct it before the mid layer comes 
in with the big hammer.  The message is a harmless warning that this type of 
correction has been activated in the driver.  For those who're interested in 
the details, I attach the explanation of what it actually does at the bottom.

> > I can never remember the SCSI driver options (the parisc-linux FAQ has
> > the URL to them) but one of them will either disable or limit 
> > "queue depth" for Queue Tags and that should take care of it.

> Hmm, I thought that would be a feature of a specific driver, not the
> upper layers.  53c700.c doesn't (yet) have any boot options to disable
> tags.

OK, my fault, I keep meaning to add it.  One thing that irritates me about 
this option is that it should be a global one (belonging to the whole SCSI 
subsystem) not local to each driver.  However, that's just a pet peeve of mine 
(in fact the SCSI subsystem should do an awful lot more of this type of option 
tracking and helping), it's not too difficult to implement, I'll get on with 
doing it.

James

How to Counter Tag Starvation
==============================

Most of the maintained drivers in Linux do this by keeping a timer on the 
outstanding tagged commands.  When they see the timer expire they switch from 
simple tags to ordered tags (an ordered tag is like a marker in the 
queue---you can't execute any command after an ordered tag untill all those 
before it have completed).

The 53c700 has a much simpler approach:  A tag is simply a number between 0 
and 255 identifying the command.  Obviously, there cannot be two tags with the 
same number to the same device outstanding at any one time.  For each device 
the 53c700 keeps track of the tag number of the oldest outstanding command and 
the next tag to allocate (the latter is incremented by one [modulo 256] every 
time a command goes out).  You can think of this as hands on a clock with 256 
graduations.  All outstanding tags are between the two hands.  The driver 
detects tag starvation when the hands try to cross (i.e. the next tag to be 
allocated would be the same tag number as the oldest outstanding command).  At 
that point, it prints the message and refuses to accept any further I/Os from 
the mid layer.  Eventually, the offending outstanding command will clear 
(possibly after all the rest of the commands are emptied) and the driver 
begins accepting I/Os again.

The reason for this approach in the 53c700 is that it is driving much older 
(and buggier) devices.  If the device messed up on the ordered queue tag we 
could get into a whole heap of trouble.

Obviously, since the SCSI mid-layer also keeps a timer on outstanding 
commands, it is a complete waste to duplicate this inside the driver.  
Unfortunately, the first the driver hears from the mid-layer about a problem 
command is when the mid-layer wants it aborted, by which time it is a bit late.
