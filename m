Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C8DD482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Jun 2001 00:36:07 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel6.hp.com (Postfix) with ESMTP id 23F591F855
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Jun 2001 02:36:06 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id AAA12924
	for parisc-linux@lists.parisc-linux.org; Tue, 26 Jun 2001 00:36:02 -0600 (MDT)
Date: Tue, 26 Jun 2001 00:36:02 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200106260636.AAA12924@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP9000 - 822 - a gift?
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> > I just was 'gifted' a hp9000 822 with
>
> A very old, and very slow, PA-RISC 1.0 (?) HP 9000.
> Probably not likely to support boot-from-SCSI.
>

This machine contains a PA-RISC 1.0 cpu.  Not only will you not be able to
boot it from a SCSI device on parisc linux, you will not be able to boot
it at all.  We only support PA-RISC 1.1 cpu's and higher (and still are
missing some support for PA-RISC 1.1a cpu's, re: a proper trap 18 handler
and a privileged register trap handler to support reading cr27, two
items I intend to get around to eventually).

Note, that although the core machine dependent PA-RISC support code
supports PA-RISC 1.1 and better, we still don't support many older
machines due to proprietary devices with unavailable documentation, etc.
However, there is a better chance that we would eventually support those
than support PA-RISC 1.0 cpu's.

Even given the documentation, I don't think we will ever support PA-RISC
1.0 cpu's.  There are just too many differences that make supporting those
cpu's a pain.  Also, support for an obscure parisc device can usually be
isolated in a separate file or two, whereas adding support for PA-RISC 1.0
would involve changes throughout the machine dependent code in arch/parisc.

In case someone who is reading this is curious, here is a list of
differences that I can think of off the top of my head.  There are
probably others that I have either forgotten or are not aware of.  I
didn't begin working on parisc based machines until the 700 series was
created, which used parisc 1.1a cpus (Although I did follow some of the
earlier technical issues, since I was working for HP at the time, doing
HP-UX kernel development for HP 9000 Series 200/300/400 m68k based
machines).

	DIFFERENCES BETWEEN PARISC 1.0 and later PARISC CPU'S:

        1) No support for shadow registers and their associated rfir
        instruction.  This would mean that a new set of tlb miss handlers
        would need to be written.  Other changes in the interrupt path and
        the non access cache flush emulation code would be required.

	2) Only 16 floating point registers. Would require some
	(albeit fairly simple) changes in the floating point save/restore
	code. This would also require that all commands/libraries that
	use floating point be recompiled with options that let the
	compiler know these floating point registers are not available
	(or add support to the kernel to emulate them! ... ugh).

        3) A larger variety in the support of floating point instructions,
        including some machines that didn't even have an fpu.  Would
        require additional floating point emulation support in the kernel.

        4) 2K Page size rather than 4K.  Would require a variety of
        changes in the machine dependent VM support.  Ideally this
        shouldn't be very hard, but since we haven't yet enabled support
        for other page sizes, there are probably a fair number of
        hardwired 4K page size code dependencies.

        5) Inability to disable space register hashing.  I'm not sure if
        all PA-RISC 1.0 cpu's even supported space register hashing, but I
        believe that some of the ones that do support it have no way of
        turning it off.  This may be the single hardest problem to work
        around.  Very early in the parisc linux implementation we decided
        to use a "flat" address space, i.e. sr4-sr7 are all set to the
        same value.  This simplified a lot of things, and this assumption
        is now fairly embedded in the kernel, compilers, binutils, etc.
        In order to be able to support shared objects (mmap using
        MAP_SHARED, Sys V shared memory, etc) with space register hashing
        enabled, you need to dedicate at least a quadrant of the virtual
        address space to shared mappings, i.e. some space registers would
        be set to a per process private value, whereas as at least one
        would need to be set to a common shared value (this is what HP-UX
        does).  For starters, the address allocation code would need to be
        changed to reflect that.  But that would just be the beginning ...

In summary, I just don't think supporting PA-RISC 1.0 cpu's is worth the
effort.  Note that you can get some newer (i.e. newer than PA-RISC 1.0,
but still quite old!) PA-RISC machines for less than $50.

> > Am I going to get linux up on this baby or the install
> > hpux?
>
> Not linux, but HP-UX should work.  I can't recall if 11.00
> will run on it, but certainly earlier versions will.

As far as HP-UX goes, there is a difference between whether or not it
works and whether or not it is officially supported.  When HP drops
official support it just means that the engineers are free to make design
decisions on newer HP-UX releases that don't need to take into account
support of the older boxes.  We don't have a policy of removing the old
code (see bloat reference below :-)), although that usually happens over
time as the "owners" of various files modify them.  For example, I believe
that 11.0 dropped official support for PARISC 1.1a cpu's, but I believe it
still worked.  Official support for PARISC 1.0 cpu's was dropped at an
earlier date, but I don't know when HP-UX might have stopped working on
those earlier machines (for all I know it may still work).

However, HP-UX, in its attempt to try to meet required features for a wide
variety of customers, continues to bloat.  The size increase from 9.0 to
10.x and from 10.x to 11.x has been significant.  So, if you really want
to get that 822 running reasonably well, I'd try to get as old a version
of HP-UX that you can.  A 9.0 based release will probably give you the
best compromise between features and size.

John Marvin
jsm@fc.hp.com

P.S.  Perhaps there are other ways you can use that 822.  Do you own a
boat? :-)
