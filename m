Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA00989
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Nov 2000 04:39:23 -0700
Date: Fri, 10 Nov 2000 03:26:48 -0800
Message-Id: <200011101126.DAA12490@pizda.ninka.net>
From: "David S. Miller" <davem@redhat.com>
To: rhirst@linuxcare.com
CC: matthew@wil.cx, grundler@cup.hp.com, parisc-linux@thepuffingroup.com,
        jgarzik@mandrakesoft.com
In-reply-to: <20001110111220.J32715@linuxcare.com> (message from Richard Hirst
	on Fri, 10 Nov 2000 11:12:20 +0000)
Subject: Re: [parisc-linux] tulip DMA mapping
References: <200011092012.MAA06943@milano.cup.hp.com> <20001110101808.B11268@parcelfarce.linux.theplanet.co.uk> <200011101016.CAA12058@pizda.ninka.net> <20001110111220.J32715@linuxcare.com>
List-ID: <linux-parisc.vger.kernel.org>

   Date: Fri, 10 Nov 2000 11:12:20 +0000
   From: Richard Hirst <rhirst@linuxcare.com>

   I've quoted the whole of Grants message below, so you can see the
   context.  It looks like tulip is treating zero as meaning it
   doesn't have anything to pci_unmap...

Thank you for the clarification.

Jeff, this is in fact a bug, please fix :-)

Later,
David S. Miller
davem@redhat.com
