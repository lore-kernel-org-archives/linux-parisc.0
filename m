Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id AAA17525
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 00:17:10 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 0F148872
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 23:19:25 -0800 (PST)
Message-Id: <200011220718.XAA21144@milano.cup.hp.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10 
In-reply-to: Your message of "Tue, 21 Nov 2000 22:54:11 PST."
             <3A1B6D93.3B7D2474@uswest.net>
Date: Tue, 21 Nov 2000 23:18:16 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:
> Do you really want to merget the ccio-rm-dma.c file into Linus's tree?
> It is just a reference file used to construct the real ccio-dma.c file ... I
> don't believe it is referenced anywhere.

Hi Ryan,
Yes I do. It is supposed to work for ccio+PCX-W platforms (eg C360).
Keeping it arround will document the pro/con's of that approach and
give folks who have time (and the right machine) something to experiment
with instead of writing it from scratch.  If someone finds an application
it's good for (short transactions with low latency requirements perhaps),
it's worth having around.

It's not referenced because I didn't add a CONFIG_CCIO_RM_IOMMU flag
or ccio_rm_init() call to drivers/gsc/gsc.c:gsc_init().  You are welcome
add this CONFIG flag by hacking arch/parisc/config.in and defconfig.
If you do, please add rules which only allow one or the other
CONFIG_CCIO* option to be enabled.

thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
