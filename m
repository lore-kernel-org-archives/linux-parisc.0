Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta02ps.bigpond.com (mta02ps.bigpond.com [144.135.25.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48749482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 08:34:53 -0600 (MDT)
Received: from bubble.local ([144.135.25.81]) by
          mta02ps.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GLIE4V00.63R for <parisc-linux@lists.parisc-linux.org>; Sun,
          21 Oct 2001 00:41:19 +1000
Date: Sun, 21 Oct 2001 00:04:44 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: Ben Collins <bcollins@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, randolph@tausq.org
Subject: Re: [parisc-linux] Re: Fix for hppa-linux ld.so with newer binutils
Message-ID: <20011021000443.H1037@bubble.sa.bigpond.net.au>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au> <20011020095406.L10952@visi.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011020095406.L10952@visi.net>; from bcollins@debian.org on Sat, Oct 20, 2001 at 09:54:06AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Oct 20, 2001 at 09:54:06AM -0400, Ben Collins wrote:
> On Sat, Oct 20, 2001 at 05:09:07PM +0930, Alan Modra wrote:
> > 	* sysdeps/hppa/dl-machine.h (elf_machine_dynamic):  Make it a
> > 	const function.  Do not use &_DYNAMIC as .got entries for global
> > 	syms are no longer initialised.  Instead they rely on the reloc,
> > 	which hasn't yet been applied.
> > 	(elf_machine_load_address): Make it const.  Call
> > 	elf_machine_dynamic as that function is called fropm rtld anyway.
> 
> Is this the fix for a newly built ld.so segfaulting? If so, there seems
> to be something else wrong too. Newly built ld.so still segfaults,
> here's the gdb:

alan@tea:~$ /lib/ld.so.1 
Usage: ld.so [OPTION]... EXECUTABLE-FILE [ARGS-FOR-PROGRAM...]
You have invoked `ld.so', the helper program for shared library executables.
[snip]

no problems here.

sourceware CVS binutils as of a few minutes ago, debian glibc-2.2.4-3
with willy's patch (ftp://ftp.parisc-linux.org/patches/glibc22-hppa.dpatch)
+ mine, gcc from pehc 3.0.2 20010829.

So, I'm using a newer binutils but older gcc.  The old gcc was an
accident - I'll try again with something more recent.  binutils, gcc and
glibc freshly built on an x86-linux system, first building xtools then
native ones.

> Program received signal SIGSEGV, Segmentation fault.
> 0x41003298 in _dl_start_final (arg=0xbff00414, bootstrap_map_p=0xbff00508, start_time=1090519040)
>     at rtld.c:233
> 233       _dl_rtld_map.l_addr = bootstrap_map_p->l_addr;
> (gdb) print bootstrap_map_p
> $1 = (struct link_map *) 0xbff00508
> (gdb) print bootstrap_map_p->l_addr
> $2 = 1090519040
> (gdb) print &_dl_rtld_map
> $3 = (struct link_map *) 0x41029270
> (gdb) print _dl_rtld_map.l_addr
> $4 = 0

That's weird.  Looks like _dl_rtld_map is in a read-only segment, when
it ought to be in .bss

alan@tea:~$ nm /lib/ld.so.1 | grep dl_rtld_map
00029368 b _dl_rtld_map
alan@tea:~$ objdump -h /lib/ld.so.1 | grep '\.bss'
 15 .bss          00000f9c  00029220  00029220  00019220  2**3

Hmm, I wonder if the machine instructions actually doing the assignment
have relocs that haven't been applied for some reason.  That would
probably result in your ld.so trying to write to 0x29270.
