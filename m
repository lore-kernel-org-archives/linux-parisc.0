Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id DAA08425
	for <parisc-linux@puffin.external.hp.com>; Tue, 22 Jun 1999 03:50:30 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 22 Jun 1999 09:49:48 -0000
Subject: Re: [parisc-linux] HPUX binary compatibility
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Tue, 22 Jun 1999 10:49:10 +0100 (BST)
Cc: larry_dwyer@hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <19990622114518.U30362@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 22, 99 11:45:18 am
Content-Type: text
Message-Id: <E10wNB1-0006vf-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> I'm not entirely sure what to do about signals.  Linux has only one signal
> which HP/UX does not -- SIGSTKFLT.  As I said, I reused _SIGGFAULT as
> we don't have a use for it in Linux (yet?).  What do you think is the

I don't think we use SIGSTKFLT either do we ...
