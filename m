Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA30979
	for <parisc-linux@puffin.external.hp.com>; Fri, 12 Nov 1999 12:35:01 -0700
Message-Id: <199911121937.LAA22333@milano.cup.hp.com>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ASP 
In-reply-to: Your message of "Thu, 11 Nov 1999 02:23:31 PST."
             <19991111022331.W25252@mencheca.ch.genedata.com>
Date: Fri, 12 Nov 1999 11:37:49 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
...
> The following devices _do_ go through ASP:
> 
> EISA, 8042, SCSI, FDDI, RS232, Centronics, Ethernet, Graphics (1 + 2), Audio.
> 
> which seems pretty comprehensive.  I'm wondering about slimming down our
> interrupt architecture for older machines; it's a trifle over-engineered
> for a machine which can't be expanded.

We need to be able to boot a CD on *any* HP box which parisc-linux
wants to support in order to install parisc-linux. If the kernel
modules will get rebuilt as part of a second pass to optimize code path
for older machines, go for it.

cheers,
grant

Grant Grundler
Unix Developement Lab
+1.408.447.7253
