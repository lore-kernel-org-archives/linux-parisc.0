Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id F41DC482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 03:03:26 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id 00D86EC4
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 05:03:25 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id DAA15266
	for parisc-linux@lists.parisc-linux.org; Fri, 5 Oct 2001 03:03:25 -0600 (MDT)
Date: Fri, 5 Oct 2001 03:03:25 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200110050903.DAA15266@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] a todo entry
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> This is rather suboptimal.  The way it should be done is to always
> access userspace through %sr2 (currently listed as unused).  Set sr2
> to the same value as sr3 normally.  Set it to 0 when someone does a
> set_fs(KERNEL_DS), and to sr3 when USER_DS.  get_fs() should return the
> value of sr2.  None of these functions are called frequently, so there's
> no need to cache the values outside the space registers.
>
> This probably isn't a big job, but there's probably some subtlety I've
> overlooked.

The subtlety you overlooked is that although sr2 has no current use
in kernel space, it has to be set to 0 while in user space, because
sr2 is used as a pointer to the linux gateway page for system calls.
Right now we initialize it to zero once for the process and save and
restore it on context switches, i.e. a program will only mess itself
up if it changes the value.

I am almost certain that linux never goes to user space while fs is
set to KERNEL_DS. In general fs is normally set to USER_DS, and
only set to KERNEL_DS for a short period of time, and then restored.
However, I do believe it is possible to sleep while fs is set to
KERNEL_DS.

Anyway, perhaps you were already aware of this. It means that you can't
just set sr2 once from sr3, you need to set it every time sr3 is set,
i.e. upon entry to the kernel, at fork/exec time (add one line to
load_context() in pgalloc.h). It also means that sr2 needs to be set
back to zero when returning to user space (through a variety of paths).

Also, in order for set_fs(old_fs) to work correctly you need to do
either:

    1) Set sr2 to 0 when the argument to set_fs is KERNEL_DS, and KERNEL_DS
    must be defined as 0 (it is currently). Set sr2 to sr3 when the
    argument is any non-zero value. get_fs can then return the value of
    sr2.

    2) Set sr2 to 0 when the argument to set_fs is KERNEL_DS. Set sr2
    to sr3 when the argument is USER_DS. get_fs should return KERNEL_DS
    if sr2 is 0. get_fs should return USER_DS otherwise. I prefer this.

John
