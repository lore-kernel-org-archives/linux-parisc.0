Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA12798
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Jun 1999 13:16:49 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 28 Jun 1999 19:16:55 -0000
Subject: Re: [parisc-linux] Anyone got a few moments?
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Mon, 28 Jun 1999 20:12:08 +0100 (BST)
Cc: alan@lxorguk.ukuu.org.uk, Matthew.Wilcox@genedata.com, law@cygnus.com,
        grundler@cup.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <19990628210005.K30362@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 28, 99 09:00:05 pm
Content-Type: text
Message-Id: <E10ygp7-0005Y3-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Okay.  Do you think we stand a chance of pushing a new call past linux
> -- get_and_zero(*ptr), as this will make most of the calls efficient
> on PA-RISC?  Or would a better idea be to check if the argument to be
> swapped is zero; if it is use the special instructions; if not fall back
> to a spinlock?

For now I'd get it working with xchg() - the zero check isnt worth it. Get
it going the stupid way then worry
