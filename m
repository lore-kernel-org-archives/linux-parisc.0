Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2533D482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 14:39:29 -0600 (MDT)
Message-Id: <200107112038.OAA07896@puffin.external.hp.com>
To: Paul Bame <bame@fc.hp.com>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	Charles Boone <ccboone@yahoo.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Problem installing .9 iso image on C240 
In-Reply-To: Message from Paul Bame <bame@fc.hp.com>
   of "Wed, 11 Jul 2001 09:23:33 MDT." <E15KLpt-0003hL-00@noam.fc.hp.com>
Date: Wed, 11 Jul 2001 14:38:08 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
> I don't know that a 64-bit kernel buys you much on a C240 -- am I mistaken?

I think not.

I thought about making the same comment since in general wide-mode
just runs 2-5% slower. But some apps could take advantage of the wider
words for substantial perf gains...but since we don't support 64-bit apps
(yet) and only a few isolated places in the kernel would benefit (eg
cksum'ing code), I don't see 64-bit kernel a "must have" for C240.

> = > PDC on the C240 (and similar C-models of that generation) only
> = > support PDC calls in "narrow" (ie 32-bit) mode. Sounds like the decision
> = > to install 32 vs 64-bit depends on the PDC capabilities bit.
> = > Can anyone offhand confirm/deny?
> 
> Yes, palo asks the firmware whether one or both of 32&64-bit OSs will
> run on the box.  Cxxx says 32 bit only.  If both are possible, palo
> chooses 32-bit for now.

Ok - thanks!
And I think that's fine in general. Someone with a specific
need for 64-bit ops can build/install a 64-bit kernel after the fact.
Someday we might have a real 64-bit userspace and it might be interesting
to get pickier about install support for PA2.0 CPU's.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
