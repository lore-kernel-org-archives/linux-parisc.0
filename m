Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-1.gci.net (mta-1.gci.net [208.138.130.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id A14DE482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Jun 2001 08:04:43 -0600 (MDT)
Received: from mmp-2.gci.net ([208.138.130.81]) by mta-1.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GF4PRT02.P3V for
          <parisc-linux@lists.parisc-linux.org>; Mon, 18 Jun 2001 06:04:41 -0800
Date: Mon, 18 Jun 2001 06:04:41 -0800 (AKDT)
From: Tom <tom@Alaskatech.org>
To: Pete <plaven@ozemail.com.au>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Booting up C110
In-Reply-To: <3B2E5CE5.88.5339D5@localhost>
Message-ID: <Pine.LNX.4.33.0106180552230.19362-100000@devnull.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 18 Jun 2001, Pete wrote:
> > So, 1) how do I reset the boot PROM to use the graphics card/monitor
> > again?
>
> I'm in the same boat... before I got the sti stuff, I tried the serial port
> and now don't get any output (mostly due to dud nullmodem
> connections on the HP box.. it's far too recessed to use with
> "normal" serial connctions).... so if you get an answer to this,
> please let me know too.. might work on my 715.

My 715/100 was set using "path con graphics.1" at the boot menu. Once I
found a null modem cable that fit the port on the 715 I used HyperTerminal
on a Win2K box (set to 9600/8/n/1) and it booted right up...
