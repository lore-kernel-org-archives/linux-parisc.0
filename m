Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailin3.email.bigpond.com (unknown [139.134.6.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9F194482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Oct 2001 05:20:36 -0600 (MDT)
Received: from bubble.local ([144.135.24.69]) by
          mailin3.email.bigpond.com (Netscape Messaging Server 4.15) with
          SMTP id GLJZSX00.1CG for <parisc-linux@lists.parisc-linux.org>;
          Sun, 21 Oct 2001 21:26:57 +1000
Date: Sun, 21 Oct 2001 20:50:22 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fix for hppa-linux ld.so with newer binutils
Message-ID: <20011021205022.I1037@bubble.sa.bigpond.net.au>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au> <20011020140153.A17475@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011020140153.A17475@megatonmonkey.net>; from carlos@megatonmonkey.net on Sat, Oct 20, 2001 at 02:01:53PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Oct 20, 2001 at 02:01:53PM -0400, Carlos O'Donell Jr. wrote:
> 
> Why aren't .got entries being initialised?

The special reserved .got entries are still initialised.  The others
which have relocations don't need to be initialised as the reloc will
set the value.  It was only an accident that entries against _DYNAMIC
(_not_ the special reserved entry with the value of _DYNAMIC) were
previously being initialised.

> So you are saying we need to make all of our global symbols constant
> so that we can access them during the bootstrap? (No more _DYNMAIC?)
> 
> And that elf_machine_load_address is trying to access symbols that aren't
> setup yet, because ELF_DYNAMIC_RELOCATE() hasn't been run yet?
> And thus hasn't setup any of our offsets... where has my pic code gone ;(

As you say, the problem is solved by pic code, and that's exactly how
the new hppa version of elf_machine_dynamic works.

Note that glibc ld.so still has a problem on hppa if it ever hits any
of the asserts in dynamic-link.h:elf_get_dynamic_info, as these all try
to make reference to their string args at the unrelocated address.

Alan
