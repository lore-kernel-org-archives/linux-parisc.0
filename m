Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id MAA24155
	for <hppa-linux@sod.res.cmu.edu>; Thu, 18 Mar 1999 12:35:00 -0500
Received: from mailhost.rsn.hp.com (root@idiot.rsn.hp.com [15.99.200.11])
	by palrel1.hp.com (8.8.6/8.8.5tis) with ESMTP id JAA04398
	for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar 1999 09:34:48 -0800 (PST)
Received: from helgaaspc.rsn.hp.com (root@helgaaspc.rsn.hp.com [15.99.148.145])
	by mailhost.rsn.hp.com (8.8.6 (PHNE_14041)/8.8.6) with ESMTP id LAA29402
	for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar 1999 11:34:44 -0600 (CST)
Received: from helgaaspc.rsn.hp.com (helgaas@localhost [127.0.0.1])
	by helgaaspc.rsn.hp.com (8.8.7/8.8.7) with ESMTP id LAA27215
	for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar 1999 11:34:43 -0600
Message-Id: <199903181734.LAA27215@helgaaspc.rsn.hp.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Gateway instructions 
Date: Thu, 18 Mar 1999 11:34:43 -0600
From: Bjorn Helgaas <helgaas@rsn.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

>   I'm wondering if anybody's got a handle on how gateway instructions
>are supposed to work.

The important thing about the gateway instruction is how the page
containing the instruction is mapped in the TLB.  A gateway can only
promote your privilege if the access type of the page containing the
gateway instruction is 4, 5, 6, or 7, i.e., "execute and promote to
privilege level 0, 1, 2, or 3".

The kernel controls the TLB mappings, so while a user can easily generate
gateway instructions, they won't do anything useful unless he can convince
the kernel to map them with the special access rights.

HP-UX maps only a few pages in the whole system with the magic gateway
access rights.  Syscalls work by branching to specific entry points on
these pages.  For 32-bit apps, the entry address is fixed and is hard-
coded into libc.  I think HP-UX supplies the syscall entry point to
64-bit apps in a register, and crt0.s stashes it somewhere.

Since the pages are execute only (not readable or writable), users can't
change the target of the gateway instructions.  The gateway pages contain
things other than gateway instructions, of course, but if you branch to
a non-gateway instruction, you stay at user privilege level and basically
execute some random (from the user's point of view) code.

When you branch to the defined entry point, your privilege level is
promoted, a couple registers are set up for running in the kernel, and you
branch to the the kernel proper, which is mapped with normal read/execute
or read/write/execute access rights.  The privilege levels in kernel
text access rights are set to allow access only at privilege level 0,
so even though a user can address the kernel, he can't read or execute
it without going through the gateway page.
