Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA20947
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Dec 2000 06:17:08 -0700
Received: from lightning.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 3 Dec 2000 13:19:40 -0000
Subject: Re: [parisc-linux] merge activity
To: grundler@cup.hp.com (Grant Grundler)
Date: Sun, 3 Dec 2000 13:15:49 +0000 (GMT)
Cc: matthew@wil.cx (Matthew Wilcox), parisc-linux@thepuffingroup.com
In-Reply-To: <200012030511.VAA02450@milano.cup.hp.com> from "Grant Grundler" at Dec 02, 2000 09:11:48 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E142Yzf-0002iw-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Why differentiate? Debuggers. I want to make sure all the symbols
> I care about are visible - I'm told under ELF they are. Under SOM
> binary format I know they weren't.

SOM is dead so we can now drop them. I understood why they were there 
though

> > u_long becomes unsigned long
> 
> I've been using "ulong" as well. Is less than desirable as well?
> Feel free to change if it is.

It would be nice too, or where the bitwidth matters to use u32/u64.

> Some of the "ifdef 0" I have in "my" code are there for future stuff.
> An examples is code related to DELAYED_RESOURCE_CNT in sba_iommu.c.
> Fortunately, this wasn't removed.
> Haw should I mark this to make sure people understand it's work-in-progress?

Most of it seemed obviously so already.
