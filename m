Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id D22614A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 11:32:35 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA29190
	for <parisc-linux@puffin.external.hp.com>; Mon, 5 Feb 2001 11:28:20 -0700
Message-Id: <200102051834.KAA02270@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] RFC: I/O tree design 
In-reply-to: Your message of "Sat, 03 Feb 2001 17:57:51 PST."
             <20010203175751.C12985@parcelfarce.linux.theplanet.co.uk>
Date: Mon, 05 Feb 2001 10:34:48 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
...
> One advantage of doing this is that `Child' could be a pointer to a
> PCI bus.

I don't think I want that. PCI busses have their own heirarchy
and I would much rather keep them quite seperate. At least for
the moment I would. Future abstraction of native bus access
and mgt methods might make this more interesting.

> > This proposal also calls for a special "root" node at
> 
> And you don't ned a root node, just siblings.

You are right - PCI starts out as a bunch of siblings too.
If it makes the code simpler to have a root node, then
I think it's ok to keep it.

Sometimes, it's convenient to think of the memory controller(s)
as the "parent" of the central bus and memory banks as children
(just like CPU would also be a child). This model works under ccNuma
as well with memory at multiple levels in the I/O tree.

Note that HPUX walks the "PA I/O tree" in a depth-first
fashion like PCI as well. So I expect the "siblings-only
for central bus" would be ok.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
