Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA18591
	for <parisc-linux@puffin.external.hp.com>; Wed, 30 Jun 1999 04:44:14 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 30 Jun 1999 10:44:27 -0000
Subject: Re: [parisc-linux] 715/33]
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Wed, 30 Jun 1999 11:41:05 +0100 (BST)
Cc: adevries@thepuffingroup.com, parisc-linux@thepuffingroup.com
In-Reply-To: <19990630094912.T30362@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 30, 99 09:49:12 am
Content-Type: text
Message-Id: <E10zHne-0007RN-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> printk("-3\n");
> printk("%p\n", *cmdline_p);
> printk("%s\n", *cmdline_p);
>         strcpy(*cmdline_p,saved_command_line);  // copy the command-line
> printk("-2\n");
> 
> I get the following printout:
> 
> setup_arch(000a0860, 000767e0, 000767e4)
> -3
> f000013c
>  zC

f000013c is in I/O space. Is the command line really meant to point into
I/O space..
