Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sgate.charlysworld.de (pD95055BE.dip.t-dialin.net [217.80.85.190])
	by dsl2.external.hp.com (Postfix) with ESMTP id A886F4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Feb 2001 16:18:17 -0700 (MST)
Received: from localhost (xam@localhost)
	by sgate.charlysworld.de (8.11.0/8.11.0) with ESMTP id f1CNIB014063
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Feb 2001 00:18:13 +0100
Date: Tue, 13 Feb 2001 00:18:11 +0100 (CET)
From: "M. Grabert" <xam@deathsdoor.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ASP Parallel port driver broken on HP9000/730
In-Reply-To: <20010212155919.B7969@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0102130007220.13741-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 12 Feb 2001, Matthew Wilcox wrote:

> > On Thu, 8 Feb 2001, Grant Grundler wrote:
> > 
> > > echo 0xe840c000=i | adb   says:
> > > 		BV              r0(r2)
> > > 
> > > GR02 is the most recent subroutine call return addr.
> > > (Typically the caller).
> > > 
> > > So look up c026e458 and c0246328 in your System.map.
> > > You can at least figure out about where it's crashing.

just a copy'n'paste from my System.map:

c026e44c T _gsc_readb
c026e460 T _gsc_readw
c026e474 T _gsc_readl

therefore c026e458 is in _gsc_readb, and:

c02462c4 t parport_PS2_supported
c02463c8 T parport_gsc_probe_port
c024677c T parport_gsc_write_data

 so c0246328 is in parport_PS2_supported!


greetings max
