Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 468634834
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Sep 2001 00:33:49 -0600 (MDT)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id IAA27732 for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Sep 2001 08:33:47 +0200 (MET DST)
Message-Id: <sbb19279.048@ms-zrt1>
Date: Wed, 26 Sep 2001 08:16:49 +0200
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <joel.soete@freebel.net>, <parisc-linux@lists.parisc-linux.org>
Cc: <JSO@EUROPAY.COM>
Subject: Re: [parisc-linux] How to merge Kernel 2.4.9 for hppa and new
	kernel 2.4.10
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>Hi all,
>
>I just learn that new release 2.4.10 of GNU/linux kernel was released.
>I am curious to know how to merge last kernel 2.4.9-paxx and the new
>2.4.10?
>Is somebody can explain me or where to find relevant info?
>

- get a plain 2.4.9 source tree
- make a diff between 2.4.9-paxx and 2.4.9
- download the 2.4.9-2.4.10 diff
- apply to the 2.4.9 sourcetree and create a 2.4.10 sourcetree
- apply 2.4.9-paxx diff to 2.4.10

which should all be straight-forward, but then
- solve all the .rej files that are created, and debug the new kernel

which is something I wouldn't want to do :-)

If you read the linux-kernel mailing list, you'll see that some people =
claim=20
2.4.10 is the best thing since sliced bread, but the first serious VM =
problems
have been sighted already, so upgrading right away is risky.

Eventually, it'll be in the CVS at puffin.external.hp.com. Until then, the =
best
thing to do is wait, unless you have the capabilities to debug the last =
step.
If so, I think there are other things to get your teeth in - just ask =
here.

Good luck,
Jurriaan
