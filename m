Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA07394
	for <parisc-linux@puffin.external.hp.com>; Mon, 31 May 1999 22:33:59 -0600
Received: from localhost (adevries@localhost)
	by devserv.devel.redhat.com (8.8.7/8.8.7) with SMTP id AAA18820
	for <parisc-linux@thepuffingroup.com>; Tue, 1 Jun 1999 00:33:05 -0400
Date: Tue, 1 Jun 1999 00:33:05 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.3.96.990601002832.8814F-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Creating a bootable image.
List-ID: <linux-parisc.vger.kernel.org>


I'm mailing this because I'm not entirely sure what I'm doing is correct.

The way I understand it, the kernel we cross compile on Linux is in fact
a broken ELF32 file, which doesn't really matter, because at this point we
don't need the kernel to have any loader information itself.  My theory is
that the kernel itself can be cross compiled properly regardless of how
messed our loader formats are.

However, to actually boot you need IPL, which requires SOM linking, so
that much must be done on HPUX.

What I'm doing is to add a binary prebuilt version of IPL into the kernel
source tree, and enough glue so you can just do:

make bootable

and it'll create a kernel and boot header that should just boot right
away.  That way to do kernel work (and not bootstrap work), you don't need
HPUX at all.

Does that make sense?

- Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
PA RISC Linux Porting Team
