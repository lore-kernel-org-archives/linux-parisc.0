Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from blimpo.internal.net (ppp01.ts1-1.NewportNews.visi.net [209.8.196.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F99E482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 09:01:26 -0600 (MDT)
Date: Sat, 20 Oct 2001 11:01:23 -0400
From: Ben Collins <bcollins@debian.org>
To: parisc-linux@lists.parisc-linux.org, randolph@tausq.org
Subject: Re: [parisc-linux] Re: Fix for hppa-linux ld.so with newer binutils
Message-ID: <20011020110123.M10952@visi.net>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au> <20011020095406.L10952@visi.net> <20011021000443.H1037@bubble.sa.bigpond.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011021000443.H1037@bubble.sa.bigpond.net.au>
Sender: Ben Collins <bmc@visi.net>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Oct 21, 2001 at 12:04:44AM +0930, Alan Modra wrote:
> On Sat, Oct 20, 2001 at 09:54:06AM -0400, Ben Collins wrote:
> > On Sat, Oct 20, 2001 at 05:09:07PM +0930, Alan Modra wrote:
> > > 	* sysdeps/hppa/dl-machine.h (elf_machine_dynamic):  Make it a
> > > 	const function.  Do not use &_DYNAMIC as .got entries for global
> > > 	syms are no longer initialised.  Instead they rely on the reloc,
> > > 	which hasn't yet been applied.
> > > 	(elf_machine_load_address): Make it const.  Call
> > > 	elf_machine_dynamic as that function is called fropm rtld anyway.
> > 
> > Is this the fix for a newly built ld.so segfaulting? If so, there seems
> > to be something else wrong too. Newly built ld.so still segfaults,
> > here's the gdb:
> 
> alan@tea:~$ /lib/ld.so.1 
> Usage: ld.so [OPTION]... EXECUTABLE-FILE [ARGS-FOR-PROGRAM...]
> You have invoked `ld.so', the helper program for shared library executables.
> [snip]
> 
> no problems here.
> 
> sourceware CVS binutils as of a few minutes ago, debian glibc-2.2.4-3
> with willy's patch (ftp://ftp.parisc-linux.org/patches/glibc22-hppa.dpatch)
> + mine, gcc from pehc 3.0.2 20010829.
> 
> So, I'm using a newer binutils but older gcc.  The old gcc was an
> accident - I'll try again with something more recent.  binutils, gcc and
> glibc freshly built on an x86-linux system, first building xtools then
> native ones.

The binutils may be the difference. I think Randolph said there was a
patch in CVS that was needed. I'll wait and see if that new package
works.

-- 
 .----------=======-=-======-=========-----------=====------------=-=-----.
/                   Ben Collins    --    Debian GNU/Linux                  \
`  bcollins@debian.org  --  bcollins@openldap.org  --  bcollins@linux.com  '
 `---=========------=======-------------=-=-----=-===-======-------=--=---'
