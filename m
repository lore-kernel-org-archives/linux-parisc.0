Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (unknown [64.109.89.110])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9425482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 27 Jan 2002 09:53:05 -0700 (MST)
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id g0RGqrA02016;
	Sun, 27 Jan 2002 11:52:54 -0500
Message-Id: <200201271652.g0RGqrA02016@localhost.localdomain>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: tag starvation 
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Sun, 27 Jan 2002 01:41:19 MST." <20020127084119.AB75A482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 27 Jan 2002 11:52:53 -0500
From: James Bottomley <James.Bottomley@HansenPartnership.com>
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

> > That's essentially it.  A driver is allowed to execute simple tagged
> > commands
> > in any order it chooses (since it knows its own internal platter
> > topology, it

> James, thanks for the excellent explanation. But did you mean device
> or drive?  (instead of "driver") 

drive (but actually device is more accurate).

> > One thing that irritates me about 
> > this option is that it should be a global one (belonging to the whole
> > SCSI 
> > subsystem) not local to each driver.

> It should also be *per drive*. Different drives implement different
> numbers of queue tags (eg disk array vs simple mech). 

That's what I mean:  Inside scsi_scan.c there's a table which identifies 
various devices (by INQUIRY string) and takes certain actions (scan all luns, 
turn on/off tag queueing etc.).  There should be module parameters that allow 
adding to or modifying this.  In addition, there should be a module parameter 
that allows setting these actions by (scsi,channel,target,lun) quad, then we 
wouldn't need each of the low level drivers to have its own module commands 
for doing this.

> > Obviously, since the SCSI mid-layer also keeps a timer on outstanding 
> > commands, it is a complete waste to duplicate this inside the driver.
> 
> > Unfortunately, the first the driver hears from the mid-layer about a
> > problem 
> > command is when the mid-layer wants it aborted, by which time it is a
> > bit lat
> >  e.

> This is fun part about driver interactions in the error recovery path.
> Could one avoid this mess if the SCSI interface driver could guarantee
> the IO will complete (with or w/o error) with-in the time frame
> specified by the device (eg tape or disk) driver? 

Actually, I looked and the timeout is now 10s, not 2s.  The upper device 
drivers (st, sd etc.) do get to override this.  The problems tend to come when 
the error recovery takes over.

James
