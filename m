Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id B59CF482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Jun 2001 04:26:02 -0600 (MDT)
Message-Id: <200106181025.EAA18515@puffin.external.hp.com>
To: "Bryan W. Headley" <bheadley@interaccess.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Booting up C110 
In-Reply-To: Your message of "Sun, 17 Jun 2001 11:44:34 CDT."
             <3B2CDE72.4010006@interaccess.com>
Date: Mon, 18 Jun 2001 04:25:53 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Bryan W. Headley" wrote:
>     Wasn't getting too far using the STI console, so I switched to the 
> serial console at the boot monitor. Sadly, no text appears on my 
> laptop-based "terminal", connected with null-modem cable. Also, the 
> unit's doesn't appear to respond to the built-in keyboard, either.

You should be able to get output from the serial port 1 when the
keyboard/mouse are disconnected. At least all the workstations I know of
work that way...You didn't need to change the console/keyboard path
at te PDC prompt.

> So, 1) how do I reset the boot PROM to use the graphics card/monitor again?

You don't until you get serial working and point the console path back
at the graphics(2) (or whatever it's called).

> 2) Any help on getting 0.9 or any other kernel booting would be a great 
> help...

32-bit/serial kernel should just boot. Bug in ccio might cause problems
installing from CD.

> (It has booted, to the point of displaying kernel sign-on messages, then 
> complaining about not being able to allocate a console, so I know things 
> "sort-of" work)

I'll assume that's with sticon.  I expect serial console to work better.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
