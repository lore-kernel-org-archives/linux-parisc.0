Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1C3F482E
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Jun 2001 06:58:10 -0600 (MDT)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA18612
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Jun 2001 06:50:41 -0600
Received: by rachael.franken.de
	for parisc-linux@thepuffingroup.com
	id m157GPE-00291KC; Tue, 5 Jun 2001 14:57:56 +0200 (MET DST)
Received: by chico.franken.de
	for parisc-linux@thepuffingroup.com
	id m157GOp-0033JBC; Tue, 5 Jun 2001 14:57:31 +0200 (MET DST)
Date: Tue, 5 Jun 2001 14:57:31 +0200
From: Thomas Bogendoerfer <tsbogend@chico.franken.de>
To: jheumann@fonts.de
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 0.9ser can't install on D210
Message-ID: <20010605145731.A73568@chico.franken.de>
Reply-To: tsbogend@alpha.franken.de
References: <3B1CB312.1C9DBAB9@fonts.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B1CB312.1C9DBAB9@fonts.de>; from jheumann@fonts.de on Tue, Jun 05, 2001 at 12:23:14PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 05, 2001 at 12:23:14PM +0200, jheumann@fonts.de wrote:
> Booting...
> Boot IO Dependent Code (IODC) revision 1
> 
> IPL error: bad IPL checksum.
> 
> Error Reading IPL

did you use cdrecord -isosize to burn the CD ? I have the same problem and 
that's the only option, which I probably haven't used, when burning the 
0.5 ISO. I'll try to burn a cd without using -isosize, when I get home
this evening.

Thomas.
