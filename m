Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA06431
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Sep 1999 15:26:59 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: parisc-linux@thepuffingroup.com, Ryan Bradetich <rbradetich@uswest.net>,
        Alex deVries <adevries@thepuffingroup.com>
Subject: Re: [parisc-linux] cleaning up IPL and ramdisks
Date: Sun, 26 Sep 1999 22:48:17 +0200
Content-Type: text/plain
References: <37EE6973.5D758C47@uswest.net>
MIME-Version: 1.0
Message-Id: <99092622521900.00371@P100>
List-ID: <linux-parisc.vger.kernel.org>

Hi Alex,
Hi Ryan

Am Sun, 26 Sep 1999 schrieb Ryan Bradetich:
> Alex deVries wrote:
> 
> > We've talked for awhile about rewriting all the bootup stuff, it's
> > served us well until now, but it really needs a rewrite to make it a lot
> > cleaner.  Is anyone interested in taking this on?  Helge?

I´m sorry, but actually I´m too busy for the next two months (til´ begin of
december). Maybe someone other would like to take it over ?

> 
> Alex,
> 
> I am interested in helping since I've been struggling to get the kernel to
> boot on the PA-RISC 2.0 architecture.
> 
> -Ryan

Please go on...

> 
> >
> > The new version should use the same PDC calls as the rest of the kernel,
> > use the entire LIF structure declared in the HPUX header files.

Yes...

> > Philipp, did you have any other thoughts?
> >
> > - Alex
> >
> > --
> > Alex deVries
> > Vice President of Engineering
> > The Puffin Group
