Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59DE14829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 10:37:07 -0700 (MST)
Date: Mon, 11 Nov 2002 12:37:10 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org, jbailey@nisa.net
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021111173710.GK8848@systemhalted>
References: <20021111162656.GE8848@systemhalted> <200211111725.gABHPo5R002295@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211111725.gABHPo5R002295@hiauly1.hia.nrc.ca>
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
> I don't have a strong opinion on this.  Probably, the routines should
> be in libc.  However, it's probably simple also to put them in libgcc
> which contains some arithmetic operations.  Some work in gcc would
> be needed in any event to integrate the package.
> 

I've just seen recent binutils ditatrabe about how we have copies of
math libraries floating between glibc, gcc and the kernel.

What do we gain from putting it in gcc?
	- ?

What do we gain from putting it libc?
	- More frequent package updates?
	- IMO easier to debug?

Why are there math functions in libgcc in the first place?
Historical reasons?

> > I'm pretty sure that MPFR library in GMP can emulate IEEE 754 arithmetic, 
> > though I could be wrong.
> 
> I found the quad double package at the mpfr site.  However, its double
> double differs from the IEEE quad precision representation.  A double double
> is a representation using two IEEE doubles.  This is fine as a separate
> library but not the IEEE implementation we are looking for.
> 

Okay.

c.
