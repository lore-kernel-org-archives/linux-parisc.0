Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id EBCA8482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Jul 2001 12:33:48 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: =?iso-8859-1?q?R=FCdiger=20Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
Subject: Re: [parisc-linux] Kernel crashs on 715/100
Date: Fri, 20 Jul 2001 20:33:12 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <200107201759.LAA27765@puffin.external.hp.com>
In-Reply-To: <200107201759.LAA27765@puffin.external.hp.com>
MIME-Version: 1.0
Message-Id: <20010720183348.EBCA8482C@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Friday 20 July 2001 19:59, you wrote:
> =?iso-8859-1?Q?R=FCdiger?= Scholz wrote:
> > a.c from "build-tools" says " 0x1010d5ac outb+2c" and "0x1010d5b0 outb+30
> ....
> Seems removing the offending driver from the .config should solve
> the problem for now.  The right fix is to modify the driver so it
> doesn't poke IO port space unless it's clear the device lives under
> a suppported bus.

I think the default defconfig should work on your machine and has all necessary and
currently working drivers enabled. Remove your .config, do a "make oldconfig" and 
build a new kernel from this configuration.

Greetings,
Helge
