Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2A04482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Jun 2001 06:45:20 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id D5FDEB007; Wed, 13 Jun 2001 13:40:56 +0100 (BST)
Date: Wed, 13 Jun 2001 13:40:56 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sticon/sercon patch for new bootfloppies...
Message-ID: <20010613134056.E16532@linuxcare.com>
References: <20010613002536.AB3E8482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010613002536.AB3E8482A@dsl2.external.hp.com>; from deller@gmx.de on Wed, Jun 13, 2001 at 02:24:49AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jun 13, 2001 at 02:24:49AM +0200, Helge Deller wrote:
> Hi,
> 
> the attached patch enables only those consoles, which are given on the linux 
> kernel command line.
> Examples: "console=tty0" activates STIcon only, "console=ttyS0" activates 
> serial console only and if you use both on the commandline you will get the 
> system messages on both consoles.
> 
> Known bugs: 
> - STIcon will not show any messages which happened before the STI
> 	initialisation


Just tried a kernel with serial console, sti console, and sti fb all
compiled in, with palo/unstable.  Seems to do the right thing on my B180 :)

The kernel knows it cannot support b180 fb, so uses sti console automatically
but this kernel should use sti fb on those machines that we support.

I left the b180 alone until the "screen blanking" cut in.  It just turns
off the cursor, btw, doesn't blank the screen.

When I came back to it the cursor had gone back to top-left, and all
chars are printed as blobs of garbage.  System is still happy apart from
that.

I think the cursor going to top-left on a screen blank is a result of
your last lot of bug fixes, but not certain of that.

The other thing for people to note is that if you specify both
console=ttyS0 and console=tty0, then the order is important.  The
real console is the second one you specify, the other just gets
a copy of boot messages (all kernel printk's, I guess).

Richard
