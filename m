Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC4174964
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Oct 2001 16:01:37 -0600 (MDT)
Sender: marteaut@esiee.fr
Message-ID: <3BC37248.8D97FE2C@esiee.fr>
Date: Tue, 09 Oct 2001 23:55:20 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Markus =?iso-8859-1?Q?D=F6hr?= <doehrm@aubi.de>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Newbie on PA: Trying to compile kernel
References: <7B1EED0C5D58D411B73200508BDE77B2C53CA9@EXCHANGEB>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi again,
> 
> No, I'd like to do a native linux-kernel-on-linux compile.
Damn it, I did well but it was the stuff for you. I am sure it will help
some one else :-)

> I'm compiling kernels since 1.9.X (don't remember exactly) on INTEL and
> Sparc, but never did on parisc. So I did the following:
I hope you have time. Compiling with 712 is fun but long :(

> The documents tell me to use either NFS or a RAMDISK in palo/Makefile and
> _here's_ the problem (or the documents are outdated). I'll try the manual
> approach and see what'll happen.
These documents were written at a time when HDD were not so well
supported.
If you just want to update your kernel, you just do 
apt-get update
apt-get upgrade # in order to get the last gcc version

after that, you follow what I said about make menuconfig...

I tested this way of producing kernel a long time ago. I am sure it will
be ok.

FYI, the ramdisk or NFSroot is needed if you do a make palo but you do
only make vmlinux!

> PS-OT: I wonder if SAP will port their application server to parisc/Linux...
I really do not know. Perhaps, Helge Deller will know :)

Good Luck anyway, Thomas.
ESIEE Team
