Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id B96974851
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Jun 2001 15:07:44 -0600 (MDT)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA20929
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Jun 2001 14:59:57 -0600
Date: Tue, 5 Jun 2001 23:04:50 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: jheumann@fonts.de
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 0.9ser can't install on D210
Message-ID: <20010605230450.A2455@solo.franken.de>
References: <3B1CB312.1C9DBAB9@fonts.de> <20010605145731.A73568@chico.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010605145731.A73568@chico.franken.de>; from tsbogend@chico.franken.de on Tue, Jun 05, 2001 at 02:57:31PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 05, 2001 at 02:57:31PM +0200, Thomas Bogendoerfer wrote:
> On Tue, Jun 05, 2001 at 12:23:14PM +0200, jheumann@fonts.de wrote:
> > Booting...
> > Boot IO Dependent Code (IODC) revision 1
> > 
> > IPL error: bad IPL checksum.
> > 
> > Error Reading IPL
> 
> did you use cdrecord -isosize to burn the CD ? I have the same problem and 
> that's the only option, which I probably haven't used, when burning the 
> 0.5 ISO. I'll try to burn a cd without using -isosize, when I get home
> this evening.

ok, without -isosize the CDs are working perfect. I've diffed the broken
CDs against the images and there are differences in the first sector.
I'm using cdrecord 1.8.1 just for the record.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
