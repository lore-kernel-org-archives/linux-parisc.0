Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA7A8482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Jun 2001 04:35:58 -0600 (MDT)
Message-Id: <200106181035.EAA18551@puffin.external.hp.com>
To: "Chris Christie" <info@wias.net.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Booting up C200 Visualize same output as C110 
In-Reply-To: Your message of "Mon, 18 Jun 2001 05:18:53 +1000."
             <004e01c0f762$58ac0ca0$c901a8c0@wias.net.au>
Date: Mon, 18 Jun 2001 04:35:17 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Chris Christie" wrote:
...
> C200 Visualize appears to halt with the following output..........
> 
> NET4: Unix Domain sockets 1.0/SMP for Linux Net4.0.
> VFS Mounted root (ext2 file system).
> Warning: unable to open initial console.
> loop: enabling 8 loop devices
> 
> The device appears to halt at this point.

Press the TOC button.
Interrupt the PDC autoboot.
"ser pim" should print the system state when the TOC button was pushed.

> 
> I am using IPL to configure the Console setting to remove the console =
> setting all together as I get stack dumps if I keep the statement:
> 
> Console=3DttyXXX
> 
> I remove this statement and the boot process happens without dumping =
> however the system is hanging for some reason.

Sorry - I don't know much about how console actually works.
I've managed to avoid that mess pretty well... :^)

> Maybe Grant could shed some light on this except Grant requires:
> 
> "Need console output and PIM "Tombstone".
> PIM "tombstone" can be aquired by interrupting autoboot
> at the PDC prompt and typing "ser pim".

Right. That's  true for any problem where the system just locks up.
Capturing serial console output should be pretty trivial.


grant

ps. please don't post the html copy of your mail. I'm getting
   both ascii and html versions of your mail.

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
