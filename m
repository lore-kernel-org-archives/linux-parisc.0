Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093-CM.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id 581754829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 12:01:56 -0700 (MST)
Date: Wed, 15 Jan 2003 14:01:54 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: "FARINATI, LEANDRO" <leandro.farinati@hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64 userspace
Message-ID: <20030115190154.GA20519@systemhalted>
References: <9A0482A7BD2506488AD9417C93F3714F011A1AE6@xsp01.brazil.hp.com> <200301151840.h0FIeS9I018903@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200301151840.h0FIeS9I018903@hiauly1.hia.nrc.ca>
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

> To my knowledge, there isn't one.  Roughly what is required is:
> 
> 1) Kernel -- design and implement 64-bit system calls.

Currently, 64-bit kernels return bogus sigcontext structures to our
32-bit userspace, they stuff the sigcontext with 64-bit registers when
it is only expecting 32-bits. It seems like sigcontext should be
expanded to have 64-bits per register for both 32 and 64 bit kernels?
This is definately an ABI breakage. Though it's funny that not many
programs are broken under 64-bit kernels, but I guess that without
*context() calls implemented for HPPA in glibc, the returned ucontext is
not used (except for that weird LISP interpreter that Krystof was
porting).
 
> 2) Binutils -- port hpux 64-bit tools to linux.

I thought we had a 64-bit binutils port?

> 3) Gdb -- same as binutils.

This would require some work.

> 4) GCC --  same as binutils.

hppa64-linux-gcc?

> 5) Glibc -- implement 64-bit specific parts of ABI and system calls.

This is a biggie, 64-bit SHLIBS being the large headache.

> Are you offering support from HP?  It's taken a number of years to
> get to the current state of development on the 32-bit port given the
> level of volunteer effort and support from HP.  What you are asking
> won't happen for months, if not years.  The time to implement a 64-bit
> userspace won't be as great as for the 32-bit port, but it still a
> very significant effort.

Perhaps we will see it's emergence in the next few years :)

c.
