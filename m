Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1BA10482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 11:33:56 -0700 (MST)
Message-Id: <200111151829.LAA17717@puffin.external.hp.com>
To: Markus Grabert <xam@student.cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux/PA-RISC speed (was Re: C240 Graphics, 64bit kernel and more) 
In-Reply-To: Message from Markus Grabert <xam@student.cs.ucc.ie>
   of "Thu, 15 Nov 2001 14:08:46 GMT." <Pine.OSF.3.96.1011115140754.20078A-100000@student.cs.ucc.ie>
Date: Thu, 15 Nov 2001 11:29:14 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Markus Grabert wrote:
> Jurriaan Kalkman wrote:
> > There are still bugs.
> 
> But Grand Grundler wrote:
> | Yes - should work fine. Note one can build 32-bit PA2.0 binaries.
> | The scheduling and insns are optimized for PA2.0 CPU but will
> | run in "narrow" mode.
> 
> Mhh who's right ? I tend to believe Grand.

I believe I was talking in general and without regard to the
issues we've recently had (and are *almost* fully resolved).
For the past week or two the apt-get'able toolchain has been
foobar.

> Of course there are bugs in binutils/gcc. But are there KNOW bugs/issues
> a software developer (not a kernel freak) has to be aware of ?
> What about glibc ?
> Are threads fully supported ? Are gcc's ObjC, Java and C++ compilers
> also working ?

Recently, bugs have been fixed in dynamic linking and C++ toolchain.
Just waiting for the fixes to propogate into the debian pkg pool
so we can all apt-get them.


> > I can only say that compiling a kernel on my C200 takes about 2 times
> > as long as on my alpha (21164, 500 Mhz, 2 Mb cache). I feel it should
> > be faster.
> 
> 
> That's odd.
> A 21164/500MHz (not 21164A or 21164PC) is slower according to
> Spec_INT95, Spec_FP95 and the Spec_base(INT|FP)95 variants.
> 
> Indeed the benchmarks say that the Alpha is about 50% slower for FP stuff
> and just a little bit slower for INT stuff (compared to a C240 HP/UX).

Those benchmarks are most likely based on hpux and hpux toolchain.

gcc is not as good at pipelining and other parisc specific
micro optimizations. C240 is PA8200 (iirc) and can execute
2 to 4 insn per cycle under optimal conditions.

grant
