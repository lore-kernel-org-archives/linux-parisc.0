Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8B174483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Sep 2003 12:57:50 -0600 (MDT)
Date: Sun, 21 Sep 2003 14:55:31 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Found the r19 problem!
Message-ID: <20030921185531.GH6963@systemhalted>
References: <20030921154501.GF6963@systemhalted> <200309211639.h8LGdesh010888@hiauly1.hia.nrc.ca> <20030921185311.GG6963@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030921185311.GG6963@systemhalted>
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

> So use a caller saves register, place it in the clobbers, and let gcc
> work around the usage (e.g. r4).
>  
> > > 	...
> > > 	(Many insn later)
> > > 	(stub) (dyncall) -> libpthread.so
> > > 	-> libc.so
> > 
> > The above is an indirect call. r19 should be restored after the call
> > if it is used after the call.
> 
> It is, but only after the asm(...) that lists r19 in the clobber.
> 

Sorry "It is" should read "It is used" :)
Things get tricky in email with complex issues.

c.
