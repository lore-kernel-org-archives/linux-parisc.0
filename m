Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A2954829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 16:27:01 -0700 (MST)
Date: Mon, 11 Nov 2002 18:27:11 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021111232711.GB12433@systemhalted>
References: <20021111224458.GC11690@systemhalted> <200211112253.gABMr09l003349@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211112253.gABMr09l003349@hiauly1.hia.nrc.ca>
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

> > Again, delayed traps can be "Invalid Operation" exceptions within these
> > floating point tests. We may be seeing some of those issues. I really
> > need to find a way to properly flush delayed exceptions.
> 
> Look at fldw,fstw.  Specifying register 0L forces the coprocessor
> to complete all previous floating-point insns.
> 

We currently use the following as a delayed exception trap barrier:

libc/glibc-2.3.1/sysdeps/hppa/fpu/fraiseexcpt.c

...
__asm__ __volatile__ ("fmpy,dbl %1,%%fr0,%0\n\t"
			/* FIXME: is this a proper trap barrier? */
			"fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0"(d));
...

And from the comment it seems that DHD wasn't sure either :)
I don't quite understand what is meant by specifying register 0L?

c.
