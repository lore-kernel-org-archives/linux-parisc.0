Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA24493
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Oct 1999 09:21:43 -0600
Message-Id: <199910281522.LAA06762@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] hack to use HPUX boot loader
To: Helge.Deller@ruhr-uni-bochum.de (Helge Deller)
Date: Thu, 28 Oct 1999 11:22:21 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com, bame@debian.fc.hp.com
In-Reply-To: <99102800052200.00292@P100> from "Helge Deller" at Oct 28, 99 00:02:07 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> Am Wed, 27 Oct 1999 schrieb Paul Bame:
> > = 
> > = Has anyone confirmed that the kernel which is started is getting good
> > = data (stack, etc...) or are my kernels booting purely by accident?
> > = 
> > 
> > Phillip looked over some boot messages after being booted with the
> > hpux boot loader and blessed them, so things appear to be working well.

I find it very strange that the kernel is being linked to start at
0xc0010000.  It's not your average machine that has this much physical
memory.  I have recently been in the bowels of hpux and it certainly isn't
linked in this strange way.  It is linked and loaded into low physical
memory.  Interrupts are first handled without address translation and
then most switch to virtual.  If this kind of relocation is needed,
can't it be done in virtual mode with a space register mapping?  The
other major issue is how to impliment shared memory.  Under hpux, it
is always in the 3rd quadrant.  This breaks mmap usage in many apps.

Paul's hack prevents one from using kernel symbols when debugging with
a symbolic debugger.  I think this is a rather useful feature to have.

Comments?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
