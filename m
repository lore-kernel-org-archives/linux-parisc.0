Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA17874
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 Jan 2001 10:40:21 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 1 Jan 2001 17:43:31 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14D8zb-0005mN-00
	for parisc-linux@thepuffingroup.com; Mon, 01 Jan 2001 17:43:31 +0000
Date: Mon, 1 Jan 2001 17:43:31 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010101174331.A21918@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] ZONE_DMA
List-ID: <linux-parisc.vger.kernel.org>


I notice that right now we're partitioning our memory 50% into DMAable
memory and 50% into normal memory (and 0% into HIGHMEM -- but I believe
this part to be correct).  I can't believe that's really the limit of
memory we can DMA into.

I'm not familiar with the hardware problem here.  Must EISA cards be
restricted to a certain part of the address space?  I can glean from
the source that ISA cards are restricted to a 16MB address space --
are we going to support ISA cards?

I presume that no machine which supports ISA cards has an IOMMU that is
capable of mapping a chunk of higher ram into the 16MB bus address space.

-- 
Revolutions do not require corporate support.
