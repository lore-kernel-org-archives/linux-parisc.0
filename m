Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA04034
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Mar 2000 20:56:29 -0700
From: Bdale Garbee <bdale@gag.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Lasi Ethernet - update
In-Reply-To: <00030302170400.19213@P100>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <20000303025502.6D3E71B9CE@chunks.gag.com>
Date: Thu,  2 Mar 2000 19:55:02 -0700 (MST)
List-ID: <linux-parisc.vger.kernel.org>

In article <00030302170400.19213@P100> you wrote:

> During the tests here, it seems, that the current kernel doesn´t handle
> ARP-requests properly. When I ping one of the machines, the 715 segfaults at
> once with:
>   "Unexpected Interruption!: Code=31 regs=..... (Addr=0000000)"
> Does this happen on other machines/netcards too ?

For what it's worth, I have no problem pinging my A180 running a kernel I 
built with the bits that were current in CVS yesterday booted with NFS root.

Bdale
