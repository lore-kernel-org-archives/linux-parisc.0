Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA32250
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 06:31:15 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 11 Jun 1999 12:30:39 -0000
Subject: Re: [parisc-linux] a question about HPUX's linker
To: adevries@thepuffingroup.com (Alex deVries)
Date: Fri, 11 Jun 1999 13:30:22 +0100 (BST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <3760B67A.8D9F3B1F@thepuffingroup.com> from "Alex deVries" at Jun 11, 99 03:10:50 am
Content-Type: text
Message-Id: <E10sQRz-00035v-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> To help us get ahead, I'm trying to get the kernel to build properly
> with HPUX, using HPUX's linker, and gcc.

Ditto. You sorted head.S out ?

> Why does the final kernel link use --start-group ... --end-group?

To do looping resolution of symbols

> What's the equivalent syntax for HPUX's ld?

ld +n

(sort of, but sufficiently sort of)
