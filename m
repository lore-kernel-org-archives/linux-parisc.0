Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA20439
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Oct 1999 08:59:11 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id KAA01659
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Oct 1999 10:59:06 -0400 (EDT)
Message-Id: <199910221500.IAA00520@milano.cup.hp.com>
To: simen-tt@online.no
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] rbooting an 735? 
In-reply-to: Your message of "Fri, 22 Oct 1999 08:01:42 PDT."
             <199910220556.GAA01903@scimitar.dolphinics.no>
Date: Fri, 22 Oct 1999 08:00:01 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Simen Timian Thoresen" wrote:
> Is anybody rbooting an 735?
> I've replaced my exceedingly noisy Micropolis disk, and replaced it 
> with a 2.1G seagate thing which, altho so far working nicely, 
> refuses to boot.

Many of the older HP-UX systems can NOT boot from a "whole disk"
which is greater than 2GB. The IODC on older boxes has problems
when the byte offset into the disk goes "negative" (exceeds what
can be represented by "sign int"). And the "whole disk" layout puts
some of the LIF boot info beyond the reach of IODC.  Setting up the
boot disk with LVM changes the disk layout such that it works.
I know LVM is required to boot from 4GB (or greater sized) disks too.
You might try LVM.

This is another reason parisc-linux boot loader needs to support LVM.

I don't know what the rbootd problem is...

grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
