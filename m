Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id B3FD9482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 12:57:25 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Matthew Wilcox <willy@debian.org>, nick@snowman.net
Subject: Re: [parisc-linux] C180 netbooting
Date: Thu, 23 Aug 2001 20:57:17 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <Pine.LNX.4.21.0108231256390.16296-100000@ns> <20010823193847.B27374@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20010823193847.B27374@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <20010823185725.B3FD9482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Thursday 23 August 2001 20:38, Matthew Wilcox wrote:
> On Thu, Aug 23, 2001 at 12:58:34PM -0400, nick@snowman.net wrote:
> > Hi, I'm trying to get a C180 booting entirely off the network.  I can
> > load a lifimage over bootp, however then I'm stuck.  There is a vmlinux
> > attached to the lifimage, but I can't figure out how to tell the loader
> > to boot that and use an NFSroot.  I have found a few suggestions (vmlinux
> > HOME=/ TERM=linux root=/dev/nfs nfsroot=mynfs:/dir) and that dosen't seem
> > to work.  Do I need a special lifimage?
>
> Well, I do this all the time, so it does work :-)  All I need to do is
> change the NFSROOT in palo's Makefile to my server's IP address.  I'm
> still crosscompiling; my string looks like this:
> 0/vmlinux64 HOME=/ TERM=linux root=/dev/nfs nfsroot=15.1.50.190 ip=bootp

I think this is the point. If you hardcode it in the Makefile and boot this lifimage
directly without user-interaction (bo lan ipl) it works. If you try to change it at
the prompt it won't boot. (I've just tested that)

Helge
