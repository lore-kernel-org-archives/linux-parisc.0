Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 27D824A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Feb 2001 03:38:19 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Matthew Wilcox <matthew@wil.cx>, Scott Eggert <seggert@tds.net>
Subject: Re: [parisc-linux] E25 lock-up during boot.
Date: Sun, 18 Feb 2001 11:39:38 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <20010217134443.B0E4081DD@dsl2.external.hp.com> <3A8F20D1.20B10E28@tds.net> <20010218015215.E899@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20010218015215.E899@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <01021811393800.31489@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sunday 18 February 2001 02:52, Matthew Wilcox wrote:
> On Sat, Feb 17, 2001 at 07:09:37PM -0600, Scott Eggert wrote:
> > I am attempting to ge PA installed on a HP9000 E25.  I am able to boot
> > from the 0.5 CD image, however it locks-up during the boot.  Any ideas?
>
> Which part of `E class is not supported' is hard to understand?  :-)
>
> > Searching for devices in PDC firmware... processor hpa 0xfffbe000
> > a newer box...
> > Found devices:
> > 1. Orville UX Core BA (11) at 0xf0100000, versions 0x12, 0x0, 0x81, 0x0,
> > 0x0 2. Orville Core Lan (802.3) (10) at 0xf0107000, versions 0x12, 0x0,
> > 0x8a, 0x0, 0 x0
> > That's a total of 2 devices.
> > No CPUs reported by firmware - probing...
> > Found CPU at fffbe000
> > POSIX conformance testing by UNIFIX
> > Lasi version 0 at 0xf0100000 found.
>
> Having said that, I bet this is the same problem as FAQ 9:
>
> I'm booting parisc linux on an early Series 700 workstation, and the
> machine hangs after printing:
>
> ASP version 1 at ..... found
>
> What's going on?
>
> This was a bug in the parallel port driver, which was fixed in CVS on
> 2000-11-29. You can workaround the problem by using a newer kernel or

The FAQ is wrong at this point.
You will need a kernel which is newer than 2001-02-16 
(http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2001-February/028548.html)
Maybe I should fix the FAQ again ASAP :-)

> by reconfiguring your kernel and removing support for the parallel port
> (CONFIG_PARPORT_GSC).
>
>
> But... there's no Lasi in an E-class.  Something's wrong with our detection
> routines, perhaps.  I admit to being curious about the `Core Lan' that's
> reported -- maybe it'll work.
