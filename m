Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA08190
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Mar 2000 07:21:20 -0700
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: Bdale Garbee <bdale@gag.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Lasi Ethernet - update (fixed!)
Date: Fri, 3 Mar 2000 14:14:07 +0100
Content-Type: text/plain
References: <20000303025502.6D3E71B9CE@chunks.gag.com>
In-Reply-To: <20000303025502.6D3E71B9CE@chunks.gag.com>
MIME-Version: 1.0
Message-Id: <00030314221100.02384@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Fri, 03 Mar 2000 schrieb Bdale Garbee:
> In article <00030302170400.19213@P100> you wrote:
> 
> > During the tests here, it seems, that the current kernel doesn´t handle
> > ARP-requests properly. When I ping one of the machines, the 715 segfaults at
> > once with:
> >   "Unexpected Interruption!: Code=31 regs=..... (Addr=0000000)"
> > Does this happen on other machines/netcards too ?
> 
> For what it's worth, I have no problem pinging my A180 running a kernel I 
> built with the bits that were current in CVS yesterday booted with NFS root.
> 
> Bdale

Hi Bdale,

Thanks for your response. 
I found the bug in the lasi-ethernet driver, so it works now ! The problem
was, that the kernel crashed right after going to user-mode, and so I assumed
that it was a general kernel-related problem and not related to the
lasi-ethernet-driver.

This is fixed now in CVS. People, who have older machines are now able
to boot the kernel via nfsroot.

Helge.
