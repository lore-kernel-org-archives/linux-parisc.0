Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 46316482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Apr 2001 13:26:43 -0600 (MDT)
Message-Id: <200104261919.NAA08896@puffin.external.hp.com>
To: =?ISO-8859-1?Q?Pasi_K=E4rkk=E4inen?= <pasik@iki.fi>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Couple of things 
In-Reply-To: Your message of "Thu, 26 Apr 2001 13:31:37 +0300."
             <Pine.LNX.4.33.0104261324110.24303-100000@edu.joroinen.fi>
Date: Thu, 26 Apr 2001 13:19:27 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

=?ISO-8859-1?Q?Pasi_K=E4rkk=E4inen?= wrote:
> 
> Hello!
> 
> It's nice to see Linux working nicely on those HP's. I've successfully ran
> Linux on 715/80, 715/100 and 712/80.
> 
> Now I have Visualize C160, which has PCI-slots. Does Linux/pa-risc support
> PCI-slots? Any idea if tulip-driver will work on Linux/pa-risc? or some
> other pci-networkcard-driver? (I'd like to get 10/100Mbps network to this
> machine..)

Yes - the only open problem at the moment is copying from CD-ROM to disk.
Net->disk and disk->disk work fine. So if you can install via NFS root
you can try it.

> Are there known problems with STI? My machines had maximum of couple of
> hours uptime when STI was enabled. Without STI those machines have been
> running perfectly..

File bugs at bugs.parisc-linux.org.
The ESIEE team and Helge Deller have been working on STI support.
 
> How about XFree? Is someone working on the port?

I've built Xfree86 debs (with guidance from Alan Cox's patch) last week
(and those are available on pehc - soon via debian mirror). The changes
are integrated into the debian source (unstable) thanks to Branden Robinson
and Bdale Garbee. xterm and xlogo seem to work.  But I haven't tried to
run the Xserver yet. Hypothetically I should be able to run Xnest but
don't have time to fool with it right now.

And the code for HPUX (2d) support is supposed to be in the X11 consortium
source tree. I haven't looked to see how much of that is in Xfree86.
Any takers?

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
