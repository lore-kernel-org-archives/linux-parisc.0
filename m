Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA07425
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Jan 2001 16:53:46 -0700
Message-Id: <200101142359.PAA09486@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] semaphores 
In-reply-to: Your message of "Sun, 14 Jan 2001 02:01:01 PST."
             <20010114020101.J7463@parcelfarce.linux.theplanet.co.uk>
Date: Sun, 14 Jan 2001 15:59:00 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> thanks for trying this, grant.  i'll continue trying to debug this when
> i'm back from oz and have a machine to hand again.  trying to debug this
> by proxy just isn't going to work.

Yeah...but it might not be your bug. I uploaded a new PDC (40.50) on my
A500 and rebuilt using TOB (w/o your semaphore patch) and built from
scratch. System hangs after "swapon" hits a break isns. If interested,
I can send you more details. jsm/rhirst/amodra already have details.

enjoy .au!
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
