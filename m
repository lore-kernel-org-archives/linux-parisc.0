Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA10608
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Oct 2000 00:19:11 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 24 Oct 2000 06:20:40 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA06176;
	Tue, 24 Oct 2000 17:19:17 +1100
Date: Tue, 24 Oct 2000 17:19:17 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John Marvin <jsm@udlkern.fc.hp.com>
cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: Bug in shared libraries
In-Reply-To: <Pine.LNX.4.21.0010241541510.11525-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0010241707160.11525-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 24 Oct 2000, Alan Modra wrote:

> The problem occurs when ld.so is relocating itself, ie. during
> ELF_DYNAMIC_RELOCATE (&bootstrap_map, 0, 0).  I looked at fixing the
> dynamic linker, but it's a complete pain to do as a lot of things aren't
> set up at bootstrap stage.  _Much_ easier to fix the compiler as per the
> following diff.  I've tested this on hppa-linux, and a newly built glibc
> has no .rela.rodata in ld.so or libc.so.

Um, that's only half the problem solved.  The other difficulty is with the
.PARISC.unwind section which happens to be read-only and full of DIR32
relocs for hppa-linux.  hppa64-linux uses SEGREL relocs, which don't need
to be copied to shared libs since as their name implies, they are
relative.

I'm inclined to change the 32-bit ELF unwind section over to using SEGREL
relocs too.  Since gdb support isn't finished yet, we won't be breaking
anything.  Comments?

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
