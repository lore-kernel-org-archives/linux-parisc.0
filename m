Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 507624829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 10:26:08 -0700 (MST)
Message-Id: <200211111725.gABHPo5R002295@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 11 Nov 2002 12:25:49 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org, jbailey@nisa.net
In-Reply-To: <20021111162656.GE8848@systemhalted> from "Carlos O'Donell" at Nov 11, 2002 11:26:56 am
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

> Ah yes, correct, I had forgotten that it was never implemented in
> silica. So you suggest we not implement this in libc but rather in gcc,
> may I ask why?

I don't have a strong opinion on this.  Probably, the routines should
be in libc.  However, it's probably simple also to put them in libgcc
which contains some arithmetic operations.  Some work in gcc would
be needed in any event to integrate the package.

> > While GMP is a useful package, it doesn't emulate IEEE 754 arithmetic.
> > That's what we need here.  There's a floating point emulator in gcc/real.c
> > but I think the HP library would be superior.
> 
> I'm pretty sure that MPFR library in GMP can emulate IEEE 754 arithmetic, 
> though I could be wrong.

I found the quad double package at the mpfr site.  However, its double
double differs from the IEEE quad precision representation.  A double double
is a representation using two IEEE doubles.  This is fine as a separate
library but not the IEEE implementation we are looking for.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
