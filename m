Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob02.one.net.au (mail-ob02.one.net.au [61.12.0.162])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C46D482A
	for <parisc-linux@parisc-linux.org>; Mon, 30 Apr 2001 08:27:27 -0600 (MDT)
Received: Received: [from squeak.local (async144-ade-isp-6.nas.one.net.au [61.12.243.145])
	by mail-ob02.one.net.au  with SMTP id f3UESiv09623
	for <parisc-linux@parisc-linux.org>; Tue, 1 May 2001 00:28:44 +1000 (EST)]
From: amodra@one.net.au
Date: Mon, 30 Apr 2001 23:57:55 +0930
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] pt-initfini.c
Message-ID: <20010430235755.E2487@squeak.one.net.au>
References: <20010428234019.D15328@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010428234019.D15328@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Sat, Apr 28, 2001 at 11:40:19PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Apr 28, 2001 at 11:40:19PM +0100, Matthew Wilcox wrote:
> 
> glibc 2.2.3 requires a pt-initfini.c which is arch-specific (for hppa at
> any rate).  dhd & amodra did initfini.c for hppa, and neither of them
> seem to be around right now.  The IA64 pt-initfini.c differs from the
> IA64 initfini.c by only a few lines.  So _for the moment_ in my local
> copy, i've simply copied the initfini.c from the ordinary sysdeps as
> pt-initfini.  Any volunteers to fix this mess properly?

I've checked in a new file to pehc glibc CVS, merge_GLIBC_CVS_20010424
branch.  If anyone wants to try it,

 ** YOU'LL NEED NEW BINUTILS **

from any of the usual CVS repositories, because I got rid of a wart
in initfini.c as well.  Don't say you haven't been warned.

Alan
