Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91EEC4A18
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 04:45:56 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id CE73012BD
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 06:45:55 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id EAA28179 for parisc-linux@lists.parisc-linux.org; Fri, 2 Feb 2001 04:45:55 -0700 (MST)
Date: Fri, 2 Feb 2001 04:45:55 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200102021145.EAA28179@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] calling PDC_PSW from head.S on A500
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>
> To enable slave's properly, I need to call PDC to set the wide
> mode as default (for trap handling). Thanks to jsm for getting
> me this far. But it HPMC's in A500 PDC.
> Any ideas what else I need to do?
>
>
> "ser pim 0 HPMC" output is appended.
> The CPU is clearly excuting PDC.
> %r2 correctly contains the return ptr.
> %r3 contains the PDC address called.
> %sp points to a valid stack area. (virtual vs physical?)
>

Grant,

Since you are in real mode, the stack and return pointer need to contain
physical addresses, not virtual addresses. You should load the physical
addresses instead of the virtual addresses by putting a PA() around
the expressions to load32 (See real2.S for an example). After the call
you can convert the stack pointer to virtual with the tovirt macro, i.e.:

    < make pdc call >

    tovirt %sp

John
