Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5820C482A
	for <parisc-linux@parisc-linux.org>; Mon, 23 Jul 2001 22:49:00 -0600 (MDT)
Message-Id: <200107240447.WAA24360@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.4.7 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Mon, 23 Jul 2001 17:20:16 BST." <20010723172016.D9408@parcelfarce.linux.theplanet.co.uk>
Date: Mon, 23 Jul 2001 22:47:51 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> how do people feel about merging 2.4.7 into our HEAD?  it seems to have
> some interesting bugs fixed, and it might make merging with Alan easier.

For me, merging with Alan is more important than the bug fixes.
I think we should track the releases as closely as we can until
Alan/Linus can build a usable parisc kernel from their tree.

BTW, I looked in 2.4.7 already and it doesn't have the changes
whic Ivan K and I worked out. I guess .7 got released before Ivan
had the other arches done (besides alhpa/parisc).

On a related note, I'd like to get ESIEE's 0.92 ISOs available
on parisc-linux.org website. mkhppa1.esiee.fr website been blocked by
their local admin or something. I was going to add a link on
parisc-linux but won't until I can reach it.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
