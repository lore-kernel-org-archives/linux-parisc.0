Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 352A74844
	for <parisc-linux@parisc-linux.org>; Sun,  7 Oct 2001 21:52:41 -0600 (MDT)
Message-Id: <200110080348.VAA24289@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Thomas Marteau <marteaut@esiee.fr>,
	"parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Second Draft of the help for the kernel options 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Mon, 08 Oct 2001 00:31:47 BST." <20011008003147.A6105@parcelfarce.linux.theplanet.co.uk>
Date: Sun, 07 Oct 2001 21:48:47 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 32-bit PDC
> CONFIG_PDC_NARROW
>   Turning this option on enables support for 32-bit firmware when running
>   a 64-bit kernel.  You should select this option if you have a machine
>   from the C160-J2240 era.

s/machine/workstation/
I'm pretty sure all 64-bit capable servers properly handle
PDC calls in wide mode. PAT PDC supports a few calls in
narrow mode (for boot loader) but the rest must be in wide mode.

Note that IODC generally requires narrow mode.
(Superdome IODC is different - but I don't recall exactly how).

BTW, I prefer Matthew's rewrite over the Thomas' proposal.
No offense intended thomas - thanks for submitting the original.

grant
