Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bastion.power-x.co.uk (bastion.power-x.co.uk [62.232.19.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id A438A482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 May 2001 05:23:51 -0600 (MDT)
Date: Thu, 17 May 2001 12:26:08 +0100 (BST)
From: "Dr. David Gilbert" <gilbertd@treblig.org>
To: "Bright, Stephen" <Stephen.Bright@thales-esecurity.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Booting from SCSI disk.
In-Reply-To: <9EB1F7B63758D411A78D00A0C9D84789B16BED@UKCRN03>
Message-ID: <Pine.LNX.4.33.0105171224381.23541-100000@springhead.px.uk.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 17 May 2001, Bright, Stephen wrote:

> Is it not possible to run fdisk and palo on the HP itself?  I have tried
> this, but when it boots I get a message along the lines of "Cannot grok the
> kernel executable" (sorry, this is quoted from memory, so may not be exactly
> correct).  Is there something preventing me doing this correctly?  Is an
> i386 with SCSI card still required to setup the boot disk correctly?

I managed to get this to work last weekend; I have a 712/30 and found that
a palo binary was included in the standard binary set and I'm pretty sure
that I used the image that I was previously using to net boot it with.

Dave
/---------------| +44-161-286-2000 Ex258 |-------------------------\
| Dr. David Alan Gilbert | Work:david.gilbert@powerxnetworks.com   |
| -------- G7FHJ --------|---------------------------------------- |
| Home: dave@treblig.org            http://www.treblig.org         |
\------------------------------------------------------------------/
