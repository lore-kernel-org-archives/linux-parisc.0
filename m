Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA02946
	for <parisc-linux@puffin.external.hp.com>; Tue, 7 Mar 2000 18:30:22 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 3D7A582A
	for <parisc-linux@thepuffingroup.com>; Tue,  7 Mar 2000 16:31:31 -0800 (PST)
Message-Id: <200003080033.QAA06619@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@inwestnet.de>
Cc: huck@cup.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] lasi scsi driver 
In-reply-to: Your message of "Wed, 08 Mar 2000 00:45:43 PST."
             <20000308004543.A5281@abacus.local>
Date: Tue, 07 Mar 2000 16:33:00 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:

> Okay, so there are several things I'd like to resolve:
> 
> On Runway-based systems, we don't need uncached memory.
> On PA7[13]00LC, uncached memory works.
> On old 715s, we don't have PCI.

I was mostly worried about systems with PCI.
I'm not worried anymore.


> So, it looks to me like there's no case left we cannot handle except for
> undocumented Runway interfaces we just hope don't get in our way (U2 / Uturn,
> for now) (and even for those it's probably just one bit we'll have to set).

I'm pretty sure systems with Runway will not be a problem.
(Except T600) There are other Runway-to-xxx bus converters but
I believe those will be transparent WRT I/O coherency problems.

> There won't be any flush calls left to add in 2.4.  Unless you want to
> maintain a patch against Linus for every single PCI driver in the tree
> there's really no way we can use those with systems that neither have
> uncached memory nor coherent DMA (and still, we don't know of even one
> such system).

I'm pretty sure Jerry wasn't referring to PCI drivers.
Systems with PCI are either I/O Coherent or have PA-7[13]00LC.

It seems only drivers running on systems with PA-7000 processors (which
AFAIK doesn't support U-bit) would need cache flushing. While those
drivers aren't for PCI devices, they might share some of the "core"
driver logic (NCR 53c700 SCSI?). So people who care about those boxes
(eg model 710) *will* have to maintain patches against a few drivers
or fork off their own version of the driver. The good thing is the
number of different models, the age of those models, and thus number
of drivers should all be pretty small.

grant

> 
> 	Philipp Rumpf
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Unix Development Lab
+1.408.447.7253
