Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA06260
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Jun 1999 12:37:49 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 12 Jun 1999 18:37:43 -0000
Subject: Re: [parisc-linux] booting problems
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Sat, 12 Jun 1999 19:36:44 +0100 (BST)
Cc: adevries@thepuffingroup.com, law@cygnus.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <199906121657.MAA02162@hiauly1.hia.nrc.ca> from "John David Anglin" at Jun 12, 99 12:57:40 pm
Content-Type: text
Message-Id: <E10sse6-0004NC-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> relocations.  A SOM linker also needs to be stream based.  Thus,
> it appears difficult (impossible?) to build a SOM linker using the
> bfd architecture.  On the other hand, the elf32-hppa tools have serious
> deficiencies and are about to be completely rewritten.  Might it not be
> better to develop a SOM linker rather than rewrite the elf stuff?

Writing a linker, especialyl for something complex like SOM is not trivial
in the slightest.

Alan
