Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA24986
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Oct 1999 09:39:49 -0600
Received: from udlkern.fc.hp.com (root@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id JAA23987
	for <parisc-linux@thepuffingroup.com>; Thu, 28 Oct 1999 09:40:54 -0600 (MDT)
Received: from debian.fc.hp.com (root@debian.fc.hp.com [15.1.48.119]) by udlkern.fc.hp.com with ESMTP (8.8.6 (PHNE_14041)/8.7.1) id JAA19301 for <parisc-linux@thepuffingroup.com>; Thu, 28 Oct 1999 09:40:53 -0600 (MDT)
Received: from debian.fc.hp.com (bame@localhost [127.0.0.1])
	by debian.fc.hp.com (8.9.3/8.9.3/Debian/GNU) with ESMTP id JAA20188
	for <parisc-linux@thepuffingroup.com>; Thu, 28 Oct 1999 09:40:53 -0600
Message-Id: <199910281540.JAA20188@debian.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hack to use HPUX boot loader 
In-reply-to: Your message of "Thu, 28 Oct 1999 11:22:21 EDT."
             <199910281522.LAA06762@hiauly1.hia.nrc.ca>
Date: Thu, 28 Oct 1999 09:40:53 -0500
From: Paul Bame <bame@debian.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= > 
= > Am Wed, 27 Oct 1999 schrieb Paul Bame:
= > > = 
= > > = Has anyone confirmed that the kernel which is started is getting good
= > > = data (stack, etc...) or are my kernels booting purely by accident?
= > > = 
= > > 
= > > Phillip looked over some boot messages after being booted with the
= > > hpux boot loader and blessed them, so things appear to be working well.
= 
= I find it very strange that the kernel is being linked to start at
= 0xc0010000.  It's not your average machine that has this much physical
= memory.

Linux on i386 is also relocated to around 3Gb.  In both cases,
Linux is physically loaded near 0Gb, and then physical memory is
virtually mapped to show up starting at 3Gb.  Until the VM is
enabled you're right, using those 3Gb addresses won't work in a
debugger.

= Comments?

Sure, that's the way it's done in Linux 2.2.x right now and it
is the kernel machine-independent code assumes that scheme or a
simliar one is in effect so we can't really change it.  I don't
know what 2.3 has done.

	-P
