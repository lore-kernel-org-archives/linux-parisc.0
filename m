Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1FFE64830
	for <parisc-linux@parisc-linux.org>; Fri,  5 Oct 2001 18:30:40 -0600 (MDT)
Message-Id: <200110060026.SAA05769@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] pdc_add_valid 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Fri, 05 Oct 2001 17:22:22 BST." <20011005172222.D19206@parcelfarce.linux.theplanet.co.uk>
Date: Fri, 05 Oct 2001 18:26:58 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> The pdc_add_valid function really annoys me.

So you want a sane wrapper around it.

> For the moment, I've put it in <asm/io.h>, since it is for I/O addresses.
> 
> +int valid_io_addr(unsigned long addr)
> +{
> +       return (pdc_add_valid(addr) == PDC_OK);
> +}

I prefer asm/io.h not depend on pdc.h.
Why not just add whatever wrapper to pdc.h?

> But maybe we should replace pdc_add_valid with valid_io_addr?
> Or a different function?  Suggestions appreciated.

sorry - no better ideas.

grant
