Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id D82F4482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 16:28:27 -0600 (MDT)
Date: Wed, 17 Oct 2001 00:26:22 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Matthew Wilcox <willy@debian.org>
Cc: Tom <palinux@alaskatech.org>,
	PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] EISA support
In-Reply-To: <20011016210054.H15532@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.33.0110170023580.13382-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Matthew,

> Hmm.. could you try with the driver built in?  People have been reporting
> that modules aren't working any more.

Looks a bit better now:

ibmtr.c: v1.3.57   8/ 7/94 Peter De Schrijver and Mark Swanson
v2.1.125 10/20/98 Paul Norton    <pnorton@ieee.org>
v2.2.0   12/30/98 Joel Sloan     <jjs@c-me.com>
v2.2.1   02/08/00 Mike Sullivan  <sullivam@us.ibm.com>
v2.2.2   07/27/00 Burt Silverman <burts@us.ibm.com>
v2.4.0   03/01/01 Mike Sullivan <sullivan@us.ibm.com>
tr0: ISA P&P Auto 16/4 Adapter found
tr0: using irq 9, PIOaddr a20, 16K shared RAM.
tr0: Hardware address : 00:04:AC:35:AE:E7
tr0: Shared RAM paging enabled. Page size: 16K Shared Ram size 63K
tr0: Maximum Receive Internet Protocol MTU 16Mbps: 16344, 4Mbps: 6104
tr1: Could not grab PIO range. Halting driver.
tr2: Could not grab PIO range. Halting driver.
tr3: Could not grab PIO range. Halting driver.
tr4: Could not grab PIO range. Halting driver.
tr5: Could not grab PIO range. Halting driver.
tr6: Could not grab PIO range. Halting driver.
tr7: Could not grab PIO range. Halting driver.

It recognizes the adapter correctly, but then the driver seems to find 
some "shadow devices" which it tries to configure and, of course, fails to 
do so...

However, the device still doesn't work:

hp720:~# ifconfig tr0 1.1.1.1
SIOCSIFFLAGS: Resource temporarily unavailable

This *might* have to do with interrupts, though...

Cheers,
Jochen
