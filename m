Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA10132
	for <parisc-linux@puffin.external.hp.com>; Sat, 19 Aug 2000 23:41:48 -0600
Message-Id: <200008200544.WAA09249@milano.cup.hp.com>
To: Steffen =?ISO-8859-1?Q?L=F6rch?= <sloerch@gmx.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Networking 
In-reply-to: Your message of "Fri, 18 Aug 2000 10:15:08 PDT."
             <10217.966586508@www5.gmx.net>
Date: Sat, 19 Aug 2000 22:44:22 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Steffen =?ISO-8859-1?Q?L=F6rch?= wrote:
> Hello all !!!
> How can I connect my PA-RISC to the network with the CD-Image Version of
> the PA-RISC Linux.

Yes and no.

Yes in that nfsroot works.
One can also ping the parisc-linux host.
So the kernel/lan driver seems to work fine.

No because networking userspace needs more work or something.
Read the README on the CD for known bugs.
Did I hear you volunteer to fix those?
:^)

grant

> 
> Thanks for replies,
> S.L.
> 
> -- 
> Sent through GMX FreeMail - http://www.gmx.net
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
