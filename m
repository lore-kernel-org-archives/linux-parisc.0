Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0C5F482A
	for <parisc-linux@parisc-linux.org>; Mon, 27 Aug 2001 13:20:46 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15bRw4-00010Q-00; Mon, 27 Aug 2001 20:20:36 +0100
Date: Mon, 27 Aug 2001 20:20:36 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] iotree thoughts
Message-ID: <20010827202036.E525@parcelfarce.linux.theplanet.co.uk>
References: <willy@debian.org> <200108250559.XAA24615@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200108250559.XAA24615@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Fri, Aug 24, 2001 at 11:59:25PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 24, 2001 at 11:59:25PM -0600, Grant Grundler wrote:
> I was confused. The Dino built-in discovery doesn't make PDC calls.

OK, that clears that up :-)

> > So it seems to me that we shouldn't do bus-walks underneath Dino, but
> > rely on PDC telling us about the device if it's attached.
> 
> Uhm, "underneath" is ambiguous since both built-ins and PCI devices
> are heirarchially below "dino" (iotree view - not HW view).
> We need to do PCI bus walks for PCI devices.

I mean native buswalks.  PCI buswalks are outside the scope of this topic.

> I'll assume your statement only refers to Dino built-ins and agree.
> FWIW, same is true for LASI devices.

Hmm.  OK.

-- 
Revolutions do not require corporate support.
