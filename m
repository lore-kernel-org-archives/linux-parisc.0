Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA25269
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Mar 2000 21:53:15 -0700
Received: from cln.etc.bc.ca (utpfqt@24.65.187.169.bc.wave.home.com [24.65.187.169])
	by learn.etc.bc.ca (8.9.3/8.9.3) with ESMTP id TAA13710
	for <parisc-linux@thepuffingroup.com>; Wed, 1 Mar 2000 19:53:09 -0800 (PST)
Sender: sshack@learn.etc.bc.ca
Message-ID: <38BDE5DD.CCF2CD87@cln.etc.bc.ca>
Date: Wed, 01 Mar 2000 19:54:05 -0800
From: Steve Shack <sshack@cln.etc.bc.ca>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Performance
References: <200003011418.JAA20165@lucifier.dial-up.user.akula.net>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Michael Shalayeff wrote:

> Making, drinking tea and reading an opus magnum from T. Martin:
> >  Hello,
> >   I know this is off topic for the kernel but I'd like to say a little.
> >
> >  I have a 715/50 and it's been churning along with HP-UX 9.0 (not Y2K so
> > HP says) It's been running setiathome as is a P166 Intel and I'm actually
> > impressed by the math power of that 50mhz chip it outpermes the P166 about
> > 3% .
> >  Just thought a few would like to know.
> >
> >  One other thing I got a 715/75 and it's framebuffer is not 1024x768 as is
> > the 715/50 any suggestions as to what it might be.
> 1280x1024 (;
> or maybe just some other vsync freq?
> cu

Some of the puffins helped me out on this when I first got my 712. If you press tab
while booting up it will cycle through the videomodes.
It might not work on a 715 i'm not sure. But if it does cycle through untill you
find a usable videomode. (many were there but very fuzzy, in the end 1024x768 was
the ONLY one that worked even half way decent.)
