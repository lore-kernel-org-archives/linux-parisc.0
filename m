Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0CB6482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Oct 2001 18:14:58 -0600 (MDT)
Date: Tue, 16 Oct 2001 20:16:25 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SysV IPC structure mismatches
Message-ID: <20011016201625.C7269@megatonmonkey.net>
References: <20011017012533.A8727@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011017012533.A8727@solo.franken.de>; from tsbogend@alpha.franken.de on Wed, Oct 17, 2001 at 01:25:33AM +0200
List-ID: <linux-parisc.vger.kernel.org>

> 
> As you might guess going the second way, seems to be the right, because
> breaking binary compatibilty now, isn't that big issue, because all the
> stuff we have right now, is available in source and easy compilable.
> This could change, when there are commercial applications for Linux/Parisc.
> But right now, we seem to have a problem building a new glibc (why ?),
> so doing it immidiatly isn't that easy.
> 
> I've attached a patch, which implements the first way, which breaks 64bit 
> kernels. With this patch the nspr testsuite passes all the semaphore tests,
> which failed without the change. I could commit that patch, but I believe
> it's the wrong way.
> 
> Thomas.
>

The second way is the best way.
"El nuevo" GCC causes broken binary compatibility anyway, so no worries.

I think we'll be recompiling all of our applications many times over
before we are stable ;)

I have the assembly for ld sitting beside me (waiting for my coffee break
to trace assembly).

If you want to help, you can try to compile glibc-2.2.4-2 for hppa.
Having more than one person look at it can be better. The latest glibc
for hppa is glibc-2.2.3-8?

It seems like a problem in the compiler, since we don't even get to running
anything important before it barfs (literally about 60 instructions in 
_dl_start before an assert fails). 

What is the problem? Don't know. Looking at assembly in hopes it jumps out.
My collection of annotated PA-RISC assembly instructions is helping :}

I have glibc compiled with -O1, since IMHO it makes the assembly saner.

c.
