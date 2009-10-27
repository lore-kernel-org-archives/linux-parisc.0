From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Out of order unwind entry warning
Date: Tue, 27 Oct 2009 19:19:08 -0400 (EDT)
Message-ID: <20091027231909.74AEF4E0B@hiauly1.hia.nrc.ca>
References: <4AE620E0.9040809@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, carlos@systemhalted.org,
	randolph@tausq.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AE620E0.9040809@gmx.de> from "Helge Deller" at Oct 26, 2009 11:21:20 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> 
> I started to look into the problem why we get the
> > WARNING: Out of order unwind entry!
> warning messages at kernel bootup in dmesg.
> 
> It's related to a binutils/linker bug, that ld does not correctly
> removes unlink information for unused weak symbols, which have been
> replaced by their non-weak ones.
> 
> In my kernel I could track it down to 2 symbols:
> - arch_mod_section_prepend()  from kernel/module.c, and
> - save_stack_trace_tsk().
> 
> Here is the extract of the readelf output on vmlinux:
> ...
> <inb>: [0x1011fbd4-0x1011fc48]
>          Entry_GR=1 Save_SP Save_RP Total_frame_size=8
> <arch_mod_section_prepend>: [0x1011fc4c-0x1011fc74]
>          Entry_GR=1 Save_SP Total_frame_size=8
> <arch_mod_section_prepend>: [0x1011fc4c-0x10167cf4]
>          Entry_GR=1 Save_SP Total_frame_size=8
> <module_arch_cleanup>: [0x1011fc78-0x1011fcb8]
>          Entry_GR=2 Save_SP Save_RP Total_frame_size=8
> ...

It might be useful to know the actual location arch_mod_section_prepend
and whether it follows inb in its .o.  From my understanding of things,
it shouldn't be necessary to remove the unwind info for unused weak
symbols if they aren't garbage collected.  A simple testcase would
be helpful.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
