Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F8294A19
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Feb 2001 10:42:36 -0700 (MST)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id A5702BA4
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Feb 2001 09:42:34 -0800 (PST)
Message-Id: <200102091743.JAA08121@milano.cup.hp.com>
To: "M. Grabert" <xam@deathsdoor.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ASP Parallel port driver broken on HP9000/730 
In-reply-to: Your message of "Fri, 09 Feb 2001 14:45:19 PST."
             <Pine.LNX.4.21.0102091426380.9525-100000@sgate.charlysworld.de>
Date: Fri, 09 Feb 2001 09:43:33 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"M. Grabert" wrote:
> My question was, whether there is a kernel parameter (i can pass to palo),
> which redirects ALL kernel messages from the beginning to the serial port
> (before they are regognized by the linux kernel). 

No. (I'm being more blunt than Helge).

Read the directions I posted again and try them.

Setting the CONSOLE path (as suggested by Helge) will result in
the same thing. But later you must set the path back to a graphics
head once you (and parisc-linux) are ready for STI/graphical console.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
