Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id DAA00915
	for <parisc-linux@puffin.external.hp.com>; Fri, 24 Sep 1999 03:59:54 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: parisc-linux@thepuffingroup.com,
        Alex deVries <adevries@thepuffingroup.com>, phi@tcleur.france.hp.com
Subject: Re: [parisc-linux] 715/80 problems
Date: Fri, 24 Sep 1999 11:42:13 +0200
Content-Type: text/plain
Cc: parisc-linux@thepuffingroup.com
References: <37E917A0.CEBD1D71@thepuffingroup.com>
MIME-Version: 1.0
Message-Id: <99092412012906.00271@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Wed, 22 Sep 1999 schrieb Alex deVries:
> phi@tcleur.france.hp.com wrote:
> > 
> > With the regression that occured after 14 september  1999, or so (20
> > septembre is wrong, 14 setp is good), I can't use it anymore.
> > 
> > I'm think about a newfs to regain the full HFS capacity unless one of
> > you can tell me this will be put back as it was before. For now I assume
> > the vmlinux is not supposed to boot from isl> hpux right?
> 
> It's *supposed to* work, but it doesn't.
> 
> Ah, okay.  This means that we should just be able to see what changed on
> Sept. 14 and figure out what to fix.
> 
> Is anyone interested in fixing this?

Hi Philippe,
Hi Alex.

I´m not really sure, but maybe I know why it doesn´t boot any longer.
Phi, could you look in the file arch/parisc/Makefile in the section
LDFLAGS=-R<yyy>  if your working version has <yyy> as 0x10000 and your
non-working version has 0xC0010000. If yes, then it shows that the
hpux-bootloader isn´t able to load our kernel into the virtual space at
0xC0000000 and directly stops [segfaults?] without any message. One possible
solution could be, to patch the contents of the vmlinux-file at offsets 0x18,
(0x28??), 0x8A and 0x98 with &= 0xFFFFFFF (without C0). Please take a look in
the som.h-file, which contents have to be patched !  This way the hpux-loader
could load the kernel to the correct adress-room and the kernel
(already) automatically sets up the virtual adress-mapping.
In our own bootloader we read the contents of this header too and use the
"ADJ_LOW"-Function to get the correct adresses before loading the kernel.

Sure, maybe I´m totally wrong !

Helge Deller.

> 
> - Alex
