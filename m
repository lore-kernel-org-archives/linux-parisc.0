Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093-CM.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id A866C4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 12:26:32 -0700 (MST)
Date: Wed, 15 Jan 2003 14:26:34 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64 userspace
Message-ID: <20030115192634.GD20519@systemhalted>
References: <20030115190154.GA20519@systemhalted> <200301151909.h0FJ9iL1021952@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200301151909.h0FJ9iL1021952@hiauly1.hia.nrc.ca>
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

> > > 1) Kernel -- design and implement 64-bit system calls.
> > 
> > Currently, 64-bit kernels return bogus sigcontext structures to our
> > 32-bit userspace, they stuff the sigcontext with 64-bit registers when
> > it is only expecting 32-bits. It seems like sigcontext should be
> > expanded to have 64-bits per register for both 32 and 64 bit kernels?
> > This is definately an ABI breakage. Though it's funny that not many
> > programs are broken under 64-bit kernels, but I guess that without
> > *context() calls implemented for HPPA in glibc, the returned ucontext is
> > not used (except for that weird LISP interpreter that Krystof was
> > porting).
> 
> I wonder if this isn't the problem with expect.
> 

Shazam! Ballz in your court. I ran across this problem in the summer
when working with Krystof. He actually caused my C3K to crash, different
issue though :}

If you look at parisc/kernel/signal.c and look for the word "HACK"
you'll see what I mean. There are few expletives that need to be cleaned
up. Randolph had suggested adding thread personalities so we can tell
what the userspace looks like and choose the right sigcontext to send
back. However, it seems that truncating the 64-bit regs is a crazy thing
to do since you might lose information.

I'm all for expanding the sigcontext to 64-bits. As a matter of fact
I'll try rebuilding glibc with an expanded sigcontext (remembering that
it has to be changed in the kernel definition and the glibc definition).
Added to that will be the minor hack to your ldwc_align code to fdce the
lock cacheline before usage.

c.
