Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA12356
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Jun 1999 12:44:31 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 28 Jun 1999 18:44:40 -0000
Subject: Re: [parisc-linux] Anyone got a few moments?
To: law@cygnus.com
Date: Mon, 28 Jun 1999 19:39:42 +0100 (BST)
Cc: Matthew.Wilcox@genedata.com, grundler@cup.hp.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <17559.930592076@upchuck.cygnus.com> from "Jeffrey A Law" at Jun 28, 99 11:47:56 am
Content-Type: text
Message-Id: <E10ygJl-0005VL-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Yes.  Major pain since the only useful atomic operations are load & clear
> word/double as you noted.
> 
> Why does linux want an "exchange"-like API for atomic operations?  That
> just seems totally weird and stupid.

Its very very efficient if you have an exchange operation or you have
ll/sc. Most platforms Linux runs on have these.

Alan
