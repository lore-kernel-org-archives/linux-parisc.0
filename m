Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31DCD482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Jun 2001 13:48:28 -0600 (MDT)
Message-Id: <200106041940.NAA13519@puffin.external.hp.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems with 0.9 ISO Images from mkhppa1.esiee.fr 
In-Reply-To: Your message of "Mon, 04 Jun 2001 17:08:41 +0200."
             <20010604170841.A8900@solo.franken.de>
Date: Mon, 04 Jun 2001 13:40:50 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Thomas Bogendoerfer wrote:
...
> Another question: I've tried the 64bit kernel on the C200 and got a
> system not supported error. Is this a known problem or is the C200
> really too old ?

That's exactly the model which Ryan Bradetich was trying to get working.
He's got the 64-bit PDC wrapper calls working but then ran into problems
with SCSI...I don't have a C200 and I didn't have time to followup either.

So I don't think it quite works yet - but it's not much more work either.
I suggest installing 32-bit w/serial console (should work fine) and
then work on 64-bit support.

> J282 (which AFAIK is older) booted the 64bit kernel 
> just fine, but had some problems with the interrupt of the serial console
> during install.

J282 might have serial on Dino and Clement (ESIEE) just hacked some support
for that...but I know it's not on the 0.9 ISOs. Booting from a lifimage
(newer kernel plus Dino patch) might work better.

BTW, Rbrad suspects current ccio driver is buggy and some older version
works better.  One which doesn't try to coalesce dma_map_sg() block lists.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
