Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA09736
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Jun 1999 11:18:19 -0600
Date: Tue, 1 Jun 1999 19:18:00 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Christopher Beard <cjbeard@istar.ca>, parisc-linux@thepuffingroup.com
Subject: Re: Building the Bootloader
Message-ID: <19990601191800.C25364@suse.de>
References: <Pine.LNX.4.10.9906011146400.24972-100000@centauri.osfi-bsif.gc.ca> <199906011644.MAA25119@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199906011644.MAA25119@hiauly1.hia.nrc.ca>; from John David Anglin on Tue, Jun 01, 1999 at 12:44:46PM -0400
List-ID: <linux-parisc.vger.kernel.org>

> If the IPL could be extracted from an ELF binary, then it could be produced
> on any system which supports cross compiling to HP/UX ELF format.

The problem (unless for the confused ones Christopher just showed the light)
is the GNU binutils seem to be buggy at the moment.

> There also seems to be some confusion about the kernel and its format.
> In order to debug it, it needs to be either an ELF or SOM binary with
> symbol tables, .stabs info, etc.

In practice, a System.map should be enough and we don't need to keep an ELF
binary on the disk.

> Although I haven't looked at the IPL, I would guess that it is designed to
> load an ELF binary.

It isn't. Currently the IPL is stored with a raw kernel image to load and
some pointers. Once we have something to boot, we can have a look at how
aboot and other bootloaders handle the situation (and steal their code of
course).

> > I haven't looked at this very closely, but when I attempted to generate a
> > raw binary of the bootloader code with the xcompiler/binutils it either
> > segfaulted or generated a 4 GB sparse file. There was a double free within
> > binutils which was fixed, and some minor version mismatches, but still, it
> > does not generate a working binary.

> Obviously, the bootloader will be a pain to debug.  I think that I have
> a working cross compiler running under hpux to produce ELF object files
> and binaries.  I had a problem with ld which went away when I rebuilt
> binutils with no optimization (-O0).

We need to get to the point where we can safely cross-compile for parisc machines
on i386. My experience with binutils / bfd is rather limited, so I wait for some-
one else to do it...
