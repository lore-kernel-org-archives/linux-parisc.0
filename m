Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 408BB485D
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Jun 2001 08:17:47 -0600 (MDT)
Message-Id: <200106061410.IAA26608@puffin.external.hp.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Your message of "Wed, 06 Jun 2001 15:28:16 +0200."
             <3B1E2FF0.7D086DB9@esiee.fr>
Date: Wed, 06 Jun 2001 08:10:15 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Subject: [parisc-linux] Re: The A500 dump
List-ID: <linux-parisc.vger.kernel.org>

Thomas Marteau wrote:
> 	I just get a dump from our A500. After that, everything was pretty out
> of service (even the lan console).
...

> skput:over: 000000001025259c:1440 put:-8 de
> v:<NULL>kernel BUG at skbuff.c:93!

I've seen this recently - past month or so.
Could you check kernel bugs and/or parisc-linux mail  archive for the same
skbuff.c output? I wasn't able to track this down all the way either.
If I didn't submit a bug for it, I'll see if I can dig up the info and
submit one.

....
> IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000010239ed8 0000000010239e
>   dc
>  IIR: 0e8112d0    ISR: 0000000000000000  IOR: 0000000000000008
> ORIG_R28: 0000000010149f94


For starters, you really want to know what IAOQ and GR02 point at.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
