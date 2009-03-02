From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: can't compile kernel for parisc
Date: Mon, 2 Mar 2009 12:20:04 -0500 (EST)
Message-ID: <20090302172005.A0B8E4ED1@hiauly1.hia.nrc.ca>
References: <a4423d670903020813k5c67749du7070ce31d44ab3e7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: a.beregalov@gmail.com (Alexander Beregalov)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670903020813k5c67749du7070ce31d44ab3e7@mail.gmail.com> from "Alexander Beregalov" at Mar 2, 2009 07:13:29 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Thanks for you help
> Is it more clear?

Yes.  This is good stuff.

> #6  0x40074c94 in elf32_hppa_relocate_section (output_bfd=0x78d28,
> info=0x68c00, input_bfd=0xd9060, input_section=0xf21c0,
>     contents=0x43571008 "cows can fly", relocs=0x12b520,
> local_syms=0x1891808, local_sections=0x1b350d8)

The bug is in this bit of code:

          (*_bfd_error_handler)
	    (_("%B(%A+0x%lx): cannot reach %s, recompile with -ffunction-sections"),
	      hsh->target_section->owner,
	      stub_sec,
	      (long) hsh->stub_offset,
	      hsh->bh_root.string);

Either hsh->target_section->owner or hsh->bh_root.string is NULL.  Could
you put a break on this line and print the struct hsh in gdb?

> Should I really recompile glibc with -ffunction-sections ?

It probably will help.  If you are building for a PA 2.0 machine,
-mpa-risc-2-0 may also help as the branch the branch distance for
pc-relative calls is much bigger.

I thought -ffunction-sections was always used for kernel builds.

It's a bit of a puzzle as to why this error is triggered.  I think
this is coming from ./arch/parisc/kernel/traps.c.  I wouldn't have
thought the text in this file is large enough to trigger this error.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
