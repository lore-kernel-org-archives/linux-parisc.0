Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 20CDC4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 17:45:44 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Alan Modra <alan@linuxcare.com.au>,
	"Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Subject: Re: [parisc-linux] Warnings compiling the CVS kernel
Date: Thu, 22 Feb 2001 01:47:58 +0100
Cc: PL <parisc-linux@lists.parisc-linux.org>
References: <Pine.LNX.4.21.0102221120430.14557-100000@front.linuxcare.com.au>
In-Reply-To: <Pine.LNX.4.21.0102221120430.14557-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Message-Id: <01022201475802.16704@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

On Thursday 22 February 2001 01:23, Alan Modra wrote:
> On Wed, 21 Feb 2001, Rafael E. Herrera wrote:
> > Alan Modra wrote:
> > > On Wed, 21 Feb 2001, Rafael E. Herrera wrote:
> > > > The compilation succeeds but the boot will crash here:
> > > >
> > > > [...]
> > > > POSIX conformance testing by UNIFIX
> > >
> > > Yeah, same result here (except I get a reboot).  I'm not sure yet
> > > whether this is due to bugs in gcc or the kernel.
> >
> > Let me know I there is something I can try. Thanks
>
> Seems to be a kernel problem, or at least not a new gcc problem.  I dug
> out an old gcc, and got the same results with yesterday's kernel sources.

CVS from 2001/02/16 is the last one, which worked for me (independed of the 
compiler!).

Helge.
