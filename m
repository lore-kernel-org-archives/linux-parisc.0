Received: from opus.allegro.com (opus.allegro.com [209.10.39.50])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id OAA05606
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 14:45:18 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200011152147.NAA23824@opus.allegro.com>
Subject: Re: [parisc-linux] Single-stepping
To: frowand@mvista.com
Date: Wed, 15 Nov 2000 13:47:15 -0800 (PST)
Cc: law@redhat.com, dave@hiauly1.hia.nrc.ca (John David Anglin),
        rhirst@linuxcare.com (Richard Hirst),
        parisc-linux@puffin.external.hp.com
In-Reply-To: <3A12FD2C.665AEF89@mvista.com> from "Frank Rowand" at Nov 15, 2000 01:16:28 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> I implemented two different single step algorithms for a a _kernel_ debugger
> for hp-ux.  The algorithm used could be chosen by a compile switch, because

BTW, Frank, ask Lee Courtney at MontaVista about Debug/iX ...
we've had kernel debugging and single stepping (except for the interrupt 
control stack and a few other corner cases) for 15+ years.

It's *very* powerful to be able to logon as root (or equivalent) and set
breakpoints within the kernel, hit them, and then single step 
... all on a standard release of the operating system.

> I liked the recovery counter method better than my second method (but had to
> deal with collisions with the other kernel services).  My second method was
> to insert a breakpoint at the target of the single step.  It's a pain to do
> that because of issues with delay slots, branching, and nullification.

Worse yet...the breakpoint mechanism raises hell if you have more than
one CPU :)    You realllly don't want that other CPU to hit the breakpoint!
 
-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com        
