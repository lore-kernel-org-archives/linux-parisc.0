Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5817E4A18
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 04:51:26 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id B493B12C6
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 06:51:25 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id EAA28232 for parisc-linux@lists.parisc-linux.org; Fri, 2 Feb 2001 04:51:25 -0700 (MST)
Date: Fri, 2 Feb 2001 04:51:25 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200102021151.EAA28232@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems building glibc
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>
> Hi,
>
> building with palinux-autobuilder from todays CVS head I get following
> problem on 32bit parisc
>
> Greetings,
> Helge

Helge,

This is a known problem. The currently built compilers have a bug that
doesn't allow glibc to be built with the O2 option. You can edit the
glibc Makeconfig to fix this. Even if you have a compiler with the bug
fixed, I don't believe anyone has built and tested glibc built with
-O2 yet.

I believe the Alan Modra has already checked in a fix for this, I just
don't remember what branch the fix is on. Matt Taggart is in the process
of building new sets of tools, both native and XC, so the fix may be
available soon.

John
