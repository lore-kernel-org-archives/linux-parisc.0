Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oliver.internal.sjdjweis.com (dsl.75.131.networkiowa.com [209.234.75.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5A8B482A
	for <parisc-linux@parisc-linux.org>; Sun,  3 Jun 2001 15:32:09 -0600 (MDT)
Date: Sun, 3 Jun 2001 16:33:40 -0500 (CDT)
From: <djweis@sjdjweis.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Failed boot on D310
In-Reply-To: <20010603192902.L25745@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0106031600540.10748-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 3 Jun 2001, Richard Hirst wrote:
> On Sun, Jun 03, 2001 at 12:41:46PM -0500, djweis@sjdjweis.com wrote:
> > On Sun, 3 Jun 2001, Richard Hirst wrote:
> > > On Sun, Jun 03, 2001 at 08:33:23AM -0500, djweis@sjdjweis.com wrote:
> > > > I've got a D310 with a 100mhz processor and 128 megs of RAM. I tried to
> > > > boot the ISO version 0.9 last night, but it crashed on boot. I can get the
> > > > exact error messages, it looked like a register dump. 
> > > > 
> > > > Is there any reason to assume that this will or won't boot?
> > > Listed as untested on http://parisc-linux.org/release-0.9/systems.html
> > > Are you trying the serial or sti image?  If you can use serial, and
> > > get you terminal emulator to capture the boot messages and crash for us,
> > > that would help.
> > 
> > It's headless, I was using the serial image. Below is my terminal output
> > 
> Ah, I'd assumed it got as far as starting the kernel and then the
> kernel crashed.  In this case I think it has failed reading the
> CD.  Can you read the CD on some other system to check it burned
> ok?  Are you confident that the CD drive is P5 and is working?

I'll give that a try. It's definitely P5, I tried P0 a few times and
noticed that hpux kept booting. According to the legend inside the drive
cover, P5 is correct. 

The cd did mount and read fine on another machine.

> An alternative is to boot the relevant lifimage over the network,
> and then either install from the network or from the CD (if the
> net booted kernel sees the CD).  See the REAME on the CD for details.

I'll give that a try.

dave

-- 
Dave Weis             "I believe there are more instances of the abridgement
djweis@sjdjweis.com   of the freedom of the people by gradual and silent
                      encroachments of those in power than by violent 
                      and sudden usurpations."- James Madison
