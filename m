Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm1.tiscalinet.be (spoolm1.tiscalinet.be [212.35.2.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 594FC4837
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Sep 2001 09:42:10 -0600 (MDT)
Sender: jso@dsl2.external.hp.com
Message-ID: <3BB1F897.F11FCE7E@freebel.net>
Date: Wed, 26 Sep 2001 15:47:35 +0000
From: Soete Joel <joel.soete@freebel.net>
MIME-Version: 1.0
To: Jurriaan Kalkman <Jurriaan.Kalkman@zrt.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] How to merge Kernel 2.4.9 for hppa and newkernel
 2.4.10
References: <sbb19279.047@ms-zrt1>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Jurriaan,

Jurriaan Kalkman wrote:
> 
> >Hi all,
> >
> >I just learn that new release 2.4.10 of GNU/linux kernel was released.
> >I am curious to know how to merge last kernel 2.4.9-paxx and the new
> >2.4.10?
> >Is somebody can explain me or where to find relevant info?
> >
> 
> - get a plain 2.4.9 source tree
> - make a diff between 2.4.9-paxx and 2.4.9
> - download the 2.4.9-2.4.10 diff
> - apply to the 2.4.9 sourcetree and create a 2.4.10 sourcetree
> - apply 2.4.9-paxx diff to 2.4.10
> 
> which should all be straight-forward, but then
> - solve all the .rej files that are created, and debug the new kernel

Actually I was not so far from the solution; I start this method
(basicaly on vger cvs 2.4.10-prexx) and I just miss the last two steps.
Thanks a lot.

> 
> which is something I wouldn't want to do :-)
> 
> If you read the linux-kernel mailing list, you'll see that some people claim
> 2.4.10 is the best thing since sliced bread, but the first serious VM problems
> have been sighted already, so upgrading right away is risky.
> 
> Eventually, it'll be in the CVS at puffin.external.hp.com. Until then, the best
> thing to do is wait, unless you have the capabilities to debug the last step.
> If so, I think there are other things to get your teeth in - just ask here.

Ok, I am far to have enough kernel knowledge (just a bit c) to begin
this job alone. Also I will follow your advise and wait it puffin CVS.

> 
> Good luck,
> Jurriaan

Anyway It could also be helpfull for any other project.

Thanks again,
	Joel
