Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA19964
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 Jan 2001 21:54:41 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id UAA10555
	for <parisc-linux@thepuffingroup.com>; Wed, 3 Jan 2001 20:57:49 -0800 (PST)
To: Alan Modra <alan@linuxcare.com.au>
cc: Paul Bame <bame@fc.hp.com>, John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
Reply-To: law@redhat.com
In-reply-to: Your message of Wed, 03 Jan 2001 15:44:58 +1100.
             <Pine.LNX.4.21.0101031532370.24351-100000@front.linuxcare.com.au>
From: Jeffrey A Law <law@redhat.com>
Date: Wed, 03 Jan 2001 21:04:25 -0700
Message-ID: <8186.978581065@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <Pine.LNX.4.21.0101031532370.24351-100000@front.linuxcare.com.au>y
  > I'm not particularly enthusiastic about the idea either.  It seemed to be
  > the best solution in the face of a number of packages that "know" libgcc
  > isn't needed when linking certain programs.  eg. linux kernel, binutils
  > testsuite.  The alternatives are
  >   a) fix all the affected packages
  >   b) modify linker scripts
  >   c) magic inbuilt linker behaviour.
But I would consider those very special cases and wouldn't want to pollute
the linker to work around those special cases.

The easiest (to me) solution is to put the routines into the system C
library.  You'd drop the special millcode conventions, but that's a
small price given that the only ones you probably call with any
regularity are div/mod in which case the cost of reloading the pic
registers is dwarfed by cost of the divide.

Then for the kernel you just put the needed routines (probably just
$$div, $$divU, $$rem, $$remU) into arch/parisc/support.S.

jeff
