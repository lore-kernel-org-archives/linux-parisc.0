Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64DC64A19
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Mar 2001 10:22:16 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA15696
	for <parisc-linux@puffin.external.hp.com>; Sun, 4 Mar 2001 10:17:13 -0700
Sender: jgarzik@havoc.gtf.org
Message-ID: <3AA279BC.D85A84AD@mandrakesoft.com>
Date: Sun, 04 Mar 2001 12:22:04 -0500
From: Jeff Garzik <jgarzik@mandrakesoft.com>
MIME-Version: 1.0
To: "David S. Miller" <davem@redhat.com>
Cc: rhirst@linuxcare.com, matthew@wil.cx, grundler@cup.hp.com,
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

Fixed in the latest driver (which Alan has).

Some other drivers need fixing for this, too...

-- 
Jeff Garzik       | "You see, in this world there's two kinds of
Building 1024     |  people, my friend: Those with loaded guns
MandrakeSoft      |  and those who dig. You dig."  --Blondie
