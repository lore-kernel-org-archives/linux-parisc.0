Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id B54244A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 17:23:46 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA14675;
	Thu, 22 Feb 2001 11:23:41 +1100
Date: Thu, 22 Feb 2001 11:23:41 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Cc: PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Warnings compiling the CVS kernel
In-Reply-To: <3A93ED8E.E33833CF@neuronet.pitt.edu>
Message-ID: <Pine.LNX.4.21.0102221120430.14557-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 21 Feb 2001, Rafael E. Herrera wrote:

> Alan Modra wrote:
> > On Wed, 21 Feb 2001, Rafael E. Herrera wrote:
> > > The compilation succeeds but the boot will crash here:
> > >
> > > [...]
> > > POSIX conformance testing by UNIFIX
> > 
> > Yeah, same result here (except I get a reboot).  I'm not sure yet whether
> > this is due to bugs in gcc or the kernel.
> 
> Let me know I there is something I can try. Thanks

Seems to be a kernel problem, or at least not a new gcc problem.  I dug
out an old gcc, and got the same results with yesterday's kernel sources.
