Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 893184A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 23:32:40 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA31200
	for <parisc-linux@puffin.external.hp.com>; Mon, 5 Feb 2001 23:28:24 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 6 Feb 2001 06:32:38 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Q1DN-00066K-00; Tue, 06 Feb 2001 06:02:57 +0000
Date: Tue, 6 Feb 2001 06:02:57 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>,
	Ryan Bradetich <rbradetich@uswest.net>,
	parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] RFC: I/O tree design
Message-ID: <20010206060257.B27096@parcelfarce.linux.theplanet.co.uk>
References: <20010203175751.C12985@parcelfarce.linux.theplanet.co.uk> <200102051834.KAA02270@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200102051834.KAA02270@milano.cup.hp.com>; from grundler@cup.hp.com on Mon, Feb 05, 2001 at 10:34:48AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Feb 05, 2001 at 10:34:48AM -0800, Grant Grundler wrote:
> Matthew Wilcox wrote:
> ...
> > One advantage of doing this is that `Child' could be a pointer to a
> > PCI bus.
> 
> I don't think I want that. PCI busses have their own heirarchy
> and I would much rather keep them quite seperate. At least for
> the moment I would. Future abstraction of native bus access
> and mgt methods might make this more interesting.

I was thinking along the lines of:

struct hp_bus;
struct hp_device {
	[...]
	int bus_type;
	union {
		struct pci_bus *pci;
		struct hp_bus *hp;
	} child;
};

and then use the pci_bus sysdata to point to the struct hp_device which
is the parent of this pci_bus.

Rather than try to abuse the `parent' entry in the pci_bus.

> Sometimes, it's convenient to think of the memory controller(s)
> as the "parent" of the central bus and memory banks as children
> (just like CPU would also be a child). This model works under ccNuma
> as well with memory at multiple levels in the I/O tree.

Yeah, I was thinking about that.  In some of the larger systems (say,
N class), there's no real central point at which to base the bus walk,
other than the Stretch memory controller.

-- 
Revolutions do not require corporate support.
