Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lune.perinfo.com (AStrasbourg-201-2-1-11.abo.wanadoo.fr [193.251.1.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id A96224A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Feb 2001 01:45:17 -0700 (MST)
From: "Florent Guiliani" <fguiliani@perinfo.com>
To: "'Helge Deller'" <deller@gmx.de>,
	"'Matthew Wilcox'" <matthew@wil.cx>,
	"'Scott Eggert'" <seggert@tds.net>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] E25 lock-up during boot.
Date: Mon, 19 Feb 2001 09:44:35 +0100
Message-ID: <000c01c09a50$30250e90$6400030a@florent>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <01021811393800.31489@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

How to replace the kernel by a newer in a bootable ISO file ?

> -----Message d'origine-----
> De : parisc-linux-admin@lists.parisc-linux.org
> [mailto:parisc-linux-admin@lists.parisc-linux.org]De la part de Helge
> Deller
> Envoyé : dimanche 18 février 2001 11:40
> À : Matthew Wilcox; Scott Eggert
> Cc : parisc-linux@lists.parisc-linux.org
> Objet : Re: [parisc-linux] E25 lock-up during boot.
>
>
> On Sunday 18 February 2001 02:52, Matthew Wilcox wrote:
> > On Sat, Feb 17, 2001 at 07:09:37PM -0600, Scott Eggert wrote:
> > > I am attempting to ge PA installed on a HP9000 E25.  I am
> able to boot
> > > from the 0.5 CD image, however it locks-up during the
> boot.  Any ideas?
> >
> > Which part of `E class is not supported' is hard to understand?  :-)
> >
> > > Searching for devices in PDC firmware... processor hpa 0xfffbe000
> > > a newer box...
> > > Found devices:
> > > 1. Orville UX Core BA (11) at 0xf0100000, versions 0x12,
> 0x0, 0x81, 0x0,
> > > 0x0 2. Orville Core Lan (802.3) (10) at 0xf0107000,
> versions 0x12, 0x0,
> > > 0x8a, 0x0, 0 x0
> > > That's a total of 2 devices.
> > > No CPUs reported by firmware - probing...
> > > Found CPU at fffbe000
> > > POSIX conformance testing by UNIFIX
> > > Lasi version 0 at 0xf0100000 found.
> >
> > Having said that, I bet this is the same problem as FAQ 9:
> >
> > I'm booting parisc linux on an early Series 700 workstation, and the
> > machine hangs after printing:
> >
> > ASP version 1 at ..... found
> >
> > What's going on?
> >
> > This was a bug in the parallel port driver, which was fixed
> in CVS on
> > 2000-11-29. You can workaround the problem by using a newer
> kernel or
>
> The FAQ is wrong at this point.
> You will need a kernel which is newer than 2001-02-16
> (http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2001
> -February/028548.html)
> Maybe I should fix the FAQ again ASAP :-)
>
> > by reconfiguring your kernel and removing support for the
> parallel port
> > (CONFIG_PARPORT_GSC).
> >
> >
> > But... there's no Lasi in an E-class.  Something's wrong
> with our detection
> > routines, perhaps.  I admit to being curious about the
> `Core Lan' that's
> > reported -- maybe it'll work.
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
