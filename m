Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9AFDD482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Mar 2001 18:40:36 -0700 (MST)
Message-Id: <200103310134.SAA21074@puffin.external.hp.com>
To: "jean-yves.guillevic" <jean-yves.guillevic@wanadoo.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Hello PARISC-LINUX A short boot 
In-Reply-To: Your message of "Fri, 30 Mar 2001 23:40:08 +0200."
             <009401c0b961$fec40780$140101a8@home233>
Date: Fri, 30 Mar 2001 18:34:50 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

jean-yves.guillevic wrote:
> I was given an old HP715 in good state but not working.

Which model?
(From the boot log I gather it's a 715S/33)
The rev of firmware you need will depend on which 715 model you have.

...
> where can i find the patchs between PDC ROM rev 1.0 and PDC ROM rev 1.6

I updated the FAQ last year which answers this question:
http://lists.parisc-linux.org/pipermail/parisc-linux/2000-November/009988.html

Note: The FAQ now lives at http://www.parisc-linux.org/faq/index.html

> if i make a rev 1.6 patch do i have to make a rev 1.5 rev 1.4 etc...?

No.

> who can tell me whitch solution is the best and why.

Personally, I would update the firmware on the machine in any case. 
(why use a version with know bugs when a less buggy vers is avail free?)
But read the FAQ and think about it carefully first.

grant

.ps Could you not include html version in your mail?

> <DIV><FONT face=3DArial size=3D2>if i make a rev 1.6 patch do i have to =
> make a rev=20
> 1.5 rev 1.4 etc...?</FONT></DIV>

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
