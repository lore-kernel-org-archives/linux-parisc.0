Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB8394829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Apr 2003 11:08:11 -0700 (MST)
Date: Fri, 4 Apr 2003 13:08:41 -0500
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Applications in 64 bits userspace
Message-ID: <20030404180841.GP7542@systemhalted>
References: <20030403225228.GI7542@systemhalted> <200304040002.h3402U4u020233@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200304040002.h3402U4u020233@hiauly1.hia.nrc.ca>
From: Carlos O'Donell <carlos@baldric.uwo.ca>
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

John,

> I can't answer that.  Presumably, HP funded the development.  Possibly,
> they were considering using the GNU linker but then decided to go with
> a different port.  I do most of my 64-bit testing now with the HPUX
> linker.  There were some rough edges in using the HP linker with GCC
> a few months ago but these have been resolved.

I get random email from people who've seen my libc-alpha postings, and
they want to know how to fix their busted gcc (hppa2.0w) + HPUX linker
compiles... looks like floating point loads and stores with bad 
relocations (the reason we disable fpregs in the rtld code for glibc).

> The HP linker is not compliant with the sysv ELF ABI in its handling
> of weak symbols.  Undefined weak symbols are supposed to resolve
> to a value of 0, and the linker is not supposed to search archive
> libraries for undefined weaks.  I tried hacking GNU ld to see if
> this could be fixed but this isn't possible since the dynamic loader
> has the same behavior.  Basically, weak symbols appear to behave
> like secondary definition symbols with the SOM runtime.  The lack
> of proper weak support impacts GCC thread support.

Ick! Okay, I see why the initial intent to transition toolchains was
made. Though it still probably kicks our arse in terms of performance.

> I presume you are talking about the implementation for lazy linking.
> I know the ia64 implementation of function descriptors differs from
> what is done for the 32-bit hppa ports.

See Lu's patch at:
http://sources.redhat.com/ml/libc-alpha/2003-04/msg00048.html

It's a unification effort to try get arches that use func. desc. onto
the same page... hopefully lockless lookups and lazy linking :)
 
> Ok.  I should note that the current 64-bit GNU ld doesn't know how
> to do a true static link.

How so? -static and -nostdlib and add all the bits yourself?
 
> I certainly agree with that plan.  64-bit code is always going to
> be slower than 32-bit code, so it shouldn't be used unless really
> needed.

It would still be a nice treat to get more testing on the 64-bit
compiler, and be able to run bigger apps on the bigger PARISC boxes once
they become available :)

Though, yes, the current plan is, without fail, in the order I feel like
fixing them today:
- make -k check passes
- function descriptor fixes
- TLS support
- Static 64-bit userspace

c.
