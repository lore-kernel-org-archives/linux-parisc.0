Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA07638
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Nov 2000 02:36:18 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id 3FD012C2
	for <parisc-linux@thepuffingroup.com>; Wed,  1 Nov 2000 04:37:59 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id CAA16167 for parisc-linux@thepuffingroup.com; Wed, 1 Nov 2000 02:37:58 -0700 (MST)
Date: Wed, 1 Nov 2000 02:37:58 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011010937.CAA16167@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: Elf Header change proposal
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


Paul and Alan pointed out that I goofed. I analyzed the vmlinux in my 64
bit build area to get the current flags, but it turns out that the vmlinux
I looked at was a 32 bit version. I had recently made some 64 bit checkins,
and I like to rebuild everything for 32 bit before doing that, to make
sure that I haven't broken the 32 bit path by making 64 bit changes.

So, the bad news is that I wasted time writing an unecessarily long
design proposal. The good news is that the only thing that needs to
change is value in the e_ident[EI_OSABI] field, so that we can
differentiate 64 bit HP-UX binaries from 64 bit Linux binaries.
We should also change the field for 32 bit Linux also.

John
