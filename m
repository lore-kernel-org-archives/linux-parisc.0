Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA27300
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 May 1999 11:44:14 -0600
Date: Thu, 6 May 1999 11:42:19 -0700 (PDT)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199905061842.LAA11719@gatekeeper.equator.com>
To: adevries@redhat.com
Subject: Re: [parisc-linux] ld problem workaround
Cc: jason@gatekeeper.equator.com, parisc-linux@thepuffingroup.com
List-ID: <linux-parisc.vger.kernel.org>

> On Thu, 6 May 1999, Philipp Rumpf wrote:
> > 
> > Where are the bootloader sources atm ?
> > 
>
> Jason's sources are at:
>
> ftp://puffin.external.hp.com/pub/parisc/src/boot_rel_0.2.tar.gz
>
> I'm not quite sure how complete they are.  The pain is that because of our
> lack of ELF32 in binutils these really need to be linked on an HPUX box.
>


  The source is fairly complete in the sense that the bootstrap can load
  a kernel image and transfer control to it. If we had a linux kernel, it could
  be booted today.
  The source can also be considered less
  than complete in that it just reads the kernel from a fixed location on
  the media -- for simplicity, to get linux up and running. Alex and
  chris have suggested (and this was a thought all along) to have the booter
  load the kernel from an ext2 file system. With more time, that can be
  done. It's a bit painful since it involves a stand alone extfs (read only)
  implementation. Hopefully, we can re-use much of the standard linux code,
  but I haven't thought about this in detail yet.

  Jason.
