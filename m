Return-Path: <carlos@baldric.uwo.ca>
Received: from fep04-mail.bloor.is.net.cable.rogers.com
	(fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08B3748B5
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 18 Feb 2004 09:38:50 -0700 (MST)
Date: Wed, 18 Feb 2004 11:39:27 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Elliott Potter <epotter@eep.burdell.org>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
Message-ID: <20040218163927.GC9497@baldric.uwo.ca>
References: <402A42A1000052A9@ocpmta1.freegates.net>
	<Pine.GSO.4.44.0402180830260.14838-100000@keymaster>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.GSO.4.44.0402180830260.14838-100000@keymaster>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> > But now I need more to try to complete job because:
> > make[2]: *** [/Develop/parisc-linux/build/glibc/sunrpc/xbootparam_prot.stmp]

This is the first time that the loader you built is used. If the loader
is in anyway broke, it will *always* die here first. Just remember this
glibc haiku when you are coding:

	Loader code is bad.
	Dying in sunrpc.
	Blame relocations.

:)

> > do_page_fault() pid=6547 command='ld.so.1' type=15 address=0x0016b690
> > vm_start = 0x00033000, vm_end = 0x00034000
> >
> >      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > PSW: 00000000000001000000111100001111 Not tainted
> > r00-03  0000000000000000 000000004102b6fc 000000004100721f 00000000faf02040
> > r04-07  000000004102b6fc 00000000400002b8 00000000faf02158 00000000faf01d8c
> > r08-11  0000000040170000 0000000000170e60 000000004016fd98 00000000faf01dc0
> > r12-15  0000000040171e60 0000000000000002 00000000faf02128 ffffffffffffffff
> > r16-19  00000000faf02180 0000000000000003 0000000000000004 000000004102b6fc
> > r20-23  000000004102bd80 0000000000000008 000000000016b690 0000000040000000
> > r24-27  000000000016b690 0000000000001e60 0000000000000003 00000000000c97f0
> > r28-31  0000000040001000 0000000000000000 00000000faf02180 0000000041013fc7
> > sr0-3   0000000000003580 0000000000003580 0000000000000000 0000000000003580
> > sr4-7   0000000000003580 0000000000003580 0000000000003580 0000000000003580

Loader died, return address is in the loader or libc. Stack pointer
looks right. PIC register looks correct. If you had a copy of your
/proc/<pid>/maps then you could decipher where 0x4102b6fc pointed.

> > IASQ: 0000000000003580 0000000000003580 IAOQ: 0000000041007293 0000000041007297
> >  IIR: 0ec01095    ISR: 0000000000003580  IOR: 000000000016b690
> >  CPU:        8   CR30: 000000003a038000 CR31: 00000000104a4000
> >  ORIG_R28: 0000000040170000
> >  IAOQ[0]: 0x41007293
> >  IAOQ[1]: 0x41007297
> >  RP(r2): 0x4100721f

Odd, the insns you are executing are really close to your IAOQ
addresses, so the functions are close together.

> Interesting -- I'm getting a similar crash in a program when it calls
> getopt_long() -- this do_page_fault thing.  I'm wondering if the two are
> somehow related because it's only this one program that crashes, and
> only on the line where getopt_long() is called.  The output in dmesg:

No relation. The do_page_fault is an attempt to execute code at an
invalid page. In Joel's case the address is garbage, in your case it's
very very very different.

> do_page_fault() pid=30051 command='distmk' type=6 address=0x6bc23fdb
> vm_start = 0x401ca000, vm_end = 0x401cb000

Your's is a very special failure. The faulting address is actually
an instruction sequence "6bc23fd9 == stw rp,-14(,sp)" Which means that
at some point a *real* address was substituted for a function
descriptor, then dereferenced and jumped into. This *only* used to
happen when running static programs that had static lookup functions. I
can't be certain though without knowing more about your program "distmk."
My guess is that it's a statically compiled binary calling dlopen?

>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001111 Not tainted
> r00-03  00000000 4004ca40 4002c09f bff04040
> r04-07  4004d240 000d6f60 bff001b0 bff0018c
> r08-11  00000008 00000008 00000001 bff03748
> r12-15  000d8470 000ce5c0 00000000 00000000
> r16-19  00000000 000b2248 00000004 000007ec
> r20-23  4004d238 80000000 6bc23fd9 00000000
> r24-27  bff001b0 4004d714 4004cb40 000cfd40
> r28-31  000d6762 7efefeff bff040c0 0009cc8b
> sr0-3   00001491 00001491 00000000 00001491
> sr4-7   00001491 00001491 00001491 00001491
> 
> IASQ: 00001491 00001491 IAOQ: 6bc23fdb 6bc23fdf
> IIR: 43ffff80    ISR: 00001491  IOR: 401a1a38
> CPU:        0   CR30: 4a360000 CR31: 103f0000
>  ORIG_R28: 401ca000
>  IAOQ[0]: 0x6bc23fdb
>  IAOQ[1]: 0x6bc23fdf
>  RP(r2): 0x4002c09f
> 
> This is with gcc-3.0.4 and gcc-3.2.3, with kernel 2.4.* and 2.6.2-pa3,
> and glibc-2.2.5 (so ... old ...)

Eeek! Upgrade? I've made so many fixes since then... it's not a very
functioning libc.

c.
