Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 618B14829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Oct 2002 17:58:29 -0600 (MDT)
Date: Tue, 8 Oct 2002 19:48:54 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ksoftirqd eats 100% cpu :-(
Message-ID: <20021008234854.GE18202@systemhalted>
References: <200210081427.IAA27522@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200210081427.IAA27522@udlkern.fc.hp.com>
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

> 
> > It's a bug/feature related to the HIL drivers.
> > Since we have to poll the HIL ports the whole time
> > the bunch of running timers increase the ksoftirqd load a lot.
> 
> I understand that polling is necessary while sending commands out
> to hil devices, but input should be interrupt driven. What is the
> reason for all of the polling?
> 
> John Marvin
> jsm@fc.hp.com


It's interrupt driven, but the ISR _always_ calls tasklet_schedule 
to do the real work. The HIL state machine and SERIO layer hooks
in a function to it's own tasklet so it can update on interrupt.

Most drivers usage of tasklets involves:

a- Setup and enable during module init
b- Leave them alone.

I assume that this is the case, because tasklets are CPU intensive.
It would be nice to have someone investiage this... if not, it goes
on the end of my now _really_ long todo list :)

c.
