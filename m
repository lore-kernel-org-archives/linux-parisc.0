Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id BB6DF4A19
	for <parisc-linux@parisc-linux.org>; Fri, 23 Feb 2001 15:14:54 -0700 (MST)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id EBD0D629
	for <parisc-linux@parisc-linux.org>; Fri, 23 Feb 2001 14:14:53 -0800 (PST)
Message-Id: <200102232217.OAA21496@milano.cup.hp.com>
To: Matthew Wilcox <willy@ldl.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Documentation wanted 
In-reply-to: Your message of "Fri, 23 Feb 2001 02:29:28 PST."
             <E14WEXY-0006gB-00@chrysl>
Date: Fri, 23 Feb 2001 14:17:38 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> Looking for something to do?  I ran `make checkhelp' and the following
> undocumented CONFIG options are our fault.  If you'd like to write
> some help and send diffs against Configure.help to the list, that'd
> be appreciated.

This list seems incomplete.
Why didn't CONFIG_GSC_DINO, CONFIG_IOSAPIC, CONFIG_LBA_PCI,
or CONFIG_SBA_IOMMU show up?

I can write something up for those if there is an arch specific place
to put them.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
