Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F0E8482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  1 Jun 2001 16:54:17 -0600 (MDT)
Message-ID: <3B181D15.3D162B59@hp.com>
Date: Fri, 01 Jun 2001 18:54:13 -0400
From: Chuck Slivkoff <charles_slivkoff@hp.com>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Upgrade path from 0.6 to 0.9?
References: <3B180D83.F5479D0B@hp.com> <20010601225956.K7349@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> On Fri, Jun 01, 2001 at 05:47:47PM -0400, Chuck Slivkoff wrote:
> > I'm thinking I need to update the kernel, but I'd like to not have to
> > reload this from scratch.  I can pull the kernel from the 0.9 ISO, but
> > PALO didn't seem to be too intuitive.
> 
> You do have to update your kernel in order to run glibc 2.2.3, due to
> the changes in how stacks are managed for threads.  I don't think palo
> is too unintuitive...

RTFM, I know. I updated the kernel from the ISO image (mounted via
loopback on a RH 7.0 system) and I was able to fix the problem I was
having. I added the ISO image to "sources.list" & have "apt-get upgrade"
running so far without a hitch.

Wahoo!

-chuck

P.S. The confustion I had about PALO, was wether or not it needed to be
run (like LILO) after changing /boot/vmlinux. The answer, BTW, is "no".
