Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA27863
	for <parisc-linux@puffin.external.hp.com>; Fri, 5 Jan 2001 10:38:43 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 5 Jan 2001 17:42:05 -0000
Subject: Re: [parisc-linux] spinlocks
To: matthew@wil.cx (Matthew Wilcox)
Date: Fri, 5 Jan 2001 17:43:21 +0000 (GMT)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <20010105173243.A14195@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Jan 05, 2001 05:32:43 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14Eatf-00088O-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> A better design is to repeatedly load the value until it becomes non-zero,
> and only then try to ldcw it.  This way, all processors have a read-only
> copy of the cache line and checking its value has no effect on the bus.
> In C, this could be implemented as:

Very much so on most architectures - you should read Unix Systems for 
Modern Architectures. If I'd know you hadn't I'd have forcefed it to you when
you visited 

> 
