Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id RAA32709
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 17:32:19 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id DB51E1445
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 19:35:55 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id RAA03220 for parisc-linux@puffin.external.hp.com; Wed, 17 Jan 2001 17:34:40 -0700 (MST)
Date: Wed, 17 Jan 2001 17:34:40 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200101180034.RAA03220@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] booting 742
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> Only vaguely - A seperate group in HP supports/developes the "industrial"
> workstations since they run RTE (not HPUX) on them. AFAIK, many of those
> boxes are similar to B-class workstations w/PXC-L or -L2. I have no clue
> how the VME bus is supported - ie bus interface chip or such.

No, they do not run RTE. I don't think RTE ever ran on a parisc box
natively, although I believe there were some translator/emulator
code that allowed RTE binaries to run on parisc.

The 74x series boxes all ran both HP-UX and HP-UX/RT. HP-UX/RT is
probably what you were thinking of. It was a third party based real
time unix variant that HP modified to support some level of binary
compatibility with HP-UX.

They very definitely had a normal PDC and you should at least be able to
get serial output (as long as you set the console to serial) until the
Linux kernel switches from the PDC console.  As Matthew has already
mentioned, the 742 is pretty similar to a 715, so I think you should be
able to get serial output beyond that point as long as you have configured
the kernel for serial console.

I don't have any information regarding the VME bus. I believe there was
another HP proprietary bus bridge chip that would need to be programmed.

John
