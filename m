Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA11711
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 10:07:01 -0600
Date: Thu, 21 Oct 1999 12:06:32 -0400 (EDT)
From: Christopher Beard <chris@thepuffingroup.com>
To: Alex deVries <adevries@thepuffingroup.com>
cc: Magne =?iso-8859-1?Q?=D8stlyngen?= <magne@spacetec.no>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] So you wanna get to a prompt, eh?
In-Reply-To: <Pine.LNX.4.10.9910211105330.17129-100000@vodka.thepuffingroup.com>
Message-ID: <Pine.LNX.4.10.9910211202300.18709-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


> > Is the ramdisk included in the kernel-image? When I boot the kernel,
> > I get 'no ramdisk'.
> 
> To build the kernel right now, you have to download a ramdisk from
> ftp://puffin.external.hp.com/pub/parisc/binaries/ramdisks or similiar.

You don't need the ramdisk if you are booting from a binary image, you only
need it if you are attempting to build your own from the source tarball
that was posted. The confusion exists in that the bootloader currently
reports:

	Loading PA-RISC/Linux Kernel...
	No ramdisks available.

And then continues along with the boot process.

Support for ramdisks was built into the bootloader, which is likely the
prefered method, however, it has never been used. It is safe to ignore this
for now.
 
Chris
