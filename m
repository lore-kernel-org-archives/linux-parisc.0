Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA01231
	for <parisc-linux@puffin.external.hp.com>; Fri, 29 Oct 1999 19:19:23 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 30 Oct 1999 01:20:31 -0000
Subject: Re: [parisc-linux] udelay accuracy
To: grundler@cup.hp.com (Grant Grundler)
Date: Sat, 30 Oct 1999 02:07:42 +0100 (BST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199910300056.RAA07975@milano.cup.hp.com> from "Grant Grundler" at Oct 29, 99 05:56:40 pm
Content-Type: text
Message-Id: <E11hMzg-0007qN-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> 	udelay(3000) 540000
> 
> The difference between the first invocation and successive might be a problem.
> I don't know what the expected accuracy is.
> If +- 10% is ok, we are there.

Its generally good enough. Certainly on PC type hardware which is sloppy anyway
If its ever an issue just bump the estimate by 10% on all udelays to be sure 8)
