Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE1F3482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Sep 2001 04:12:34 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id 46262307
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Sep 2001 06:12:34 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id EAA27443
	for parisc-linux@lists.parisc-linux.org; Mon, 17 Sep 2001 04:12:30 -0600 (MDT)
Date: Mon, 17 Sep 2001 04:12:30 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200109171012.EAA27443@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: Getting up and running
List-ID: <linux-parisc.vger.kernel.org>

>
> How does this look?  I can't test it because I don't have a 720-era machine,
> but it ought to work, I think...
>

<Patch Deleted>

No, it needs to be a little more complicated than that. That patch doesn't
take into account byte and half-word accesses to a page. The real fix
needs to look at the instruction in the iir register in combination with
the ior value in order to determine whether the access is unaligned.

I thought for a second that the patch might work anyway, since the
unaligned fault handler has exception table support, so even though
the instruction might be unecessarily emulated, it would still
successfully bring the page in, but the unaligned fault handler
uses ldb, which would just cause an infinite loop ...

So, the correct fix should probably involve leveraging some of the
macros in unaligned.c and writing something like check_unaligned(regs)
that would be used by the trap 18 handler to determine whether or
not the access was unaligned or not.

John
