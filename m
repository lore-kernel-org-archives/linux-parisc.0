Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA22579
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Dec 2000 02:43:13 -0700
Received: from mxdk.dk.tellabs.com (mxdk.dk.tellabs.com [172.19.74.16])
	by mx.tellabs.fi (8.8.8/8.8.8) with ESMTP id LAA07178
	for <parisc-linux@thepuffingroup.com>; Wed, 13 Dec 2000 11:45:27 +0200 (EET)
Received: from tellabs.com (pc-rtheande.dk.tellabs.com [172.19.62.43])
	by mxdk.dk.tellabs.com (8.8.6 (PHNE_17135)/8.8.6) with ESMTP id KAA13840
	for <parisc-linux@thepuffingroup.com>; Wed, 13 Dec 2000 10:45:27 +0100 (MET)
Message-ID: <3A37452B.B5D1BCC2@tellabs.com>
Date: Wed, 13 Dec 2000 10:45:15 +0100
From: Robin Theander <Robin.Theander@tellabs.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 712/60 booting problem
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> Marko.T.Niskanen@nokia.com wrote:
> > kernel BUG at pci-dma.c:400!
> > kernel BUG at pci-dma.c:391!
> > kernel BUG at pci-dma.c:400!
> > kernel BUG at pci-dma.c:391!
> > kernel BUG at pci-dma.c:400!
> > ISO 9660 Extensions: RRIP_1991A
> > VFS: Mounted root (iso9660 filesystem) readonly.
> Those are actually messages that are perfectly normal.
> I wonder if Marko's problems are specific to the 712/60, does anyone
> else with a 712/60 have such kernel panics? I don't on my 712/80.

I have a 712/60 and I see the same. The box works quite well.
The same messages also appear when mounting/unmounting filesystems.

Robin.

-- 
ASIC Design Engineer
Tellabs Denmark A/S

Direct: +45 4473 2942
robin.theander@tellabs.com
