Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 761AF4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 17:25:42 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: "M. Grabert" <xam@deathsdoor.com>
Subject: Re: [parisc-linux] Generic Parisc Linux Kernel Questions & 9000/730 success report
Date: Wed, 7 Feb 2001 01:26:10 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <Pine.LNX.4.21.0102061808500.2465-100000@sgate.charlysworld.de> <3A8076D8.CF5E8CCD@esiee.fr>
In-Reply-To: <3A8076D8.CF5E8CCD@esiee.fr>
MIME-Version: 1.0
Message-Id: <01020701261000.01055@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

Hello Mr Grabert,

On Tuesday 06 February 2001 23:12, Thomas Marteau wrote:
> Hi Max,
>
> > fbcon-sti won't compile (at least when I don't compile STI-console)
>
> The matter of frame buffer is quite complex. When we look at the code,
> the fb-sti init is the first then came up the sti-console init. This
> explained the snow you have on the screeen when you compile a kernel
> with fbcon-sti and sti-console. This info can be out of date! If someone
> has a better news , speak :)

I just checked in new cleaned-up and updated code for STI console into CVS a 
few days back, which at least should compile cleanly. 
fbcon-sti belonged to the old code, which was originally written by Philipp 
Rumpf and got very outdated during all the upgrades we did from kernel 2.3.X 
to currently plain 2.4.0. Please just stand by and you will get a working STI 
console for
 - word mode ROMs,
 - byte mode ROMs,
 - monocrome STI framebuffer,
 - support for linux framebuffer fonts in STI text console,
 - (if possible: support for HP X-Servers under parisc-linux)
and much more in the future.
Please keep also in mind, that all the necessary coding is just done in my 
spare time and so it will of course take some time to get it finished. If you 
want to help speeding things up please just send patches to the list.

Greetings,

	Helge Deller
