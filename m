Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A9CA482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 20:00:12 -0600 (MDT)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GFB6W700.MXB for
          <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 18:00:07 -0800
Date: Thu, 21 Jun 2001 18:00:05 -0800 (AKDT)
From: Tom <tom@Alaskatech.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: PA-RISC Linux list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Something broke dselect/apt...
In-Reply-To: <20010621162624.M11438@linuxcare.com>
Message-ID: <Pine.LNX.4.33.0106211757270.26069-100000@devnull.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Thu, Jun 21, 2001 at 06:37:44AM -0800, Tom wrote:
> > I ran apt-get update/upgrade on Monday - all working. Just ran it again
> > this morning, had ~9 packages updated. All updated fine - no errors on the
> > update - but then apt-* fails to work with "error while loading shared
> > libraries - /usr/lib/libapt-pkg-libc6.2-3.so.3.2: undefined symbol:
> > _cp_push_exception". Trying to run dselect gives "error while loading
> > shared libraries: dselect: undefined symbol: __rethrow".
> >
> > Has anyone noticed this yet and/or noticed something I may have goofed up?
> > I believe there was a palo update in there, plus one of the libc6-*
> > packages, but other than that I've no idea...
>
> On Thu, 21 Jun 2001, Richard Hirst wrote:
> This is because you have picked up a new libstdc++3, but not a new apt.
> We tried to update both together, but in the event, apt got delayed by
> a day.  You need to grab the new apt.deb and install with dpkg -i.
> It should appear in <ftp://ftp.debian.org:/debian/pool/main/a/apt/>
> in a few hours.

Installing the apt packages from there allowed apt-get update/upgrade to
run, which fixed dselect. However, I'm getting the same libapt/libc6 error
when installing packages - they download, then I get that error when it's
apparently trying to preprocess them. After the error they install fine
and everything works...

Am going to let it sit for a few days, see what else shakes loose as far
as updates are concerned, then worry about it if it's still giving the
errors...

Thanks for the response!
