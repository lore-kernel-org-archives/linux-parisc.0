Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA07615
	for <parisc-linux@puffin.external.hp.com>; Fri, 13 Oct 2000 23:49:06 -0600
Received: from localhost (raj@localhost)
	by basm.cerias.purdue.edu (8.9.3+Sun/8.9.3) with ESMTP id AAA12469
	for <parisc-linux@thepuffingroup.com>; Sat, 14 Oct 2000 00:50:16 -0500 (EST)
Date: Sat, 14 Oct 2000 00:50:16 -0500 (EST)
From: Brian Poole <raj@cerias.purdue.edu>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.SOL.4.10.10010132356161.22986-100000@basm.cerias.purdue.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Troubles following the 'recipe'
List-ID: <linux-parisc.vger.kernel.org>

Hello,

I was looking to test Linux out and see how it was going towards
supporting my poor old HP9000 715/80 that I have here, however I seem to
have some trouble compiling the toolchain as described in the 'recipe' and
would like to ask for some assistance if possible.

I have followed the instructions very closely, deviating only twice in
areas which I can't see affecting my problem. The first was to add -j 2
to the make commands to help speed it up on my systems, as both are SMP.
The other was to grab nfsroot-latest.tar.gz instead of 
nfsroot-20000214.tar.gz, mainly becuase that file no longer exists (might
need to update the recipe?). However as I hadn't reached anything to do
with the nfsroot yet, I deem this inconsquential as well.

So what is the problem? Well, a while (hard to say exactly, one is a
dual 500, the other is a dual 100, big difference in times ;) into the
building of gcc both of my machines error out, complaining that they can't
find some header files. Specifically it errors out while compiling
iogetline.c, complaining that it can't find errno.h (from
../../../gcc/libio/libioP.h:30:19), _G_config.h 
(../../../gcc/libio/libio.h:30:23) and string.h 
(../../../gcc/libio/iogetline.c:27:20). The errors are the same for each
machine. I downloaded all of the files today, October 13th.

Hopefully I am just doing something obviously wrong that someone could
point out to me and I can proceed happily along. Both systems have
working compilers & libraries, one is a SuSE 6.3 install and the other is
Slackware 7.1. I can provide tons more information if it is desired, tried
to just give the information that looked relevant. Or if this is a
waste of time and I should just stop trying to compile my own and grab the
binaries (which I just noticed were also available) please tell me.


Thanks for the time,

-b
