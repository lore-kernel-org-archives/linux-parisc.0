Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D6AC482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  9 Aug 2001 09:24:21 -0600 (MDT)
Message-Id: <200108091522.JAA13437@puffin.external.hp.com>
To: djweis@sjdjweis.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] more serial console problems on D310 
In-Reply-To: Message from <djweis@sjdjweis.com>
   of "Sun, 05 Aug 2001 23:06:37 CDT." <Pine.LNX.4.21.0108052251390.1710-100000@oliver.internal.sjdjweis.com>
Date: Thu, 09 Aug 2001 09:22:18 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

djweis@sjdjweis.com wrote:
> I grabbed the 20010704 kernel source and net booted my d310 with it
> combined with the ramdisk from the 0.9.2 install image. I start with the
> serial console on the serial connector labeled "serial console". Output
> only comes through there until the kernel starts, then I have to switch
> over to the other serial port on the machine to see the rest of the boot
> messages.

I look at the HW database and it seems the D310 has two LASI (core_adapter)
chips (and WAX, no PCI). I suspect the detection of serial ports misnumbers
them (ie parisc-linux finds them in the wrong order) or we only properly
handle one of the two LASI's.

>  They come quickly until the root filesystem is mounted. It looks
> like I lose interrupts after that because everything is written in blocks
> of 16 characters with long (15 second?) pauses in between blocks.

Probably not getting interrupts in the first place. The initial
console handling is done with PDC calls - ie polled IO.

> After
> getting this message:
> VFS: Mounted root (ext2 filesystem).
> serial console detected.  Disabling virtual terminals.
> 
> the cursor just tabs along the screen by itself without printing
> anything. 

> Any ideas? Why is the first serial port not being detected/used?

Can you post full console output? (or otherwise make it available)
Interested folks can then start guessing what might be the problem.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
