Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA02938
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 04:36:48 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 21 Jun 1999 10:36:08 -0000
Subject: Re: [parisc-linux] HPUX binary compatibility
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Mon, 21 Jun 1999 11:35:32 +0100 (BST)
Cc: alan@lxorguk.ukuu.org.uk, Matthew.Wilcox@genedata.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19990621104148.M30362@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 21, 99 10:41:48 am
Content-Type: text
Message-Id: <E10w1QM-0005e1-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> framebuffer fault) to be SIGSTKFLT for which HPUX has no equivalent.  My
> question was, will having more than 32 signals annoy any Linux people?

No. It just makes the signal delivery code a microscopic bit trickier


Alan
