Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B7AC4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 09:26:50 -0700 (MST)
Date: Mon, 11 Nov 2002 11:26:56 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org, jbailey@nisa.net
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021111162656.GE8848@systemhalted>
References: <20021111150347.GA8848@systemhalted> <200211111547.gABFlEr3001820@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211111547.gABFlEr3001820@hiauly1.hia.nrc.ca>
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

> > We need it or else we have to fall back on completely software emulated
> > quad arithmetic. Though the framework for replacing all those function
> > calls is available.
> 
> As Willy mentioned, no PA processors actually implement quad arithmetic
> at this time although it is part of the PA 2.0 architecture.  So, we
> have to use software emulation and there is no point at this time
> in adding the quad arithmetic ops to pa.md definition.  The simplest
> approach is to use the libcall interface already implemented for hpux
> (see pa/long_double.h).

Ah yes, correct, I had forgotten that it was never implemented in
silica. So you suggest we not implement this in libc but rather in gcc,
may I ask why?

> While GMP is a useful package, it doesn't emulate IEEE 754 arithmetic.
> That's what we need here.  There's a floating point emulator in gcc/real.c
> but I think the HP library would be superior.

I'm pretty sure that MPFR library in GMP can emulate IEEE 754 arithmetic, 
though I could be wrong.

c.
