Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maestro.symsys.com (maestro.symsys.com [208.223.9.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32B684A19
	for <parisc-linux@parisc-linux.org>; Fri,  2 Mar 2001 12:48:37 -0700 (MST)
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id NAA12311
	for <parisc-linux@parisc-linux.org>; Fri, 2 Mar 2001 13:48:36 -0600
Date: Fri, 2 Mar 2001 13:48:36 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc-linux@parisc-linux.org
In-Reply-To: <20010302012631.C62DB37CB2@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0103021230140.12009-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C100 Self-Hosting
List-ID: <linux-parisc.vger.kernel.org>

I tried to self-host on my C100 with the recent root filesystem from
ISIEE.  The first problem was I needed the CVS bins.  I grabbed the
sources from Debian and the build went without a hitch.  I've posted a
tarball of (I hope) all of the relevant bits here:

	http://www.symsys.com/~ingram/linux/parisc/cvs.tar.gz

I checked out the linux and palo sources, configured the kernel and made
dependancies.  I ran into the following problems with 'make palo':

1)  arch/parisc/Makefile specifies the cross-compiler

I guess most people are using the cross-compiler so maybe it should stay
that way for now.  Anyway, once I commented out that line the kernel build
took off.

2)  conflicting types for mem{cmp|cpy|set} built-ins 

Lots and lots of warnings.  Should I add -fno-builtin?

3)  conflicting types for off_t in <stdio.h> and "linux/types.h"

I was able to dodge this error by defining '__off_t_defined' right before
including <stdio.h> in palo/lib/elf32.c.

And now [ drumroll ] the build succeeds and the self-built kernel boots.  

Woohoo!

- Greg
