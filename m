Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA02325
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Nov 2000 07:31:57 -0700
Sender: jgarzik@havoc.gtf.org
Message-ID: <3A0C0691.E605D148@mandrakesoft.com>
Date: Fri, 10 Nov 2000 09:30:41 -0500
From: Jeff Garzik <jgarzik@mandrakesoft.com>
MIME-Version: 1.0
To: "David S. Miller" <davem@redhat.com>
CC: rhirst@linuxcare.com, matthew@wil.cx, grundler@cup.hp.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] tulip DMA mapping
References: <200011092012.MAA06943@milano.cup.hp.com> <20001110101808.B11268@parcelfarce.linux.theplanet.co.uk> <200011101016.CAA12058@pizda.ninka.net> <20001110111220.J32715@linuxcare.com> <200011101126.DAA12490@pizda.ninka.net>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"David S. Miller" wrote:
> 
>    Date: Fri, 10 Nov 2000 11:12:20 +0000
>    From: Richard Hirst <rhirst@linuxcare.com>
> 
>    I've quoted the whole of Grants message below, so you can see the
>    context.  It looks like tulip is treating zero as meaning it
>    doesn't have anything to pci_unmap...
> 
> Thank you for the clarification.
> 
> Jeff, this is in fact a bug, please fix :-)

np.  Like Matthew(?) hinted, this is not the only place that needs
fixing.  I'll take care of it.

	Jeff


-- 
Jeff Garzik             |
Building 1024           | Would you like a Twinkie?
MandrakeSoft            |
