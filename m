Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 825594A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Feb 2001 09:45:13 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id C25F2AD4
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Feb 2001 11:43:36 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id JAA11885 for parisc-linux@lists.parisc-linux.org; Tue, 13 Feb 2001 09:43:36 -0700 (MST)
Date: Tue, 13 Feb 2001 09:43:36 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200102131643.JAA11885@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Large Memory Support changes
List-ID: <linux-parisc.vger.kernel.org>

I just committed code that moves PAGE_OFFSET from 0xc0000000 to 0x10000000.
Since the parisc port of Linux uses a separate address space for the kernel,
this does not affect the user address space. In fact, another change I
committed a few days ago makes the full 4Gb (ok, actually 4Gb - 1 Mb)
virtual address space available to a 32 bit process.

For users, this means that parisc linux now supports up to 3.5 Gb of
physical memory. The current design reserves the lower 256 Mb for
mapping space (vmalloc, pcxl dma, temporary flushing aliases, gateway page,
etc). The top 256 Mb are currently set aside for possibly equivalently
mapping the parisc I/O space on a 32 bit kernel. This may not be done,
in which case we can raise the limit on physical memory to 3.75 Gb for
the 32 bit kernel.

Of course, I haven't tested it on any machine that has over 1 Gb, so this
is just theory for now.  Future changes will allow significantly more
physical memory on a 64 bit kernel.

For parisc linux kernel developers, the following changes should be noted:

    1) The LDIL_FIXUP macro is gone! It is no longer necessary,
    since none of the static symbols have the top bit set in their
    address.

    2) It is no longer possible to convert from a physical to virtual
    address (and vice versa) with one assembly instruction.  Another
    register is required to do this operation.  Therefore, the tophys and
    tovirt assembly macro's had to change.  I've provided two versions of
    each one, and each version is implemented using two instructions.  The
    following examples are for the tophys based macros.  The tovirt macros
    are similar:

	a) tophys <virt register>,<phys register>

        This version takes two registers, and they cannot be the same
        register.  This macro might be useful when you still have a use
        for the virtual address, or the register was going to be copied
        anyway.  It also might be the macro to use if you can't afford to
        trash r1 (see below).

	b) tophys_r1 <register>

	This version takes one register (other than r1!). It can
	be used like the old version of tophys, however, this
	version trashes r1. The name is supposed to remind you
	of that side effect.

    3) Note that you may not be able to easily tell kernel adddresses from
    user addresses in register/stack dumps in all cases.  You need to
    check the associated space register to be sure.

    For typically small processes ( < 256 Mb) and machines with < 768 Mb
    of physical memory it still won't be too hard. But the addresses
    will be different than before:

	a) user process text/data/bss variables: No Change

	    These are typically low addresses

	b) user process mapped objects: No Change

	    The default map offset of 0x40000000 hasn't changed

	c) user process stack: Changed

	    Previously user stack addresses were around 0xbb000000,
	    now that will most likely start at 0xfaf00000.

	d) kernel text/data/bss variables: Changed

	    Due to the PAGE_OFFSET change, these have changed
	    from addresses that start at 0xc0100000 to addresses
	    that start at 0x10100000.

	e) kernel stack and other dynamic objects: Changed

	    These can span almost the entire range of kernel
	    virtual memory. They are also affected by the
	    PAGE_OFFSET change.

	f) VMALLOC, pcxl dma mappings, etc.

	    The VMALLOC space is now BELOW PAGE_OFFSET! It is
	    wrong to test addresses against "high_memory" and
	    assume that if they are greater that they must
	    be vmalloc'ed. Note that code that checks against
	    PA(high_memory) might be ok, depending on what
	    is being done. If you need to check if an address
	    is in the VMALLOC space, test against VMALLOC_START
	    and VMALLOC_END. If you need to check if an address
	    is in the normally mapped kernel address space,
	    check against PAGE_OFFSET and high_memory. The
	    mem/kmem driver (drivers/char/mem.c) can be used
	    as an example of how to do this correctly.

Let me know if you have any questions, see any problems, etc.

John Marvin
jsm@fc.hp.com
