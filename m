Return-Path: <hppa-linux@puffingroup.com>
Message-Id: <199902161901.LAA01418@meow.sr.hp.com>
Subject: Re: [hppa-linux] Booting issues.
In-Reply-To: <Pine.LNX.3.96.990216125227.22132L-100000@devserv.devel.redhat.com> from Alex deVries at "Feb 16, 1999  1: 1:39 pm"
To: hppa-linux@puffingroup.com
Date: Tue, 16 Feb 1999 11:01:41 -0800 (PST)
From: Bill Katz <billk@sr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Resent-Message-ID: <"vmcxQ.0.Io4.Z4Sos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

> 
> On Tue, 16 Feb 1999, Jason Eckhardt wrote:
> > > I was hoping someone could explain how booting works on HPs in the
> > > following ways:
> > > - booting from disk; is it possible to put our boot image onto an existing
> > > hpux disk, and boot from that image?
> > 
> >   By "boot image" do you mean the bootstrap program or the kernel? I think
> >   we could load the (future) kernel from an HPUX disk via HP's ISL, but it
> >   would probably have to be in SOM format. Of course, I don't know for sure.
> 
> Well, I meant kernel, but that may not have ben what I should have been
> asking.
> 
> What's SOM?

Spectrum Object Module.  The format of PA-RISC executables.  It dates
from the early days, when the project to produce the "HP Precision
Architecture" was known as the "SPectrum" project.

> >   The next step is to get the simple bootstrap to load a kernel image. Maybe
> >   someone can help me understand what to do next. Issues:
> >     1. Should the bootloader be very simple and just load the kernel image
> >        from a known place on the disk, such as immediately following the
> >        bootstrap code (I believe the i386 version works this
> >        way, correct me if I'm wrong) or should we instead load the kernel from
> >        a Linux filesystem. The later
> >        is a bit of a pain as it means we must have a standalone version
> >        of a filesystem code in the bootloader (at least open, close, read,
> >        seek, stat). The Mklinux works this way -- the boot code is huge...it
> >        seems to me to be unnecessarily large and complex for a bootloader.
> > 
> >        The first idea is much easier, since we just read from the already
> >        open boot device (opened by the PDC) from a fixed location and then
> >        branch to the kernel code.
> > 
> >        Comments?
> 
> I'd say start with the first, then worry about the second later.  Having
> the boot loader be able to read ext2 would be cool, but large.

HPUX uses the second approach, and if there is a goal to allow Linux
and HPUX to reside on the same physical mechanism, you'd need to
duplicate that facility in the Linux secondary loader.  One could
then include both the HPUX and Linux secondary loaders in the LIF
volume, and boot wither from the BootROM command line.  We call
that the BCH or Boot Console Handler.


	-Bill

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
