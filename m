Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oliver.internal.sjdjweis.com (dsl.75.131.networkiowa.com [209.234.75.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3CA90482A
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 09:30:35 -0600 (MDT)
Date: Tue, 5 Jun 2001 10:32:13 -0500 (CDT)
From: <djweis@sjdjweis.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] D310 boot messages
In-Reply-To: <20010605160653.L25745@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0106051030570.22868-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 5 Jun 2001, Richard Hirst wrote:
> On Tue, Jun 05, 2001 at 09:14:05AM -0500, djweis@sjdjweis.com wrote:
> > On Tue, 5 Jun 2001, Richard Hirst wrote:
> > > So with the nfsroot you have the D310 booting, but with the 0.9 ISO
> > > it stops after serial driver initialisation.
> > 
> > No, if I boot off the cd, I get IPL errors. When I netboot the kernel off
> > the cd, it stopped at serial init. I don't think it actually stopped, I
> > think it no longer printed but still booted.
> 
> Ah, ok.  I'd misunderstood you.  So the kernel on the CD is no
> different from the one you built yourself.  That's a relief!
> 
> Have you checked both serial ports, just in case the one the
> kernel finds isn't the one you are using?

I tried it once with no luck. I could try again with a different kernel,
but I am using serial1.

> >From the boot msgs you sent earlier, it looks like you turned
> SERIAL_DEBUG_AUTOCONF on.  Does it actually run the loopback
> test at serial.c:3671 successfully?

Based on the messages, I think so. I can try to put some other messages in
to print in the success case.

dave

-- 
Dave Weis             "I believe there are more instances of the abridgement
djweis@sjdjweis.com   of the freedom of the people by gradual and silent
                      encroachments of those in power than by violent 
                      and sudden usurpations."- James Madison
