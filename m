Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA12279
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Oct 1999 16:49:24 -0600
Date: Tue, 26 Oct 1999 18:54:24 -0400 (EDT)
From: Alex deVries <adevries@thepuffingroup.com>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] B132L console output
In-Reply-To: <199910262115.OAA03994@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.10.9910261851210.30574-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Tue, 26 Oct 1999, Grant Grundler wrote:
> This B132L I took this output from is unique.
> It has a DEC PCI-PCI bridge stuck in it and our buswalk handles it fine.

I have a couple of questions about this machine:

> Lastly, the "lasi serial #1 at 0xffe02000" not getting claimed
> is becaused it's trying to talk to Dino's RS-232. lasi_alloc_irq()
> handles it correctly by failing and this failure correctly results
> in not claiming the device.

We need to fix it so that it doesn't attempt to load the Lasi serial
driver when it's really a Dino RS 232.  That should be pretty easy to fix.

> Found devices:
> 1. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0, 0x0, 0x0, 0x0
> 2. Unknown device (4) at 0xfff8c000, versions 0x3c, 0x0, 0x89, 0x0, 0x80

Do you have any idea what that unknown device might be?

> 6. Merlin 132 Core RS-232 (10) at 0xffd05000, versions 0x3c, 0x0, 0x8c, 0x0, 0x0
> 16. Merlin+ Wax RS-232 (10) at 0xffe02000, versions 0x3a, 0x0, 0x8c, 0x0, 0x0

Which of those is actually connected?

> 11. Merlin 132 Core PC Keyboard (10) at 0xffd08000, versions 0x3c, 0x0, 0x84, 0x0, 0x0
> 12. Merlin 132 Core PC Keyboard (10) at 0xffd08100, versions 0x3c, 0x0, 0x84, 0x0, 0x0
> 15. Merlin+ Wax HIL (10) at 0xffe01000, versions 0x3a, 0x0, 0x73, 0x0, 0x0

How about those?

- Alex
